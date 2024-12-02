<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fecha</title>
    <link rel="stylesheet" href="CSS/Ddatos.css">
    <link rel="stylesheet" href="CSS/Dheader.css">
    <link rel="stylesheet" href="CSS/Dfooter.css">
    <script>
        window.onload = function () {
            const today = new Date().toISOString().split("T")[0];
            document.getElementById("fecha").setAttribute("min", today);
        };
    </script>
</head>
<body>
   <header class="header">
        <div class="logo">
            <a href="index.html"><img src="img/culebritica_panzona2.0.jpeg" alt="Logo Panzón"></a>
        </div>  
        <nav>
            <ul class="nav-links">
                <li><a href="index.html">Nosotros</a></li>
                <li><a href="index.html">Servicios</a></li>
                <li><a href="index.html">La Carta</a></li>
            </ul>
        </nav>
        <a href="ReservasUsuario.html" class="btn"><button>Mis Reservas</button></a>
    </header>   
    <div class="green-box"> ¡ESCOJA LA FECHA Y HORA DE SU VISITA!</div>
    <div class="image-container">
        <img src="https://selvaticarestaurant.com/wp-content/uploads/2022/11/photo_6041913203648215500_y.jpg" alt="RestaurantBG">
        <div class="white-box">
            <div class="form-container">
                <form action="Reservar1" method="post">
                 <label for="fecha">Selecciona una fecha:</label>
                <input type="date" id="fecha" name="fecha" required>
                <label for="hora">Selecciona una hora:</label>
                <input type="time" id="hora" name="hora" required>
                <label for="personas">Cantidad de Personas:</label>
        <select id="personas" name="persona" required>
            <option value="">Seleccionar</option>
            <c:forEach var="i" begin="1" end="20">
                <option value="${i}">${i}</option>
            </c:forEach>
        </select>
                    <button type="submit">Buscar Mesas</button>
                </form>
            </div>
        </div>
                <!-- Mostrar errores si los hay -->
<c:if test="${not empty errorMessage}">
    <p class="error">${errorMessage}</p>
</c:if>
    </div>
    
</body>
</html>