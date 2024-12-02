<%-- 
    Document   : VistaAdmin1
    Created on : 2 dic. 2024, 16:24:38
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Panel de Control del Administrador</title>
    <link rel="stylesheet" href="CSS/Cadminmesas.css">
</head>
<style></style>

<body>
    <div class="back-link">
        <a href="index.html">Cerrar Sesión</a>
    </div>
    <div class="admin-dashboard">
        <header>
            <h1>Panel de Control de las Mesas</h1>
        </header>
        <section class="dashboard-controls">
            <button class="btn add-table">Agregar Mesa</button>
            <button class="btn report">Generar Reporte de Ocupación</button>
        </section>
        <section class="reservations-view">
            <h2>Reservas</h2>
            <table class="reservations-table">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Número de Personas</th>
                        <th>Número de Mesa</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!--  reservas cargadas dinámicamente -->
                    <tr>
                        <td>25/11/2024</td>
                        <td>20:00</td>
                        <td>4</td>
                        <td>Mesa 3</td>
                        <td class="status available">Disponible</td>
                        <td>
                            <button class="btn edit">Editar</button>
                            <button class="btn block">Bloquear</button>
                        </td>
                    </tr>
                    <!-- más filas -->
                </tbody>
            </table>
        </section>
    </div>
</body>

</html>