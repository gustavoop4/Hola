<%-- 
    Document   : Registro
    Created on : 2 dic. 2024, 16:51:22
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
</head>
<body>
    <h2>Formulario de Registro</h2>

    <!-- Mostrar mensaje -->
    <c:if test="${not empty mensaje}">
        <p><strong>${mensaje}</strong></p>
    </c:if>

    <form action="Registro" method="post">
        <div>
            <label for="correo">Correo Electrónico:</label>
            <input type="email" id="correo" name="correo" required>
        </div>
        <div>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
        </div>
        <div>
            <label for="apellido">Apellido</label>
            <input type="text" id="apellido" name="apellido" required>
        </div>
        <div>
            <label for="dni">dni</label>
            <input type="text" id="dni" name="dni" required>
        </div>
        <div>
            <label for="celular">celular</label>
            <input type="text" id="celular" name="celular" required>
        </div>
        <button type="submit">Registrar</button>
    </form>
</body>
</html>

