    <%-- 
        Document   : Reservar1
        Created on : 2 dic. 2024, 17:42:50
        Author     : LENOVO
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Fecha</title>
        <link rel="stylesheet" href="Ddatos.css">
        <link rel="stylesheet" href="Dheader.css">
        <link rel="stylesheet" href="Dfooter.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Itim&display=swap');

            .footer-section {
                background-color: #5d5d5d;
                width: 100%;
                height: 250px;
                display: flex;
                align-items: end;
                justify-content: center;
                color: bisque;
                font-family: 'Arial', sans-serif;
                font-size: 15px;
                font-weight: bold;
                text-align: center;
                margin: 0px;
                box-sizing: border-box;
                position: relative;
                top: 150px;
            }
        </style>
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
            <img src="https://selvaticarestaurant.com/wp-content/uploads/2022/11/photo_6041913203648215500_y.jpg"
                alt="RestaurantBG" height="767" style="width: 100%;">
            <div class="white-box">
                <div class="white-box-text"></div>
                <div class="form-container">
                    <form action="Mesa.html" method="post">
                        <div class="form-group">
                            <label for="fecha" class="form-label">Fecha:</label>
                            <input type="date" id="fecha" name="fecha" class="form-input" min="" max="2024-12-24" required>
                        </div>
                        <script>
                            const today = new Date().toISOString().split("T")[0];
                            document.getElementById("fecha").setAttribute("min", today);
                        </script>
                       <div class="form-group">
                <label for="hora" class="form-label">Hora:</label>
                <select id="hora" name="hora" class="form-input" style="height: auto; width: 100%;"></select>
            </div>
            <script>
                // Cargar horas dinámicamente
                fetch('horariosDisponibles')
                    .then(response => response.json())
                    .then(data => {
                        const select = document.getElementById("hora");
                        data.forEach(hora => {
                            const option = document.createElement("option");
                            option.value = hora;
                            option.textContent = hora;
                            select.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error al cargar horas:', error));
            </script>

                        <input type="submit" value="Aceptar" class="form-submit">
                    </form>
                </div>
            </div>
        </div>
        <section class="footer-section">
            <br>
            <footer class="footer">
                <p>
                    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                <div class="card">
                    
                </div>
                Email de contacto:
                <a href="mailto:grodriguez@uni.edu.pe" style="color:black">culepanzona@gmail.com</a>
                <br><br>
                ©2024 LA CULEBRÍTICA PANZONA
                </p>
        </section>
    </body>

    </html>
