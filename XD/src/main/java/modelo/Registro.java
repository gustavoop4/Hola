package modelo;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Registro", urlPatterns = {"/Registro"})

public class Registro extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String clave = request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String celular = request.getParameter("celular");
            
        
        // Configuración de la conexión a la base de datos
        
        String mensaje = "";
        
        // Validación de los datos
        if (correo == null ||  clave == null || nombre == null || apellido==null || dni==null) {
            mensaje = "Por favor, ingresa todos los datos.";
            request.setAttribute("mensaje", mensaje);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Registro.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Conexión a la base de datos
        try (Connection conn = DatabaseConnection.getConnection()) {
            // Query para insertar el usuario
            String sql = "INSERT INTO USUARIOS (nomUsuario,apeUsuario,dniUsuario,emailUsuario,claveUsuario,celUsuario) VALUES (?,?,?,?,?,?) ";
            
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1,nombre);
                statement.setString(2,apellido);
                statement.setString(3,dni);
                statement.setString(4,correo);
                statement.setString(5,clave);
                statement.setString(6,celular);
                
                int rowsInserted = statement.executeUpdate();
                
                if (rowsInserted > 0) {
                    mensaje = "¡Registro exitoso!";
                } else {
                    mensaje = "Ocurrió un error al registrar el usuario.";
                }
            }
        } catch (SQLException e) {
            mensaje = "Error en la conexión con la base de datos: " + e.getMessage();
        }

        // Redirigir a la página de registro con un mensaje
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Registro.jsp");
        dispatcher.forward(request, response);
    }
}

