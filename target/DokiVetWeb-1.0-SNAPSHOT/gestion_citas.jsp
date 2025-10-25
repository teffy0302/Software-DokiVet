<%-- gestion_citas.jsp - VISTA DE GESTIÓN DE CITAS (AGENDA SEMANAL SIMPLE) --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Gestión de Citas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
            // Lógica de Seguridad
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
                            <span class="user-name">HOLA⚕️, <%= nombreUsuario.toUpperCase() %> 🚑​​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <div class="page-header client-page-header">
                    <div class="page-header-left">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
                        <h2>Gestión de Citas</h2>
                    </div>
                    <div class="page-header-right">
                      <a href="nueva_cita.jsp" class="btn-save btn-new-client"><i class="fas fa-plus"></i> Nueva Cita</a>
                    </div>
                </div>

                
                <section class="citas-section">
                    
                    <div class="card card-full-width search-card">
                        
                        <div class="search-form-grid" style="grid-template-columns: repeat(3, 1fr);">
                            
                            <div class="form-group-item">
                                <label>Fecha de Citas</label>
                                <input type="date" value="2025-10-23">
                            </div>
                            <div class="form-group-item">
                                <label>Veterinario</label>
                                <select><option>Todos</option><option>Dr. VETO</option><option>Dra. Ana</option></select>
                            </div>
                            <div class="form-group-item">
                                <label>Tipo de Cita</label>
                                <select><option>Consulta</option><option>Vacunación</option><option>Cirugía</option></select>
                            </div>
                            
                        </div>
                        
                        <div class="search-action-bar">
                             <button class="btn-search"><i class="fas fa-filter"></i> Aplicar Filtros</button>
                        </div>
                    </div>
                    
                    
                    <div class="card card-full-width agenda-card">
                        <div class="card-header-table">
                            <h4>Agenda de HOY (Miércoles, 23 de Octubre)</h4>
                            <div class="agenda-nav">
                                <button class="btn-icon"><i class="fas fa-chevron-left"></i></button>
                                <button class="btn-icon"><i class="fas fa-chevron-right"></i></button>
                            </div>
                        </div>
                        
                        <div class="agenda-vet-grid">
                            
                            <div class="agenda-col">
                                <h5>Dr. VETO</h5>
                                <table>
                                    <thead><tr><th>Hora</th><th>Cita</th></tr></thead>
                                    <tbody>
                                        <tr><td>08:00</td><td class="cita-ocupada">Consulta: RAGNAR (L. Vicencio)</td></tr>
                                        <tr><td>09:00</td><td class="cita-ocupada">Vacuna: Simba (M. Pérez)</td></tr>
                                        <tr><td>10:00</td><td class="cita-libre" onclick="alert('Nueva Cita 10:00')">+ Disponible</td></tr>
                                        <tr><td>11:00</td><td class="cita-ocupada">Cirugía: Milo (Urgente)</td></tr>
                                        <tr><td>12:00</td><td class="cita-libre" onclick="alert('Nueva Cita 12:00')">+ Disponible</td></tr>
                                        <tr><td>13:00</td><td class="cita-descanso">Almuerzo</td></tr>
                                        <tr><td>14:00</td><td class="cita-libre" onclick="alert('Nueva Cita 14:00')">+ Disponible</td></tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="agenda-col">
                                <h5>Dra. Ana</h5>
                                <table>
                                    <thead><tr><th>Hora</th><th>Cita</th></tr></thead>
                                    <tbody>
                                        <tr><td>08:00</td><td class="cita-libre" onclick="alert('Nueva Cita 08:00')">+ Disponible</td></tr>
                                        <tr><td>09:00</td><td class="cita-ocupada">Consulta: Pelusa (J. Marín)</td></tr>
                                        <tr><td>10:00</td><td class="cita-ocupada">Revisión: Kiara (M. López)</td></tr>
                                        <tr><td>11:00</td><td class="cita-libre" onclick="alert('Nueva Cita 11:00')">+ Disponible</td></tr>
                                        <tr><td>12:00</td><td class="cita-ocupada">Control: Toby (A. Gómez)</td></tr>
                                        <tr><td>13:00</td><td class="cita-descanso">Almuerzo</td></tr>
                                        <tr><td>14:00</td><td class="cita-libre" onclick="alert('Nueva Cita 14:00')">+ Disponible</td></tr>
                                    </tbody>
                                </table>
                            </div>
                            
                            </div>
                    </div>

                </section>
            </main>
        </div>
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Lógica de apertura/cierre de submenús
                document.querySelectorAll('.has-submenu > a').forEach(item => {
                    item.addEventListener('click', function(e) {
                        const submenu = this.closest('.has-submenu').querySelector('.submenu');
                        if (submenu) {
                            e.preventDefault(); // Evita navegar si hay submenú
                            submenu.classList.toggle('visible');
                            this.closest('.has-submenu').classList.toggle('submenu-open');
                        }
                    });
                });
            });
        </script>
    </body>
</html>