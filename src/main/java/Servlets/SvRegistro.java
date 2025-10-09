/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// Importa la librería Bcrypt (Asegúrate que el JAR de jBCrypt esté en tu proyecto)
import org.mindrot.jbcrypt.BCrypt; 

@WebServlet("/SvRegistro")
public class SvRegistro extends HttpServlet {

    // --- Credenciales de la Base de Datos  ---
    private static final String DB_URL = "jdbc:mysql://localhost:3306/doki_vet_db?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "Teffa.0302"; 

    // Verifica si el correo ya existe en la BD
    private boolean emailExists(String correo) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "SELECT COUNT(*) FROM usuarios WHERE correo = ?";
        
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    return true; // El correo ya existe
                }
            }
        }
        return false; // El correo no existe
    }
    
    // Verifica si una cadena es nula o solo contiene espacios
    private boolean isInvalid(String str) {
        return str == null || str.trim().isEmpty();
    }

    // =================================================================
    // LÓGICA DE REGISTRO
    // =================================================================
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("registro.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        
        String errorMessage = null;

        try {
            // ===============================================
            // 2. VALIDACIÓN (LADO DEL SERVIDOR)
            // ===============================================
            
            // 2.1. Validación de campos vacíos
            if (isInvalid(nombre) || isInvalid(apellido) || isInvalid(cedula) || 
                isInvalid(fechaNacimiento) || isInvalid(correo) || isInvalid(password)) {
                
                errorMessage = "Todos los campos son obligatorios. Por favor, complétalos.";
                
            } else if (emailExists(correo)) {
                // 2.2. Validación de correo duplicado
                errorMessage = "El correo electrónico '" + correo + "' ya está registrado. Intenta iniciar sesión.";
            }

            // Si se detecta algún error de validación, reenvía al JSP
            if (errorMessage != null) {
                request.setAttribute("errorExist", true);
                request.setAttribute("errorMessage", errorMessage); // Mensaje específico para el JSP
                
                // Reenvía al formulario de registro para mostrar el error
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return; 
            }

            // ===============================================
            // 3. HASHING DE CONTRASEÑA CON BCRYPT
            // ===============================================
            // El factor de costo (12) determina la dificultad y seguridad del hash
            String passwordHashed = BCrypt.hashpw(password, BCrypt.gensalt(12)); 

            // ===============================================
            // 4. INSERCIÓN EN LA BASE DE DATOS
            // ===============================================
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                
                String sql = "INSERT INTO usuarios (nombre, apellido, cedula, fecha_nacimiento, correo, password) VALUES (?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, nombre);
                    ps.setString(2, apellido);
                    ps.setString(3, cedula);
                    ps.setString(4, fechaNacimiento);
                    ps.setString(5, correo);
                    ps.setString(6, passwordHashed); // Guarda el hash
                    
                    ps.executeUpdate();
                }
            }
            
            // 5. Éxito: Redirección al inicio de sesión
            response.sendRedirect("inicio_sesion.jsp?registro=exitoso");
            
        } catch (Exception e) {
            // Manejo de errores graves (conexión a DB, problema SQL, etc.)
            System.err.println("Error grave durante el registro: " + e.getMessage());
            
            // Reenvía a la página de error genérica para evitar mostrar errores internos
            request.setAttribute("errorExist", true);
            request.setAttribute("errorMessage", "Error interno del servidor. Inténtalo más tarde.");
            request.getRequestDispatcher("error_registro.jsp").forward(request, response);
        }
    }
}