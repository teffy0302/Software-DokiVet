<%-- registro.jsp - ESTRUCTURA FINAL --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Registrarse</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        
        <div class="header-negro">
            <h1>BIENVENIDO A</h1> 
            
            <div class="logo-esquina">
                <img src="img/logotipo-doki-vet.png" alt="Logotipo" class="logo-redondo-pequeno">
            </div>
        </div>

        <div class="contenedor-formulario">
            
            <img src="img/logo-doki-vet.png" alt="Logo Perrito" class="logo-centrado-formulario">
            
            <h2>REGISTRARSE</h2>
            
            <% 
                // Mensaje de error (Validación de Servlets)
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (request.getAttribute("errorExist") != null && (Boolean) request.getAttribute("errorExist")) { 
            %>
                <div class="mensaje-error">
                    ¡ERROR EN EL REGISTRO! <%= errorMessage %>
                </div>
            <% } %>
            
            <form action="SvRegistro" method="POST" class="formulario">
                <input type="text" name="nombre" placeholder="Nombre" required>
                <input type="text" name="apellido" placeholder="Apellido" required>
                <input type="text" name="cedula" placeholder="Cédula" required>
                <input type="email" name="correo" placeholder="Correo" required>
                <input type="password" name="password" placeholder="Contraseña" required>
                
                <label for="fechaNacimiento">Fecha De Nacimiento</label>
                <input type="date" name="fechaNacimiento" id="fechaNacimiento" required>

                <button type="submit" class="boton-principal">REGISTRARSE</button>
                <p class="enlace-secundario">¿Ya tienes una cuenta? <a href="inicio_sesion.jsp">**Inicia sesión**</a></p>
            </form>
            
        </div>
    </body>
</html>