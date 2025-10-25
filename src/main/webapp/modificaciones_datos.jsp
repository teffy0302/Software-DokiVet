<%-- modificaciones_datos.jsp - Muestra la lista de modificaciones y auditoría de datos --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Modificaciones de Datos</title>
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
                                 <li class="nav-item"><a href="emails_enviados.jsp">Emails enviados</a></li>
                                 <li class="nav-item active"><a href="modificaciones_datos.jsp">Modificaciones de datos</a></li>
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
                            <span class="user-name">HOLA⚕️​, <%= nombreUsuario.toUpperCase() %> 🤗 ​</span>
                            <img src="img/logo-doki-vet-redondo.png" alt="User Avatar" class="user-avatar">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </div>
                </header>

                <section class="taskboard-header">
                    <div class="taskboard-title">
                        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left"></i></a>
                        <h2>Modificación de Datos</h2>
                    </div>
                    <div class="taskboard-options">

                    </div>
                </section>
                <section class="task-columns-grid">
                <section class="card card-full-width">  
                    
                    <div class="search-bar-container" style="width: 250px;">
                        <select class="search-input" style="padding-left: 15px;">
                            <option value="">🔎 Filtrar por</option>
                            <option value="usuario">Usuario</option>
                            <option value="elemento">Registro modificado</option>
                            <option value="accion">Tipo de acción</option>
                        </select>
                    </div>

                    
                    <div class="table-responsive" style="margin-top: 20px;">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 15%;">Modificado el</th>
                                    <th style="width: 25%;">Usuario</th>
                                    <th style="width: 30%;">Registro Modificado</th>
                                    <th style="width: 20%;">Tipo de Acción</th>
                                    <th style="width: 10%;"></th> <%-- Columna de Acciones --%>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Simulación de Datos --%>
                                <tr>
                                    <td>15 de marzo 2025, 10:45</td>
                                    <td>Pedro Martínez</td>
                                    <td>Cita 523 (Cambio de hora)</td>
                                    <td><span class="status-tag status-info">Actualización</span></td>
                                    <td><button class="btn-icon" onclick="mostrarDetalle();"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>10 de marzo 2025, 16:30</td>
                                    <td>Admin</td>
                                    <td>Inventario (Insumo X)</td>
                                    <td><span class="status-tag status-danger">Eliminación</span></td>
                                    <td><button class="btn-icon" onclick="mostrarDetalle();"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>5 de marzo 2025, 12:10</td>
                                    <td>Dra. Gómez</td>
                                    <td>Paciente (Maximus)</td>
                                    <td><span class="status-tag status-success">Creación</span></td>
                                    <td><button class="btn-icon" onclick="mostrarDetalle();"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>1 de marzo 2025, 08:00</td>
                                    <td>Admin</td>
                                    <td>Usuario (Dr. Smith)</td>
                                    <td><span class="status-tag status-danger">Eliminación</span></td>
                                    <td><button class="btn-icon" onclick="mostrarDetalle();"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <tr>
                                    <td>25 de febrero 2025, 19:40</td>
                                    <td>Pedro Martínez</td>
                                    <td>Cliente (Ana Torres)</td>
                                    <td><span class="status-tag status-info">Actualización</span></td>
                                    <td><button class="btn-icon" onclick="mostrarDetalle();"><i class="fas fa-eye"></i></button></td>
                                </tr>
                                <%-- Fin Simulación --%>
                            </tbody>
                        </table>
                    </div>
                    
                    
                    <div class="pagination-footer">
                        <div class="pagination-info">
                            <span>Viendo 1 - 10 de 150 mensajes</span>
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
        
        
        <%-- =======================================
             MODAL DE DETALLE DE REGISTRO DE MODIFICACIÓN
             ======================================= --%>
        <div id="detalleModal" class="modal-overlay">
            <div class="modal-content card" style="width: 600px; max-width: 90%;">
                
                <div class="modal-header">
                    <h3>Detalle del Registro de Cambio</h3>
                    <button class="btn-icon close-modal-btn" onclick="cerrarDetalle();"><i class="fas fa-times"></i></button>
                </div>
                
                <div class="modal-body">
                    
                    <ul class="info-list" style="margin-bottom: 20px;">
                        <li><strong>ID Registro:</strong> 85461</li>
                        <li><strong>Fecha y Hora:</strong> 15 de marzo de 2025, 10:45</li>
                        <li><strong>Usuario:</strong> Pedro Martínez</li>
                        <li><strong>Elemento:</strong> Cita #523</li>
                        <li><strong>Tipo de Acción:</strong> <span class="status-tag status-info">Actualización</span></li>
                    </ul>
                    
                    <h4 style="border-bottom: 1px solid rgba(255, 255, 255, 0.1); padding-bottom: 5px; margin-bottom: 15px;">Campos Modificados</h4>
                    
                    <div class="form-grid" style="grid-template-columns: 1fr 1fr; gap: 15px;">
                        
                        <div class="form-group-item">
                            <label>Campo:</label>
                            <input type="text" value="Hora Inicio" readonly style="background-color: transparent; border: none; padding-left: 0;">
                        </div>
                        <div class="form-group-item">
                            <label>Valor Anterior:</label>
                            <input type="text" value="11:00 AM" readonly>
                        </div>
                        
                        <div class="form-group-item" style="grid-column: 2 / 3;">
                            <label>Valor Nuevo:</label>
                            <input type="text" value="10:30 AM" readonly style="border-color: var(--primary-blue); background-color: var(--dark-input);">
                        </div>
                        
                        <div class="form-section-divider" style="grid-column: 1 / -1; margin: 5px 0 5px 0;"></div>
                        
                         <div class="form-group-item">
                            <label>Campo:</label>
                            <input type="text" value="Notas Internas" readonly style="background-color: transparent; border: none; padding-left: 0;">
                        </div>
                        <div class="form-group-item">
                            <label>Valor Anterior:</label>
                            <textarea readonly style="min-height: 50px;">Nota: Sin cambios.</textarea>
                        </div>
                        
                        <div class="form-group-item" style="grid-column: 2 / 3;">
                            <label>Valor Nuevo:</label>
                            <textarea readonly style="min-height: 50px; border-color: var(--primary-blue); background-color: var(--dark-input);">Nota: Llamar al cliente para confirmar la cita.</textarea>
                        </div>
                        
                    </div>
                    
                </div>
                
                <div class="modal-footer" style="padding-top: 20px; text-align: right;">
                    <button class="btn-cancel" onclick="cerrarDetalle();"><i class="fas fa-times"></i> Cerrar</button>
                </div>
                
            </div>
        </div>


        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Lógica para abrir/cerrar submenús (Acordeón de la Sidebar)
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

            // Función para mostrar el modal de detalle
            function mostrarDetalle() {
                document.getElementById('detalleModal').style.display = 'block';
            }
            
            // Función para cerrar el modal
            function cerrarDetalle() {
                document.getElementById('detalleModal').style.display = 'none';
            }

            // Cerrar el modal haciendo clic fuera de él
            window.onclick = function(event) {
                const modal = document.getElementById('detalleModal');
                if (event.target === modal) {
                    modal.style.display = "none";
                
            
        </script>

    </body>
</html>