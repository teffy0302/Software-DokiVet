<%-- nuevo_cliente.jsp - FORMULARIO DE NUEVO Propietario --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Nuevo Popietario</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
            // Lógica de Seguridad: Verificar la sesión
            String nombreUsuario = (String) session.getAttribute("nombreUsuario");
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            if (nombreUsuario == null || rolUsuario == null) {
                response.sendRedirect("inicio_sesion.jsp");
                return; 
            }
        %>

        <div class="dashboard-container">
            
<aside class="sidebar">
    <div class="sidebar-header">
        <img src="img/logo-doki-vet.png" alt="Doki Vet Logo" class="sidebar-logo-round">
    </div>
    <nav class="sidebar-nav">
        <ul>
                        <li class="nav-item has-submenu"><a href="dashboard.jsp"><i class="fas fa-file-alt"></i> <span>Tableros</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
                        <li class="nav-item has-submenu"><a href="lista_clientes.jsp"><i class="fas fa-user"></i> <span>Propietarios</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
                        <li class="nav-item has-submenu"><a href="lista_pacientes.jsp"><i class="fas fa-paw"></i> <span>Pacientes</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
                        <li class="nav-item"><a href="#"><i class="fas fa-concierge-bell"></i> Servicios</a></li>
                        <li class="nav-item"><a href="sala_de_espera.jsp"><i class="fas fa-clock"></i> <span>Sala de Espera</span></a></li> 
                        <li class="nav-item"><a href="lista_recordatorios.jsp"><i class="fas fa-calendar-alt"></i> <span>Lista de Recordatorios</span></a></li>
                        <li class="nav-item"><a href="gestion_citas.jsp"><i class="fas fa-stethoscope"></i> <span>Gestión de Citas</span></a></li>
                        <li class="nav-item"><a href="#"><i class="fas fa-hospital-user"></i> Hospitalización</a></li>
                        <li class="nav-item"><a href="lista_consultas.jsp"><i class="fas fa-notes-medical"></i> <span>Consultas</span></a></li>
                        <li class="nav-item"><a href="#"><i class="fas fa-tools"></i> Herramientas</a></li>
                        <li class="nav-item has-submenu"><a href="emails_enviados.jsp"><i class="fas fa-clipboard-list""></i> <span>Registros</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
                        <li class="nav-item logout">
                            <a href="inicio_sesion.jsp"><i class="fas fa-sign-out-alt"></i> <span>Cerrar Sesión</span></a>
                        </li>
        </ul>
    </nav>
</aside>

         <main class="main-content">
    
    <header class="navbar">
        <div class="navbar-left">
            <span class="menu-toggle"><i class="fas fa-bars"></i></span>
            <span class="access-text">Accesos</span>
        </div>
        <div class="navbar-right">
            <a href="#" class="nav-icon"><i class="fas fa-envelope"></i></a>
            <a href="#" class="nav-icon"><i class="fas fa-shopping-cart"></i></a>
            <a href="#" class="nav-icon"><i class="fas fa-bell"></i></a>
            <div class="user-profile">
                <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🤝🏻 </span>
                <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                <i class="fas fa-caret-down"></i>
            </div>
        </div>
    </header>

    <div class="page-header client-page-header">
        <div class="page-header-left">
            <a href="lista_clientes.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
            <h2>Nuevo Propietario</h2>
        </div>
        <div class="page-header-right">
            <a href="lista_clientes.jsp" class="btn-cancel"><i class="fas fa-times"></i> Cancelar</a>
            <button class="btn-save"><i class="fas fa-save"></i> Guardar</button>
        </div>
    </div>
                
<section class="client-form-section">
    
    <div class="card form-card card-full-width">
        
        <form class="new-client-form-vertical">
            
            <label>Nombre</label>
            <input type="text" placeholder="" required>
            
            <h4 class="form-title">Campos Opcionales</h4>
            
            <label>Teléfono móvil</label>
            <div class="input-inline-group input-full-width">
                <input type="text" placeholder="Ejemplo: +57321234567">
            </div>
            <p class="input-description">Consulta si el cliente desea recibir mensajes a través de WhatsApp. Si no, se utiliza el formato internacional.</p>
            
            <label>Dirección</label>
            <input type="text" placeholder="">

            <label>Identificación</label>
            <input type="text" placeholder="">
            
            <label>Veterinario</label>
            <input type="text" placeholder="">

            
            <label>Instagram</label>
            <div class="input-icon-group">
                <input type="text" placeholder="">
            </div>

            <label>Cumpleaños</label>
            <div class="input-icon-group">
                <input type="date" placeholder="DD/MM/AAAA">
            </div>

            <div class="form-inline-group">
                <div class="form-group-item">
                    <label>Plan mensual</label>
                    <select>
                        <option>No está asociado a un plan mensual</option>
                    </select>
                </div>
                <div class="form-group-item">
                    <label>Listas de precios</label>
                    <select>
                        <option>No hay lista de precios para aplicar</option>
                    </select>
                </div>
            </div>
            
            <label>E-mail</label>
            <input type="email" placeholder="" required>
            <div class="checkbox-group">
                <input type="checkbox" id="enviar_recordatorios">
                <label for="enviar_recordatorios">Enviar recordatorios</label>
            </div>
            <p class="input-description">Es necesario para que al cliente le lleguen recordatorios.</p>
            <div class="form-inline-group form-4-cols">
                <div class="form-group-item"><label>Teléfono</label><input type="text" placeholder=""></div>
                <div class="form-group-item"><label>Ciudad</label><input type="text" placeholder=""></div>
                <div class="form-group-item">
                    <label>Idioma</label>
                    <select><option>Español</option></select>
                </div>
                <div class="form-group-item"><label>Deuda</label><input type="text" placeholder=""></div>
            </div>

            
            <label>Nombres alternativos</label>
            <input type="text" placeholder="">
            
            <div class="form-inline-group">
                <div class="form-group-item">
                    <label>¿Cómo se enteró el cliente de la clínica?</label>
                    <select><option>Redes Sociales</option></select>
  
                </div>
                <div class="form-group-item">
                    <label>Día de pago</label>
                    <select><option>Semanal</option></select>
                </div>
            </div>

        </form>
    </div>

</section>
            </main>
        </div>
        
        <script>
            // Script para mantener el submenú abierto
            document.addEventListener('DOMContentLoaded', function() {
                const clientItem = document.querySelector('.sidebar-nav li.nav-item.active');
                if (clientItem) {
                    clientItem.classList.add('submenu-open');
                }
            });
        </script>
    </body>
</html>