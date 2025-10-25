<%-- nuevo_paciente.jsp - FORMULARIO DE NUEVO PACIENTE --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Nuevo Paciente</title>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🥰​​​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                
                <div class="page-header client-page-header">
                    <div class="page-header-left">
                        <a href="lista_pacientes.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
                        <h2>Nuevo paciente</h2>
                    </div>
                    <div class="page-header-right">
                        <button class="btn-save"><i class="fas fa-save"></i> Guardar</button>
                    </div>
                </div>

                
                <section class="patient-form-section">
                    
                    <div class="card form-card card-full-width">
                        
                        <form class="new-patient-form-vertical">
                            
                            <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>Nombre</label>
                                    <input type="text" placeholder="" required>
                                </div>
                                <div class="form-group-item">
                                    <label>Cliente</label>
                                    <input type="text" placeholder="Buscar un cliente">
                                </div>
                            </div>

                            <div class="form-inline-group form-3-cols">
                                <div class="form-group-item">
                                    <label>Fecha de nacimiento</label>
                                    <input type="date" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label>Años</label>
                                    <input type="text" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label>Meses</label>
                                    <input type="text" placeholder="">
                                </div>
                            </div>
                            
                            <h4 class="form-subtitle">Campos Opcionales</h4>
                            
                            <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>Especie</label>
                                    <select><option>Canino</option></select>
                                </div>
                                <div class="form-group-item">
                                    <label>Raza</label>
                                    <input type="text" placeholder="">
                                </div>
                            </div>

                            <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>Sexo</label>
                                    <select><option>Macho</option></select>
                                </div>
                                <div class="form-group-item">
                                    <label>Pelaje</label>
                                    <input type="text" placeholder="">
                                </div>
                            </div>

                            <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>Peso</label>
                                    <input type="text" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label>Veterinario que lo Atiende</label>
                                    <select><option></option></select>
                                </div>
                            </div>

                            <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>Comida que consume</label>
                                    <input type="text" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label>Vivienda: ¿con qué otros animales convive?</label>
                                    <input type="text" placeholder="">
                                </div>
                            </div>
                            
                            <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>Última cita</label>
                                    <input type="text" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label>Chip</label>
                                    <input type="text" placeholder="">
                                </div>
                            </div>

                            <div class="form-inline-group form-4-cols checkbox-row">
                                <div class="checkbox-group"><input type="checkbox" id="adopcion"><label for="adopcion">Adopción</label></div>
                                <div class="checkbox-group"><input type="checkbox" id="silvestre"><label for="silvestre">Fallecio</label></div>
                                <div class="checkbox-group"><input type="checkbox" id="reproductor"><label for="reproductor">Reproductor</label></div>
                                <div class="checkbox-group"><input type="checkbox" id="castrado"><label for="castrado">Está castrado</label></div>
                            </div>

                            <div style="height: 10px;"></div> <div class="form-inline-group">
                                <div class="form-group-item">
                                    <label>¿Apto un colegiado?</label>
                                    <select><option>No</option></select>
                                </div>
                                <div class="form-group-item">
                                    <label>Agresividad</label>
                                    <input type="text" placeholder="Nivel de Agresividad">
                                </div>
                            </div>
                            
                            <label>Patologías preexistentes</label>
                            <textarea rows="3"></textarea>

                            <label>Foto de perfil</label>
                            <div class="form-inline-group file-upload-group">
                                <input type="text" placeholder="Browse" disabled>
                                <button type="button" class="btn-browse">Browse</button>
                            </div>

                        </form>
                    </div>

                </section>
            </main>
        </div>
    </body>
</html>