<%-- tablero_tareas.jsp - VISTA DEL TABLERO DE TAREAS --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Tablero de Tareas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
            // Lógica de Seguridad:
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🤝🏻​ ​</span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                <section class="taskboard-header">
                    <div class="taskboard-title">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a>
                        <h2>Tablero de tareas</h2>
                    </div>
                    <div class="taskboard-options">
                         <a href="#" class="nav-icon"><i class="fas fa-user"></i></a>
                         <a href="#" class="nav-icon"><i class="fas fa-th-list"></i></a>
                    </div>
                </section>

                <section class="task-columns-grid">
                    
                    <div class="task-column">
                        <h3>Tarea nueva</h3>
                        <div class="task-card card-new">
                            <p>Sacar la basura de la vete</p>
                            <div class="task-meta">
                                <i class="fas fa-file-alt"></i> 
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </div>
                        <button class="btn-add-task">+ Añadir nueva tarea</button>
                    </div>
                    
                    <div class="task-column">
                        <h3>En progreso</h3>
                        <div class="task-card card-in-progress">
                            <p>Pedir insumos de internamiento</p>
                            <div class="task-meta">
                                <i class="fas fa-file-alt"></i> 
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </div>
                        <button class="btn-add-task">+ Añadir nueva tarea</button>
                    </div>
                    
                    <div class="task-column">
                        <h3>Completada</h3>
                        <div class="task-card card-completed">
                            <p>Comprar productos de limpieza</p>
                            <div class="task-meta">
                                <i class="fas fa-file-alt"></i> 
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </div>
                        <button class="btn-add-task">+ Añadir nueva tarea</button>
                    </div>
                    
                    <div class="task-column">
                        <h3>Verificada</h3>
                        <div class="task-card card-verified">
                            <p>ORDENAR DEPÓSITO</p>
                            <div class="task-meta">
                                <i class="fas fa-file-alt"></i> 
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </div>
                        <div class="task-card card-verified">
                            <p>esterilizar instrumental</p>
                            <div class="task-meta">
                                <i class="fas fa-file-alt"></i> 
                                <i class="fas fa-user-circle"></i>
                            </div>
                        </div>
                        <button class="btn-add-task">+ Añadir nueva tarea</button>
                    </div>
                    
                </section>
            </main>
        </div>
    </body>
</html>