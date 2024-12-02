package modelo;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "Reservar1", urlPatterns = {"/Reserva1"})
public class Reservar1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String personas = request.getParameter("personas");

        if (fecha == null || hora == null || personas == null || fecha.isEmpty() || hora.isEmpty() || personas.isEmpty()) {
            request.setAttribute("errorMessage", "Por favor, complete todos los campos.");
            request.getRequestDispatcher("ConsultaMesas.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT m.idMesa, m.capacidadMesa, m.descripMesa, " +
                         "CASE WHEN d.idMesa IS NOT NULL THEN 'Ocupada' ELSE 'Disponible' END AS estado " +
                         "FROM MESAS m " +
                         "LEFT JOIN DISPONIBILIDADES d " +
                         "ON m.idMesa = d.idMesa " +
                         "AND d.fechaReserva = ? " +
                         "AND ABS(DATEDIFF(MINUTE, d.horaReserva, ?)) <= 90 " +
                         "AND d.disponib = 0 " +
                         "WHERE m.lugar = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, fecha);
                stmt.setString(2, hora);
                stmt.setString(3, personas);

                ResultSet rs = stmt.executeQuery();

                request.setAttribute("mesas", rs);
                request.getRequestDispatcher("Mesas.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error al consultar las mesas: " + e.getMessage());
            request.getRequestDispatcher("Reservar1.jsp").forward(request, response);
        }
    }
}