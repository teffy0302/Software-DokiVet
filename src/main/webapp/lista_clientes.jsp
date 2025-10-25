<%-- lista_clientes.jsp - VISTA DE LISTA DE PROPIETARIOS --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Lista de Propietarios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
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
                        <li class="nav-item active"><a href="lista_clientes.jsp"><i class="fas fa-users"></i> <span>Propietarios</span></a>
                            <ul class="submenu visible">
                                <li class="nav-item active"><a href="lista_clientes.jsp">Lista / Búsqueda</a></li>
                            </ul>
                        </li>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🫶🏻​​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <section class="client-list-section">
                    
                    <div class="client-header">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a>
                        <h2>Lista de Propietarios</h2>
                    </div>

                    <div class="card search-card">
                        <h4>Buscar</h4>
                        <form class="search-form">
                            <div class="form-grid">
                                <input type="text" placeholder="Nombre">
                                <input type="text" placeholder="Dirección">
                                <input type="text" placeholder="Identificación">
                                <input type="text" placeholder="Teléfono">
                                <input type="email" placeholder="E-mail">
                                <select>
                                    <option>Plan mensual</option>
                                    <option>No está asociado a un plan mensual</option>
                                </select>
                            </div>
                            <div class="search-button-container">
                                <button type="submit" class="btn-search"><i class="fas fa-search"></i> Buscar</button>
                            </div>
                        </form>
                    </div>

                    <div class="card client-table-card card-full-width">
                        <div class="card-header-table">
                            <h4>Lista de Propietarios</h4>
                            <a href="nuevo_cliente.jsp" class="btn-new-client"><i class="fas fa-plus"></i> Nuevo</a>
                        </div>
                        <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Dirección</th>
                                        <th>Teléfono</th>
                                        <th>E-mail</th>
                                        <th>F. de alta</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>LILIANA VICENCIO</td><td>PRIVADA SAN GERONIMO COL SAN JAVIER</td><td>5525279938</td><td></td><td>16 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Victor Rey</td><td>Av Mexico No. 201</td><td>5534532358</td><td>vice.caim.arriva@gmail.com</td><td>10 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Ro</td><td>Av Mexico No. 201</td><td>5534532358</td><td>reynaldo@gmail.com</td><td>9 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Jorge</td><td>Verdeoleaga #203</td><td>+5528736</td><td>jorge123@gmail.com</td><td>7 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Axel Martinez</td><td>Calle logo amigo numero 85</td><td>+5555653</td><td>axel_mtz@gmail.com</td><td>7 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Julio David</td><td>Ayucxuan Mz. 238 Lt. 5</td><td>+55553396</td><td>julianaramiro93@gmail.com</td><td>1 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>bastian</td><td>chocabaco</td><td>+55559564632</td><td>bastian@gmail.com</td><td>5 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Estrella</td><td>Torre latinoamericana 331</td><td>+55559855030</td><td></td><td>2 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Derek</td><td>Gustavo Diaz Ordaz</td><td>+5538181573</td><td>derekurth@gmail.com</td><td>1 mar. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                    <tr><td>Mario Garcia</td><td>San Miguel 290</td><td>+54385647789</td><td>mariogarcia12@gmail.com</td><td>28 feb. 2025</td><td><a href="#"><i class="fas fa-pen"></i></a> <a href="#"><i class="fas fa-times-circle"></i></a></td></tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="pagination">
                            <button class="btn-page"><i class="fas fa-chevron-left"></i></button>
                            <button class="btn-page active">1</button>
                            <button class="btn-page">2</button>
                            <button class="btn-page"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>

                </section>
            </main>
        </div>
        
        <script>
            // Script básico para el toggle del submenú
            document.addEventListener('DOMContentLoaded', function() {
                const navItem = document.querySelector('.sidebar-nav .nav-item.active');
                if (navItem && navItem.classList.contains('has-submenu')) {
                    navItem.classList.add('submenu-open');
                }
            });
        </script>
    </body>
</html>