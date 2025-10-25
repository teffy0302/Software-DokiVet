<%-- gestion_accesos.jsp - GESTIÓN DE ROLES, PERMISOS Y USUARIOS --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doki Vet - Accesos y Permisos</title>
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
            
            // Lógica de seguridad adicional: Solo Administradores pueden ver esta página
            if (!"Administrador".equals(rolUsuario)) {
                // Redirigir a dashboard si no tiene el rol
                response.sendRedirect("dashboard.jsp"); 
                return;
            }
        %>

        <div class="dashboard-container">
            
            <aside class="sidebar">
                <div class="sidebar-header">
                    <img src="img/logo-doki-vet-redondo.png" alt="Doki Vet Logo" class="sidebar-logo-round">
                </div>
                
                <nav class="sidebar-nav">
                    <ul>
                        <%-- ... Otros ítems del menú ... --%>
                        
                        <li class="nav-item active has-submenu submenu-open">
                            <a href="#"><i class="fas fa-cog"></i> <span>Gestión del Sistema</span> <i class="fas fa-chevron-down submenu-arrow"></i></a>
                            <ul class="submenu visible">
                                 <li class="nav-item active"><a href="gestion_accesos.jsp">Accesos</a></li>
                                 <li class="nav-item"><a href="configuracion_general.jsp">Configuración General</a></li>
                            </ul>
                        </li>

                        <%-- ... Resto del menú ... --%>
                    </ul>
                </nav>
            </aside>

            
            <main class="main-content">
                
                <header class="navbar">
                    <div class="navbar-left">
                        <i class="fas fa-bars menu-toggle"></i>
                        <span class="access-text">Accesos</span>
                    </div>
                    <span class="view-title">Gestión de Accesos</span>
                    <div class="navbar-right">
                        <a href="notificaciones.jsp" class="nav-icon"><i class="fas fa-bell"></i></a>
                        <div class="user-profile">
                            <span class="user-name"><%= nombreUsuario %></span>
                            <img src="img/user-avatar.png" alt="Avatar" class="user-avatar">
                            <i class="fas fa-chevron-down"></i>
                        </div>
                    </div>
                </header>

                
                <div class="dashboard-grid" style="grid-template-columns: 1fr 2fr;">
                    
                    <section class="card">
                        <h4><i class="fas fa-user-tag"></i> Roles del Sistema</h4>
                        
                        <div class="table-responsive">
                            <table class="simple-list-table">
                                <thead>
                                    <tr>
                                        <th>Rol</th>
                                        <th style="width: 25%;">Usuarios</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Simulación de Roles --%>
                                    <tr class="active-row">
                                        <td>Administrador</td>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>Veterinario</td>
                                        <td>4</td>
                                    </tr>
                                    <tr>
                                        <td>Recepcionista</td>
                                        <td>3</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <button class="btn-save" style="margin-top: 15px; width: 100%;"><i class="fas fa-plus"></i> Nuevo Rol</button>
                    </section>
                    
                    
                    <section class="card">
                        <h4><i class="fas fa-shield-alt"></i> Permisos para: Administrador</h4>
                        
                        <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                            <table>
                                <thead>
                                    <tr>
                                        <th style="width: 50%;">Módulo / Acción</th>
                                        <th style="width: 20%; text-align: center;">Lectura</th>
                                        <th style="width: 20%; text-align: center;">Escritura</th>
                                        <th style="width: 10%; text-align: center;">Borrar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Simulación de Permisos --%>
                                    <tr>
                                        <td>Dashboard (Vista Principal)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                    </tr>
                                    <tr>
                                        <td>Clientes (Ver lista)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                    </tr>
                                     <tr>
                                        <td>Clientes (Crear/Editar)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                    </tr>
                                    <tr>
                                        <td>Inventario (Ver stock)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                    </tr>
                                    <tr>
                                        <td>Inventario (Eliminar ítem)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                    </tr>
                                    <tr>
                                        <td>Ventas (Realizar)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                    </tr>
                                    <tr>
                                        <td>Gestión de Accesos (Esta página)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                    </tr>
                                    <%-- Permisos Deshabilitados para otros roles --%>
                                    <tr>
                                        <td>Registros (Emails enviados)</td>
                                        <td style="text-align: center;"><i class="fas fa-check-circle status-icon-success"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                        <td style="text-align: center;"><i class="fas fa-minus-circle status-icon-disabled"></i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div style="text-align: right; margin-top: 15px;">
                            <button class="btn-cancel"><i class="fas fa-times"></i> Descartar</button>
                            <button class="btn-save"><i class="fas fa-check"></i> Aplicar Cambios</button>
                        </div>
                    </section>
                    
                </div>
                
            </main>
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
                
                // Lógica para resaltar el rol seleccionado
                document.querySelectorAll('.simple-list-table tbody tr').forEach(row => {
                    row.addEventListener('click', function() {
                        document.querySelectorAll('.simple-list-table tbody tr').forEach(r => r.classList.remove('active-row'));
                        this.classList.add('active-row');
                        // Aquí iría la lógica para cargar los permisos del rol seleccionado (fase 2 - Servlet)
                        const rolName = this.querySelector('td').textContent;
                        document.querySelector('.card:nth-child(2) h4').textContent = 'Permisos para: ' + rolName;
                    });
                });
            });
        </script>

    </body>
</html>