<%-- dashboard.jsp - DASHBOARD PRINCIPAL DOKI VET (VERSION FINAL) --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
            // 1. Lógica de Seguridad: Verificar la sesión y obtener datos
            // La sesión ya fue validada en bienvenida.jsp, pero verificamos para protección.
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
                         <li class="nav-item active"><a href="dashboard.jsp"><i class="fas fa-file-alt"></i> Tableros</a>
                            <ul class="submenu">
                         <li class="nav-item active"><a href="dashboard.jsp">Mi Tablero</a></li>
                         <li class="nav-item"><a href="tablero_tareas.jsp">Tablero de Tareas</a></li>
                    </ul>
                      </li>        
                     
                        <li class="nav-item has-submenu"><a href="lista_clientes.jsp"><i class="fas fa-user"></i> <span>Propietarios</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
                        <li class="nav-item has-submenu"><a href="lista_pacientes.jsp"><i class="fas fa-paw"></i> <span>Pacientes</span> <i class="fas fa-chevron-down submenu-arrow"></i></a></li>
                        <li class="nav-item"><a href="#"><i class="fas fa-concierge-bell"></i> Servicios</a></li>
                        <li class="nav-item"><a href="sala_de_espera.jsp"><i class="fas fa-clock"></i> <span>Sala de Espera</span></a></li>
                        <li class="nav-item"><a href="lista_recordatorios.jsp"><i class="fas fa-calendar-alt"></i> <span>Lista de Rescordatorios</span></a></li>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🤝🏻​​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <section class="dashboard-grid">
                    
                    <div class="card card-small">
                        <h4>Recordatorios de hoy</h4>
                        <p>No hay más visitas programadas para hoy.</p>
                        <a href="#" class="card-link">Ver lista de recordatorios de hoy <i class="fas fa-chevron-right"></i></a>
                    </div>
                    <div class="card card-small">
                        <h4>Cajas registradoras</h4>
                        <p>• Hoy : $443.373.92</p>
                        <p>• 14 - feb - 2025: $200.00</p>
                        <a href="#" class="card-link">Ver lista de cajas registradoras <i class="fas fa-chevron-right"></i></a>
                    </div>
                    <div class="card card-small">
                        <h4>Citas online</h4>
                        <p>3 citas desde la aplicación</p>
                        <p>8 citas desde la web</p>
                        <a href="#" class="card-link">Ver todas las citas programadas <i class="fas fa-chevron-right"></i></a>
                    </div>

                    
                    <div class="card card-large">
                        <div class="card-header-table">
                            <h4>Últimos consumos</h4>
                            <button class="btn-refresh"><i class="fas fa-sync-alt"></i> Recargar</button>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Hora</th>
                                        <th>Cliente</th>
                                        <th>Paciente</th>
                                        <th>Precio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>10:35</td><td>JEANNI MARAIS</td><td>PEBBLES</td><td>$260</td></tr>
                                    <tr><td>14:01</td><td>MARTY ASQUI</td><td>BINGO CATO</td><td>$25.816.88</td></tr>
                                    <tr><td>13:09</td><td>Maria Camila</td><td>Negra</td><td>$20.150</td></tr>
                                    <tr><td>16:42</td><td>Anthony</td><td>Oddie</td><td>$0</td></tr>
                                    <tr><td>12:13</td><td>mariana saib</td><td>Claychan</td><td>$20.477.55</td></tr>
                                    <tr><td>10:23</td><td>yonathan velasquez</td><td>Simon</td><td>$40.000</td></tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-bar" style="width: 70%;"></div>
                        </div>
                    </div>
                    <div class="card card-large">
                        <div class="card-header-table">
                            <h4>Últimas visitas</h4>
                            <button class="btn-refresh"><i class="fas fa-sync-alt"></i> Recargar</button>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Hora</th>
                                        <th>Cliente</th>
                                        <th>Paciente</th>
                                        <th>Precio</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td colspan="4" class="no-data">No hay visitas generadas últimamente</td></tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-bar" style="width: 30%;"></div>
                        </div>
                    </div>

                    
                    <div class="card card-full-width">
                        <div class="card-header-table">
                            <h4>Próximas dosis a aplicar en internaciones</h4>
                            <button class="btn-refresh"><i class="fas fa-sync-alt"></i> Recargar</button>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Fecha y hora</th>
                                        <th>Paciente</th>
                                        <th>Droga</th>
                                        <th>Dosis</th>
                                        <th>Vía</th>
                                        <th>Frecuencia</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>12/2/22 2:00</td><td>Abi</td><td>Metronidazol</td><td>30mg/kg</td><td>IV</td><td>12 horas</td></tr>
                                    <tr><td>13/2/22 8:00</td><td>Abi</td><td>Metronidazol</td><td>30mg/kg</td><td>IV</td><td>12 horas</td></tr>
                                    <tr><td>13/2/22 21:00</td><td>Abi</td><td>Metronidazol</td><td>30mg/kg</td><td>IV</td><td>12 horas</td></tr>
                                    <tr><td>14/2/22 8:00</td><td>Abi</td><td>Metronidazol</td><td>30mg/kg</td><td>IV</td><td>12 horas</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </main>
        </div>
    </body>
</html>