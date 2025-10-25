<%-- lista_pacientes.jsp - LISTA Y BUSQUEDA DE PACIENTES --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Lista de Pacientes</title>
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
                        <li class="nav-item active has-submenu submenu-open"><a href="#"><i class="fas fa-paw"></i> <span>Pacientes</span> <i class="fas fa-chevron-down submenu-arrow"></i></a>
                            <ul class="submenu no visible">
                                <li class="nav-item active"><a href="lista_pacientes.jsp">Lista / Búsqueda</a></li>
                            </ul>
                        </li>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> ♥️​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <div class="page-header client-page-header">
                    <div class="page-header-left">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
                        <h2>Lista de Pacientes</h2>
                    </div>
                    <div class="page-header-right">
                    </div>
                </div>

                
                <section class="patient-section">
                    
                    <div class="card search-card">
                        
                        <form class="search-form">
                            <h4 style="margin-top: 0;">Buscar</h4>
                            <div class="form-grid search-patient-grid">
                                <input type="text" placeholder="Nombre">
                                <input type="text" placeholder="Historia clínica">
                                <input type="text" placeholder="Raza">
                                <select>
                                    <option>Especie</option>
                                    <option>Canino</option>
                                    <option>Felino</option>
                                </select>
                                <select>
                                    <option>Sexo</option>
                                    <option>Macho</option>
                                    <option>Hembra</option>
                                </select>
                                <input type="text" placeholder="Chip">
                            </div>
                            
                            <div class="search-actions">
                                <button type="submit" class="btn-search"><i class="fas fa-search"></i> Buscar</button>
                            </div>
                        </form>
                    </div>
                    
                    <div class="card client-table-card">
                        <div class="card-header-table">
                            <h4>Lista de pacientes</h4>
                        <a href="nuevo_paciente.jsp" class="btn-save btn-new-client"><i class="fas fa-plus"></i> Nuevo</a>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        
                                        <th># Historia Clínica</th>
                                        <th>Nombre</th>
                                        <th>Propietario</th>
                                        <th>Especie</th>
                                        <th>Raza</th>
                                        <th>Sexo</th>
                                        <th>¿Está castrado?</th>
                                        <th>Nacimiento</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>25</td><td>RAGNAR</td><td>LILIANA VICENCIO</td><td>Canino</td><td>BULLTERRIER INGLES</td><td>Macho</td><td>No</td><td>5 ene. 2025</td><td><i class="fas fa-eye action-icon"></i></td></tr>
                                    <tr><td>2</td><td>Julio</td><td>Rodrigo</td><td>Canino</td><td>----</td><td>Macho</td><td>No</td><td>3 mar. 2025</td><td><i class="fas fa-eye action-icon"></i></td></tr>
                                    <tr><td>32</td><td>Negro</td><td>María García</td><td>Canino</td><td>mestiza</td><td>Hembra</td><td>Sí</td><td>5 dic. 2018</td><td><i class="fas fa-eye action-icon"></i></td></tr>
                                    <tr><td>5</td><td>max</td><td>manuel fernandez</td><td>Canino</td><td>----</td><td>Macho</td><td>No</td><td>17 feb. 2022</td><td><i class="fas fa-eye action-icon"></i></td></tr>
                                    <tr><td>8</td><td>PEPA</td><td>Sigche Gustavo</td><td>Canino</td><td>mestiza</td><td>Hembra</td><td>No</td><td>16 feb. 2024</td><td><i class="fas fa-eye action-icon"></i></td></tr>
                                    <tr><td>1</td><td>SIMBO</td><td>Rebecca</td><td>Felino</td><td>SIAMES</td><td>Macho</td><td>No</td><td>11 ene. 2023</td><td><i class="fas fa-eye action-icon"></i></td></tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="pagination">
                            <button class="page-button" disabled><i class="fas fa-chevron-left"></i></button>
                            <button class="page-button active">1</button>
                            <button class="page-button">2</button>
                            <button class="page-button"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>

                </section>
            </main>
        </div>
    </body>
</html>