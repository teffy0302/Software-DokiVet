/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SvCerrarSesion")
public class SvCerrarSesion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Obtener la sesión actual
        HttpSession session = request.getSession(false); // No crea una nueva si no existe
        
        if (session != null) {
            // Invalidar (destruir) la sesión
            session.invalidate(); 
        }
        
        // Redirigir al usuario a la página de inicio de sesión
        response.sendRedirect("inicio_sesion.jsp?logout=true");
    }
    
    // El método GET no es recomendado para cerrar sesión, pero se puede añadir
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}