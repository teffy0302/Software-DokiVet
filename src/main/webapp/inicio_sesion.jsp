<%-- inicio_sesion.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Iniciar Sesión</title>
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <div class="header-negro">
            <h1>Iniciar Sesión Para Continuar</h1> 
            <div class="logo-esquina">
                <img src="img/logotipo-doki-vet.png" alt="Logotipo" class="logo-redondo-pequeno">
            </div>
        </div>

        <div class="contenedor-formulario">
            
            <img src="img/logo-doki-vet.png" alt="Logo Doki Vet" class="logo-centrado-formulario">
            
            <h2>Conectarse</h2>
            
            <% // Mensaje de error de validación %>
            <% String errorMessage = (String) request.getAttribute("error");
            if (request.getAttribute("errorExist") != null && (Boolean) request.getAttribute("errorExist")) { %>
                <div class="mensaje-error"><%= errorMessage %></div>
            <% } %>

            <form action="SvInicioSesion" method="POST" class="formulario">
                <input type="email" name="correo" placeholder="Correo" required>
                <input type="password" name="password" placeholder="Contraseña" required>

                <button type="submit" class="boton-principal">INICIO DE SESIÓN</button>
                <p class="enlace-secundario"><a href="#">¿Olvidó Su Contraseña?</a></p>
                <p class="enlace-secundario"><a href="registro.jsp">Registrarse</a></p>
            </form>
        </div>
    </body>
</html>