<%-- 
    Document   : LoginAdmin
    Created on : 2 dic. 2024, 16:21:52
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Login de usuario</title>
    <link rel="stylesheet" href="CSS/Clogin.css">
</head>
<style>
    body {
        margin: 0;
        padding: 0;
        background: url(img/forestBG.jpeg) no-repeat center top;
        background-size: cover;
        font-family: sans-serif;
        height: 100vh;
        font-family: 'Playfair Display', serif;
    }
</style>

<body>
    <div class="login-box">
        <img src="img/culebritica_panzona2.0.jpeg" class="avatar" alt="Logo Panzón">
        <h1>Iniciar sesión como admin</h1>
        <form action="LoginAdmin" method="post">
            <label for="correo">Email:</label>
            <input type="email" placeholder="Ingrese su email" name="correo" required>
            <label for="password">Contraseña:</label>
            <input type="password" placeholder="Ingrese su contraseña" name="password" required>
            <input type="submit" value="Entrar">
            <a href="#">¿Olvidó su contraseña?</a><br>
            <a href="LogIn.html">Ingresar como usuario</a>
        </form>
    </div>
</body>

</html>
