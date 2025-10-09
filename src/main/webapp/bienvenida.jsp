<%-- bienvenida.jsp - DASHBOARD PRINCIPAL DOKI VET --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Menú Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css">
        <style>
            /* Estilos específicos para el dashboard */
            .tarjeta-menu {
                background-color: white;
                border-radius: 15px;
                padding: 20px;
                margin: 15px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                text-align: center;
                flex: 1 1 45%; /* Distribución responsive de las tarjetas */
                min-width: 150px;
                transition: transform 0.2s;
            }
            .tarjeta-menu:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
            }
            .tarjeta-menu a {
                text-decoration: none;
                color: #008CBA;
                font-weight: bold;
                display: block;
                font-size: 1.1em;
            }
            .tarjeta-menu h3 {
                margin-top: 10px;
                color: #333;
            }
            .icon-huella {
                font-size: 2em; /* Si usas un ícono o emoji para la huella */
                color: #008CBA;
            }
            .contenedor-menu {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                max-width: 800px;
                margin-top: 20px;
            }
            .saludo-usuario {
                font-size: 1.4em;
                color: black;
                margin-bottom: 20px;
                font-weight: bold;
                text-align: center;
            }
            
            /* Ajuste para el botón de cerrar sesión */
            .boton-cerrar-sesion {
                 background-color: #f44336; /* Rojo */
                 color: white;
                 border-radius: 20px;
                 padding: 8px 15px;
                 margin-top: 30px;
                 cursor: pointer;
                 border: none;
            }
        </style>
    </head>
    <body>
        
        <% 
            // 1. Lógica de Seguridad: Verificar la sesión
            String nombreUsuario = (String) session.getAttribute("nombreUsuario");

            if (nombreUsuario == null) {
                // Si la sesión no existe, redirige al login
                response.sendRedirect("inicio_sesion.jsp");
                return; 
            }
        %>
        
        <div class="header-negro">
            <h1>MENÚ PRINCIPAL DOKI VET</h1>
        </div>
        
        <div class="logo-esquina">
            <img src="img/logotipo-doki-vet.png" alt="Doki Vet Logo" class="logo-redondo-pequeno">
        </div>

        <div class="contenedor-formulario" style="max-width: 90%; margin-top: 100px;">
            
            <p class="saludo-usuario">
                ¡Hola, <%= nombreUsuario %>! Bienvenido a Doki Vet.
            </p>
            
            <div class="contenedor-menu">
                
                <div class="tarjeta-menu">
                    <span class="icon-huella">🐾</span>
                    <a href="pacientes.jsp"><h3>Pacientes</h3></a>
                    <p>Gestionar Fichas y Expedientes</p>
                </div>
                
                <div class="tarjeta-menu">
                    <span class="icon-huella">📅</span>
                    <a href="citas.jsp"><h3>Citas</h3></a>
                    <p>Programar y Revisar la Agenda</p>
                </div>
                
                <div class="tarjeta-menu">
                    <span class="icon-huella">🩺</span>
                    <a href="historial.jsp"><h3>Historial Médico</h3></a>
                    <p>Ver y Crear Diagnósticos</p>
                </div>
                
                <div class="tarjeta-menu">
                    <span class="icon-huella">💊</span>
                    <a href="inventario.jsp"><h3>Inventario</h3></a>
                    <p>Control de Medicamentos y Stock</p>
                </div>
                
            </div>
            
            <form action="SvCerrarSesion" method="POST" style="margin-top: 40px;">
                <button type="submit" class="boton-cerrar-sesion">Cerrar Sesión</button>
            </form>
            
        </div>
    </body>
</html>