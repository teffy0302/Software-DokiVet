<%-- nuevo_recordatorio.jsp - FORMULARIO PARA CREAR UN NUEVO RECORDATORIO --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Nuevo Recordatorio</title>
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
                        <li class="nav-item"><a href="#"><i class="fas fa-clipboard-list"></i> Registros</a></li>
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
                            <span class="user-name">HOLA⚕️, <%= nombreUsuario.toUpperCase() %> 🤝🏻 </span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                <div class="page-header client-page-header">
                    <div class="page-header-left">
                        <a href="lista_recordatorios.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a> 
                        <h2>Nuevo Recordatorio</h2>
                    </div>
                    <div class="page-header-right">
                        <button class="btn-cancel" onclick="window.location.href='lista_recordatorios.jsp'"><i class="fas fa-times"></i> Cancelar</button>
                        <button class="btn-save"><i class="fas fa-save"></i> Guardar</button>
                    </div>
                </div>

                
                <section class="patient-form-section">
                    
                    <div class="card form-card card-full-width">
                        
                        <form class="new-patient-form-vertical">
                        <div class="form-grid">
                            
                            <div class="form-column">
                                <div class="form-group-item">
                                    <label for="usuario">Usuario</label>
                                    <input type="text" id="usuario" name="usuario" value="<%= nombreUsuario %>" readonly>
                                </div>
                                <div class="form-group-item">
                                    <label for="paciente">Paciente</label>
                                    <input type="text" id="paciente" name="paciente" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label for="nombre_paciente">Nombre del Paciente</label>
                                    <input type="text" id="nombre_paciente" name="nombre_paciente" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label for="telefono">Número Celular</label>
                                    <input type="text" id="telefono" name="telefono" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label for="intervalo_repeticion">Intervalo de Repetición</label>
                                    <select id="intervalo_repeticion" name="intervalo_repeticion">
                                        <option value="none">Sin repetición</option>
                                        <option value="diario">Diario</option>
                                        <option value="semanal">Semanal</option>
                                        <option value="mensual">Mensual</option>
                                        <option value="personalizado">Personalizado</option>
                                    </select>
                                </div>
                                
                                <div class="form-group-item">
                                    <label for="fecha">Fecha</label>
                                    <input type="date" id="fecha" name="fecha" required>
                                </div>
                                
                                <div class="form-group-item">
                                    <label for="ocultar_horas">Ocultar Horas</label>
                                    <select id="ocultar_horas" name="ocultar_horas">
                                        <option value="no">No</option>
                                        <option value="si">Sí</option>
                                    </select>
                                </div>
                                
                                <div class="form-group-item">
                                    <label for="motivo">Motivo</label>
                                    <textarea id="motivo" name="motivo" rows="4" placeholder=""></textarea>
                                </div>
                            </div>
                            
                            <div class="form-column">
                                <div class="form-group-item">
                                    <label for="tipo_recordatorio">Tipo de Recordatorio</label>
                                    <select id="tipo_recordatorio" name="tipo_recordatorio" required>
                                        <option value="">Seleccione un Tipo</option>
                                        <option value="cita">Cita</option>
                                        <option value="tarea">Tarea</option>
                                        <option value="vacuna">Vacuna/Desparasitación</option>
                                        <option value="llamada">Llamada</option>
                                    </select>
                                </div>
                                <div class="form-group-item">
                                    <label for="nombre_cliente">Nombre del Propietario</label>
                                    <input type="text" id="nombre_cliente" name="nombre_cliente" placeholder="">
                                </div>
                                <div class="form-group-item">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" placeholder="email@cliente.com">
                                </div>
                                <div class="form-group-item">
                                    <label for="tipo_repeticion">Tipo de Repetición</label>
                                    <select id="tipo_repeticion" name="tipo_repeticion">
                                        <option value="dias">Días</option>
                                        <option value="semanas">Semanas</option>
                                        <option value="meses">Meses</option>
                                        <option value="anios">Años</option>
                                    </select>
                                </div>
                                <div class="form-group-item">
                                    <label for="en_cuantos_dias">¿En cuántos días?</label>
                                    <input type="number" id="en_cuantos_dias" name="en_cuantos_dias" value="1" min="1" placeholder="Número de días a partir de hoy">
                                </div>
                                <div class="form-group-item">
                                    <label for="duracion">Duración (Minutos)</label>
                                    <input type="number" id="duracion" name="duracion" value="30" min="5" step="5" placeholder="Minutos">
                                </div>
                                
                                <div class="form-group-item">
                                    <label for="notas_internas">Notas Internas</label>
                                    <textarea id="notas_internas" name="notas_internas" rows="4" placeholder="Notas solo visibles para el personal de la clínica."></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-section-divider"></div>
                        
                        <div class="page-header-right" style="justify-content: flex-end;">
                            <button class="btn-cancel" type="button" onclick="window.location.href='lista_recordatorios.jsp'"><i class="fas fa-times"></i> Cancelar</button>
                            <button class="btn-save" type="submit"><i class="fas fa-save"></i> Guardar</button>
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