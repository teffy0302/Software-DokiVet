<%-- lista_consultas.jsp - Muestra la lista de consultas o atenciones médicas --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Consultas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
            // 1. Lógica de Seguridad: Verificar la sesión
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
                        <li class="nav-item"><a href="lista_recordatorios.jsp"><i class="fas fa-calendar-alt"></i> <span>Lista de Rescordatorios</span></a></li>
                        <li class="nav-item"><a href="gestion_citas.jsp"><i class="fas fa-stethoscope"></i> <span>Gestión de Citas</span></a></li>
                        <li class="nav-item"><a href="#"><i class="fas fa-hospital-user"></i> Hospitalización</a></li>
                        <li class="nav-item active">
                            <a href="lista_consultas.jsp"><i class="fas fa-notes-medical"></i> <span>Consultas</span></a>
                        </li>
                        <li class="nav-item"><a href="#"><i class="fas fa-tools"></i> Herramientas</a></li>
                        <li class="nav-item"><a href="emails_enviados.jsp"><i class="fas fa-clipboard-list"></i> <span>Registro</span></a></li>
                        </li>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🚨​ ​</span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <div class="page-header">
                    <div class="page-header-left">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a>
                        <h2>Lista de Consultas</h2>
                    </div>
                    <div class="page-header-right">
                        <button class="btn-save" onclick="window.location.href='nueva_cita.jsp'"><i class="fas fa-plus"></i> Nueva Consulta</button>
                    </div>
                </div>


                <section class="card card-full-width">
                    
                    <div class="search-form-grid" style="grid-template-columns: 2fr 1fr 1fr 1fr;">
                        <div class="form-group-item">
                            <input type="text" placeholder="Buscar por cliente, paciente o diagnóstico" class="search-input" style="padding-left: 15px;">
                        </div>
                        <div class="form-group-item">
                            <select class="search-input" style="padding-left: 15px;">
                                <option value="">Filtrar por Veterinario</option>
                                <option value="dra_gomez">Dra. Gómez</option>
                                <option value="dr_smith">Dr. Smith</option>
                                </select>
                        </div>
                        <div class="form-group-item">
                            <select class="search-input" style="padding-left: 15px;">
                                <option value="">Filtrar por Estado</option>
                                <option value="pendiente">Pendiente</option>
                                <option value="en_curso">En Curso</option>
                                <option value="finalizada">Finalizada</option>
                                <option value="cancelada">Cancelada</option>
                            </select>
                        </div>
                        <div class="form-group-item search-action-bar" style="padding: 0;">
                            <button class="btn-search" style="width: 100%;"><i class="fas fa-search"></i> Buscar</button>
                        </div>
                    </div>

                    
                    <div class="table-responsive" style="margin-top: 20px;">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 10%;">ID</th>
                                    <th style="width: 15%;">Fecha</th>
                                    <th style="width: 15%;">Paciente</th>
                                    <th style="width: 20%;">Propietario</th>
                                    <th style="width: 15%;">Veterinario</th>
                                    <th style="width: 15%;">Estado</th>
                                    <th style="width: 10%;">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Simulación de Datos --%>
                                <tr>
                                    <td>C-00523</td>
                                    <td>2025-10-25</td>
                                    <td>Maximus (Canino)</td>
                                    <td>Ana Torres</td>
                                    <td>Dra. Gómez</td>
                                    <td><span class="status-tag status-warning">Pendiente</span></td>
                                    <td><a href="registro_medico.jsp?id=523" class="btn-icon"><i class="fas fa-edit"></i></a></td>
                                </tr>
                                <tr>
                                    <td>C-00522</td>
                                    <td>2025-10-24</td>
                                    <td>Felix (Felino)</td>
                                    <td>Juan Pérez</td>
                                    <td>Dr. Smith</td>
                                    <td><span class="status-tag status-info">En Curso</span></td>
                                    <td><a href="registro_medico.jsp?id=522" class="btn-icon"><i class="fas fa-edit"></i></a></td>
                                </tr>
                                <tr>
                                    <td>C-00521</td>
                                    <td>2025-10-23</td>
                                    <td>Princesa (Roedor)</td>
                                    <td>Laura Diaz</td>
                                    <td>Dra. Gómez</td>
                                    <td><span class="status-tag status-success">Finalizada</span></td>
                                    <td><a href="registro_medico.jsp?id=521" class="btn-icon"><i class="fas fa-eye"></i></a></td>
                                </tr>
                                <tr>
                                    <td>C-00520</td>
                                    <td>2025-10-23</td>
                                    <td>Berna (Canino)</td>
                                    <td>Mario Ruiz</td>
                                    <td>Dr. Smith</td>
                                    <td><span class="status-tag status-danger">Cancelada</span></td>
                                    <td><a href="registro_medico.jsp?id=520" class="btn-icon"><i class="fas fa-eye"></i></a></td>
                                </tr>
                                <%-- Fin Simulación --%>
                            </tbody>
                        </table>
                    </div>
                    
                    
                    <div class="pagination-footer">
                        <div class="pagination-info">
                            <span>Viendo 1 - 10 de 150 consultas</span>
                        </div>
                        <div class="pagination-controls">
                            <button class="btn-icon" disabled><i class="fas fa-chevron-left"></i></button>
                            <button class="btn-page active">1</button>
                            <button class="btn-page">2</button>
                            <button class="btn-page">3</button>
                            <button class="btn-icon"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>
                </section>
                
            </main>
        </div>
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Lógica para el submenú si tu menú de "Consultas" tuviera sub-elementos.
                // Como es un ítem de menú principal, no se necesita el acordeón.
            });
        </script>

    </body>
</html>