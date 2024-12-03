package modelo;

import com.google.gson.Gson;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/horariosDisponibles")
public class Reservar1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try {
            // Simulamos obtener las horas desde la base de datos
            List<String> horasDisponibles = List.of(
                "12:30", "13:00", "13:30", "14:00", "14:30", 
                "15:00", "15:30", "16:00", "16:30", "17:00", 
                "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30"
            );
            String json = new Gson().toJson(horasDisponibles); // Usar Gson para generar JSON
            out.print(json);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String horaSeleccionada = request.getParameter("hora");
        
        String fechaSeleccionada = request.getParameter("fecha");
        System.out.println(horaSeleccionada);
        System.out.println(fechaSeleccionada);
        request.getRequestDispatcher("Mesas.jsp").forward(request, response);
        response.getWriter().write("Reserva guardada con éxito!");
    }
}
