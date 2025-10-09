package servlets;

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
import org.mindrot.jbcrypt.BCrypt; // Importar Bcrypt

@WebServlet("/SvInicioSesion") // Cambiamos a un nombre con notación estándar
public class SvInicioSesion extends HttpServlet {

    // --- Credenciales de la Base de Datos (¡REEMPLAZA ESTO!) ---
    private static final String DB_URL = "jdbc:mysql://localhost:3306/doki_vet_db?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "Teffa.0302"; 
    
    // ... (doGet se mantiene) ...

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String correo = request.getParameter("correo");
        String passwordIngresada = request.getParameter("password");

        boolean usuarioValido = false; 
        String nombreUsuario = ""; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                
                // Consulta: Obtiene la contraseña hasheada y el nombre basado en el correo
                String sql = "SELECT password, nombre FROM usuarios WHERE correo = ?";
                
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, correo);
                    
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            String passwordHashDB = rs.getString("password");
                            nombreUsuario = rs.getString("nombre");
                            
                            // *** VERIFICACIÓN CON BCRYPT ***
                            // Compara la contraseña ingresada con el hash guardado en la BD
                            if (BCrypt.checkpw(passwordIngresada, passwordHashDB)) { 
                                usuarioValido = true;
                            }
                        }
                    }
                }
            }
            
        } catch (Exception e) {
            System.err.println("Error en el login: " + e.getMessage());
            usuarioValido = false;
        }

        if (usuarioValido) {
            // Éxito: Crear sesión y redirigir
            request.getSession().setAttribute("nombreUsuario", nombreUsuario);
            response.sendRedirect("bienvenida.jsp"); 
            
        } else {
            // Fallo: Reenviar al formulario con error
            request.setAttribute("error", "Usuario o clave incorrectos. Intenta de nuevo."); 
            request.setAttribute("errorExist", true); 
            request.getRequestDispatcher("inicio_sesion.jsp").forward(request, response);
        }
    }
}