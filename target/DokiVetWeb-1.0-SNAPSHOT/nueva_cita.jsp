<%-- nueva_cita.jsp - FORMULARIO PARA AGENDAR UNA NUEVA CITA --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Nueva Cita</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="css/estilos_dashboard.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        
        <% 
            // 1. Lógica de Seguridad: Verificar la sesión y obtener datos
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
                            <span class="user-name">HOLA⚕️, <%= nombreUsuario.toUpperCase() %> 🩺​​ </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                <div class="page-header client-page-header">
                    <div class="page-header-left">
                        <a href="lista_recordatorio.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
                        <h2>Nueva Cita</h2>
                    </div>
                    <div class="page-header-right">
                        <button class="btn-cancel" onclick="window.location.href='lista_recordatorios.jsp'"><i class="fas fa-times"></i> Cancelar</button>
                        <button class="btn-save"><i class="fas fa-save"></i> Guardar</button>
                    </div>
                </div>
                
                <section class="patient-form-section">
                    
                    <div class="card form-card card-full-width">
                        
                        <form class="new-patient-form-vertical">
                    
                                <div class="form-group-item">
                                                            
                        <h4 class="form-subtitle-recordatorio">1. Datos de la Cita</h4>
                        
                        <div class="form-grid">
                            
                            <div class="form-group-item">
                                <label for="fecha">Fecha</label>
                                <input type="date" id="fecha" name="fecha" required>
                            </div>
                            
                            <div class="form-group-item">
                                <label for="hora_inicio">Hora de Inicio</label>
                                <input type="time" id="hora_inicio" name="hora_inicio" required>
                            </div>
                            
                            <div class="form-group-item">
                                <label for="duracion">Duración (minutos)</label>
                                <input type="number" id="duracion" name="duracion" value="30" min="10" step="5" required>
                            </div>
                            
                            <div class="form-group-item">
                                <label for="veterinario">Veterinario Asignado</label>
                                <select id="veterinario" name="veterinario" required>
                                    <option value="">Seleccione un veterinario</option>
                                    <option value="<%= nombreUsuario %>">Yo (<%= nombreUsuario %>)</option>
                                    <option value="Dr. Smith">Dr. Smith</option>
                                    <option value="Dra. Gómez">Dra. Gómez</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-section-divider"></div>
                        
                        <h4 class="form-subtitle-recordatorio">2. Paciente y Cliente</h4>
                        
                        <div class="form-grid">
                            
                            <div class="form-group-item">
                                <label for="paciente">Buscar Paciente (ID o Nombre)</label>
                                <input type="text" id="paciente" name="paciente" placeholder="Haga clic y busque un paciente">
                            </div>
                            
                            <div class="form-group-item">
                                <label for="nombre_paciente">Nombre del Paciente (Automático)</label>
                                <input type="text" id="nombre_paciente" name="nombre_paciente" placeholder="Nombre (llenado automático)" readonly>
                            </div>
                            
                            <div class="form-group-item">
                                <label for="cliente">Nombre del Cliente (Automático)</label>
                                <input type="text" id="cliente" name="cliente" placeholder="Cliente (llenado automático)" readonly>
                            </div>
                            
                            <div class="form-group-item">
                                <label for="motivo_cita">Tipo de Servicio/Motivo</label>
                                <select id="motivo_cita" name="motivo_cita" required>
                                    <option value="">Seleccione</option>
                                    <option value="Consulta General">Consulta General</option>
                                    <option value="Vacunación">Vacunación</option>
                                    <option value="Control Post-Operación">Control Post-Operación</option>
                                    <option value="Examen de Laboratorio">Examen de Laboratorio</option>
                                    <option value="Otro">Otro</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-section-divider"></div>

                        <h4 class="form-subtitle-recordatorio">3. Notas y Estado</h4>
                        
                        <div class="form-grid">
                            
                            <div class="form-group-item">
                                <label for="estado">Estado de la Cita</label>
                                <select id="estado" name="estado">
                                    <option value="Pendiente">Pendiente</option>
                                    <option value="Confirmada">Confirmada</option>
                                    <option value="Cancelada">Cancelada</option>
                                    <option value="Completada">Completada</option>
                                </select>
                            </div>
                            
                            <div class="form-group-item">
                                <label for="recordar_cliente">Recordar al Cliente (Vía)</label>
                                <select id="recordar_cliente" name="recordar_cliente">
                                    <option value="No">No Recordar</option>
                                    <option value="WhatsApp">WhatsApp</option>
                                    <option value="Email">Email</option>
                                    <option value="Llamada">Llamada</option>
                                </select>
                            </div>

                            <div class="form-group-item" style="grid-column: 1 / -1;">
                                <label for="notas">Notas Internas (Motivo, detalles, etc.)</label>
                                <textarea id="notas" name="notas" rows="3" placeholder="Notas sobre la cita, recordatorios para el veterinario o instrucciones."></textarea>
                            </div>
                        </div>
                        
                        <div class="form-section-divider"></div>
                        
                        <div class="page-header-right" style="justify-content: flex-end;">
                            <button class="btn-cancel" type="button" onclick="window.location.href='gestion_citas.jsp'"><i class="fas fa-times"></i> Cancelar</button>
                            <button class="btn-save" type="submit"><i class="fas fa-save"></i> Guardar Cita</button>
                        </div>
                    </form>
                </section>
            </main>
        </div>
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Selecciona todos los enlaces que son padres de un submenú
                document.querySelectorAll('.has-submenu > a').forEach(item => {
                    item.addEventListener('click', function(e) {
                        const parentLi = this.closest('.has-submenu');
                        const submenu = parentLi.querySelector('.submenu');

                        if (submenu) {
                            e.preventDefault(); 
                            
                            // Cierra otros submenús abiertos
                            document.querySelectorAll('.has-submenu.submenu-open').forEach(openItem => {
                                if (openItem !== parentLi) {
                                    openItem.classList.remove('submenu-open');
                                    openItem.querySelector('.submenu').classList.remove('visible');
                                }
                            });

                            // Abre o cierra el submenú actual
                            parentLi.classList.toggle('submenu-open');
                            submenu.classList.toggle('visible');
                        }
                    });
                });
            });
        </script>

    </body>
</html>