<%-- emails_enviados.jsp - Muestra la lista de correos electrónicos enviados --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Emails Enviados</title>
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
                        <li class="nav-item"><a href="lista_consultas.jsp"><i class="fas fa-notes-medical"></i> <span>Consultas</span></a></li>
                        <li class="nav-item"><a href="#"><i class="fas fa-tools"></i> Herramientas</a></li>
                        <li class="nav-item active has-submenu submenu-open">
                            <a href="#"><i class="fas fa-clipboard-list"></i> <span>Registros</span> <i class="fas fa-chevron-down submenu-arrow"></i></a>
                            <ul class="submenu visible">
                                 <li class="nav-item active"><a href="emails_enviados.jsp">Emails enviados</a></li>
                                 <li class="nav-item"><a href="modificaciones_datos.jsp">Modificaciones de datos</a></li>
                            </ul>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 📧​ ​</span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                                <section class="taskboard-header">
                    <div class="taskboard-title">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a>
                        <h2>Emails Enviados</h2>
                    </div>
                    <div class="taskboard-options">

                    </div>
                </section>
                <section class="task-columns-grid">
                <section class="card card-full-width">                 
                    
                    <div class="search-bar-container">
                        <input type="text" placeholder="🔎 Filtrar por" class="search-input">
                    </div>

                    
                    <div class="table-responsive" style="margin-top: 20px;">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 15%;">Enviado el</th>
                                    <th style="width: 30%;">Asunto</th>
                                    <th style="width: 30%;">Destino</th>
                                    <th style="width: 10%;">Estado</th>
                                    <th style="width: 15%;">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Simulación de Datos (Estos se cargarían desde el Servlet) --%>
                                <tr>
                                    <td>5 de marzo de 2025, 21:30</td>
                                    <td>Nueva reunión programada</td>
                                    <td>ramirez97rodrigo@gmail.com</td>
                                    <td><span class="status-tag status-success">Entregado</span></td>
                                    <td><button class="btn-icon"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>27 de abril de 2024, 13:49</td>
                                    <td>Nueva reunión programada</td>
                                    <td>tsbot7287@furuvus.com</td>
                                    <td><span class="status-tag status-info">Rechazado</span></td>
                                    <td><button class="btn-icon"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>20 de marzo de 2024, 7:41</td>
                                    <td>Berna ha sido registrado por Doki Vet</td>
                                    <td>maritzaesm@gmail.com</td>
                                    <td><span class="status-tag status-default">Abierto</span></td>
                                    <td><button class="btn-icon"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>4 de abril de 2024, 14:01</td>
                                    <td>Felix ha sido registrado por Doki Vet</td>
                                    <td>moebetty@live.com.mx</td>
                                    <td><span class="status-tag status-warning">Falla leve</span></td>
                                    <td><button class="btn-icon"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>8 de enero de 2025, 17:47</td>
                                    <td>Comprobante de venta - Doki Vet</td>
                                    <td>nataliag@gmail.com</td>
                                    <td><span class="status-tag status-danger">Bloqueado</span></td>
                                    <td><button class="btn-icon"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>5 de octubre de 2024, 20:18</td>
                                    <td>Yann ha sido registrado por Doki Vet</td>
                                    <td>paulyneuc@gmail.com</td>
                                    <td><span class="status-tag status-default">Abierto</span></td>
                                    <td><button class="btn-icon"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                
                                <%-- Fin Simulación --%>
                            </tbody>
                        </table>
                    </div>
                    
                    
                    <div class="pagination-footer">
                        <div class="pagination-info">
                            <span>Viendo 1 - 10 de 28 mensajes</span>
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
                // Lógica para abrir/cerrar submenús (similar a tus otros JSPs)
                document.querySelectorAll('.has-submenu > a').forEach(item => {
                    item.addEventListener('click', function(e) {
                        const parentLi = this.closest('.has-submenu');
                        const submenu = parentLi.querySelector('.submenu');

                        if (submenu) {
                            e.preventDefault(); 
                            document.querySelectorAll('.has-submenu.submenu-open').forEach(openItem => {
                                if (openItem !== parentLi) {
                                    openItem.classList.remove('submenu-open');
                                    openItem.querySelector('.submenu').classList.remove('visible');
                                }
                            });

                            parentLi.classList.toggle('submenu-open');
                            submenu.classList.toggle('visible');
                        }
                    });
                });
            });
        </script>

    </body>
</html>