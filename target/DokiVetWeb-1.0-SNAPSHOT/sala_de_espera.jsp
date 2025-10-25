<%-- sala_de_espera.jsp - VISTA DE SALA DE ESPERA --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Sala de Espera</title>
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
                        <li class="nav-item has-submenu"><a href="lista_clientes.jsp"><i class="fas fa-users"></i> <span>Popietarios</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
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
                            <span class="user-name">HOLA⚕️, <%= nombreUsuario.toUpperCase() %> 🤫​ ​</span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <div class="page-header client-page-header">
                    <div class="page-header-left">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
                        <h2>Sala de Espera</h2>
                    </div>
                    <div class="page-header-right">
                        <a href="#" class="nav-icon"><i class="fas fa-tv"></i></a>
                        <a href="#" class="nav-icon"><i class="fas fa-plus"></i></a>
                    </div>
                </div>

                
                <section class="wait-room-section">
                    
                    <div class="card card-full-width promo-card">
                        <p class="warning-text"><i class="fas fa-exclamation-triangle"></i> Aviso: El uso de la sala de espera no genera ningún informe, y se eliminan 48 horas después de su creación si no realiza ninguna acción.</p>
                        
                        <div class="promotion-input-group">
                            <input type="text" placeholder="Establecer mensaje o promoción en el monitor de la sala de espera">
                            <button class="btn-save btn-promo-send">Enviar</button>
                        </div>
                    </div>
                    
                    <div class="card client-table-card">
                        <div class="card-header-table">
                            <h4>Sala de Espera</h4>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Usuario</th>
                                        <th>Paciente</th>
                                        <th>Cliente</th>
                                        <th>Pago</th>
                                        <th>Hora</th>
                                        <th>Llamar</th>
                                        <th>Motivo</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Seveo</td><td>Ragnarak</td><td>Juan Guzman</td><td>$500</td><td>12:43</td><td><i class="fas fa-hand-point-right action-icon-blue"></i></td><td>5060</td><td><i class="fas fa-cog action-icon"></i></td></tr>
                                    <tr><td>Cobrador 128</td><td>CANELA</td><td>FELIPE RIVERA</td><td>$0</td><td>12:52</td><td><i class="fas fa-hand-point-right action-icon-blue"></i></td><td>DIARREA</td><td><i class="fas fa-cog action-icon"></i></td></tr>
                                    <tr><td>carlos</td><td>Chuck</td><td>Fernando</td><td>$0</td><td>22:01</td><td><i class="fas fa-hand-point-right action-icon-blue"></i></td><td>acude tras varios días de estar el perro con vómitos y diarreas</td><td><i class="fas fa-cog action-icon"></i></td></tr>
                                    <tr><td>carlos emergencia</td><td>---</td><td>PEPE LUIS</td><td>$0</td><td>0:43</td><td><i class="fas fa-hand-point-right action-icon-blue"></i></td><td>CONSULTA</td><td><i class="fas fa-cog action-icon"></i></td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </main>
        </div>
    </body>
</html>