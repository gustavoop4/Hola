package modelo;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtiene los parámetros del formulario
        System.out.println("Servlet ejecutado");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        System.out.println("Correo recibido: " + correo);
        System.out.println("Contraseña recibida: " + password);

        // Verifica si los parámetros no están vacíos
        if (correo == null || password == null) {
            request.setAttribute("errorMessage", "Por favor, ingrese ambos campos.");
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
            return;
        }

        // Conexión y consulta
        try (Connection conn = DatabaseConnection.getConnection()) {  // Usar la clase DatabaseConnection para obtener la conexión
            // Verificación de la conexión
            System.out.println("Conexión a la base de datos exitosa");

            // SQL para verificar usuario y contraseña
            String sql = "SELECT * FROM USUARIOS WHERE emailUsuario = ? AND claveUsuario = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, correo);  // Establece el valor del correo
                stmt.setString(2, password);  // Establece el valor de la contraseña

                // Ejecuta la consulta
                ResultSet rs = stmt.executeQuery();
                
                // Verifica si se encontró un usuario con ese correo y contraseña
                if (rs.next()) {
                    int rol = rs.getInt("rol");  // Obtiene el rol del usuario
                    
                    if (rol == 0) {
                        // Si es un usuario regular, redirige a la página de bienvenida
                        response.sendRedirect("Reservar1.jsp");
                    } else {
                        // Si no es un usuario regular (rol != 0), muestra mensaje de error
                        request.setAttribute("errorMessage", "Acceso denegado: no es un usuario regular");
                        request.getRequestDispatcher("/Login.jsp").forward(request, response);
                    }
                } else {
                    // Si no se encuentra el usuario o la contraseña no coincide, muestra mensaje de error
                    System.out.println("Correo o contraseña incorrectos");
                    request.setAttribute("errorMessage", "Correo o contraseña incorrectos");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            // Captura el error específico de la conexión y muestra el mensaje de error
            e.printStackTrace();  // Muestra el stack trace en la consola del servidor
            System.out.println("Error al ejecutar la consulta: " + e.getMessage());  // Mensaje detallado del error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al ejecutar la consulta SQL: " + e.getMessage());
        } catch (Exception e) {
            // Captura cualquier otro tipo de error no previsto
            e.printStackTrace();
            System.out.println("Error inesperado: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inesperado: " + e.getMessage());
        }
    }
}