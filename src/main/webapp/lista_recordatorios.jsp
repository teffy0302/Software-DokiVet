<%-- lista_recordatorios.jsp - VISTA DE LISTA Y BÚSQUEDA DE RECORDATORIOS --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Citas y Recordatorios</title>
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
                            <span class="user-name">HOLA⚕️, <%= nombreUsuario.toUpperCase() %> ​​🤗​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                <section class="taskboard-header">
                    <div class="taskboard-title">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a>
                        <h2>Lista de Recordatorios</h2>
                    </div>
                    <div class="taskboard-options">
                    </div>
                </section>

                    <div class="card card-full-width search-card">
                        
                        <div class="search-form-grid">
                            
                            <div class="form-group-item">
                                <label>Motivo</label>
                                <input type="text" placeholder="Buscar en el motivo del recordatorio">
                            </div>
                            <div class="form-group-item">
                                <label>Paciente</label>
                                <input type="text" placeholder="Buscar un paciente">
                            </div>
                            
                            <div class="form-group-item">
                                <label>Fecha desde</label>
                                <input type="date" value="2025-03-17">
                            </div>
                            <div class="form-group-item">
                                <label>Fecha hasta</label>
                                <input type="date" value="2025-03-24">
                            </div>
                            <div class="form-group-item">
                                <label>Ocultar horas</label>
                                <select><option>Todos</option></select>
                            </div>

                            <div class="form-group-item">
                                <label>Usuario</label>
                                <input type="text">
                            </div>
                            <div class="form-group-item">
                                <label>Tipo de cita</label>
                                <select><option>Seleccione un tipo de cita</option></select>
                            </div>
                            <div class="form-group-item">
                                <label>Estado</label>
                                <select><option>No completado</option></select>
                            </div>
                            
                        </div>
                        
                        <div class="search-action-bar">
                             <button class="btn-search"><i class="fas fa-search"></i> Buscar</button>
                        </div>
                    </div>
                    
                    
                    <div class="card client-table-card">
                        <div class="card-header-table">
                            <h4>Lista de recordatorios</h4>
                             <a href="nuevo_recordatorio.jsp" class="btn-save btn-new-client"><i class="fas fa-plus"></i> Nuevo</a>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Tipo</th>
                                        <th>Nombre del Propietario</th>
                                        <th>Nombre del Paciente</th>
                                        <th>Teléfono</th>
                                        <th>Usuario</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>martes, 18 de marzo de 2025</td>
                                        <td>Vacuna</td>
                                        <td>LILIANA VICENCIO</td>
                                        <td>RAGNAR</td>
                                        <td>5552799928</td>
                                        <td>Seveo</td>
                                        <td><i class="fab fa-whatsapp action-icon-green"></i> <i class="fas fa-phone-alt action-icon-blue"></i></td>
                                    </tr>
                                    <tr>
                                        <td colspan="7" class="recordatorio-detalle">
                                            Alerta de refuerzo - Vacuno Quíntuple 'VANGUARD PLUS 5/CV'
                                            <div class="auto-recordatorio">Un recordatorio automático</div>
                                        </td>
                                    </tr>
                                    </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </main>
        </div>
    </body>
</html>