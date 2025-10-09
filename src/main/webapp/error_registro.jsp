<%-- error_registro.jsp - PÁGINA DE ERROR CON DISEÑO FINAL --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Error en Doki Vet</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        
        <div class="header-negro">
             <h1>¡ERROR EN EL REGISTRO!</h1>
             
             <div class="logo-esquina">
                 <img src="img/logotipo-doki-vet.png" alt="Logotipo" class="logo-redondo-pequeno">
             </div>
        </div>
        
        <div class="contenedor-formulario" style="border: 3px solid red;">
            
            <img src="img/logo-doki-vet.png" alt="Logo Doki Vet" class="logo-centrado-formulario">
            
            <h2 style="color: red; margin-top: 40px;">¡ERROR EN EL REGISTRO!</h2>
            <p>OCURRIÓ UN PROBLEMA AL PROCESAR TU SOLICITUD.</p>
            
            <a href="registro.jsp">
                <button type="button" class="boton-principal">INTENTAR DE NUEVO</button>
            </a>
            
        </div>
    </body>
</html>v>