/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author EQUIPO
 */
@WebServlet(name = "ServeletLogOut", urlPatterns = {"/ServeletLogOut"})
public class ServeletLogOut extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarLogout(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        procesarLogout(request, response);
    }
    
    private void procesarLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener la sesión actual (sin crear una nueva)
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Obtener información del usuario antes de cerrar sesión
            String nombreUsuario = (String) session.getAttribute("nombreUsuario");
            
            // Invalidar la sesión completamente
            session.invalidate();
            
            System.out.println("Sesión cerrada para: " + 
                (nombreUsuario != null ? nombreUsuario : "Usuario desconocido"));
        }
        
        // Crear una nueva sesión para el mensaje
        HttpSession nuevaSesion = request.getSession(true);
        nuevaSesion.setAttribute("mensajeLogin", "Sesión cerrada exitosamente");
        
        // Redirigir al login
        response.sendRedirect(request.getContextPath() + "/Vista/LogIn.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet para cerrar sesión de usuarios";
    }
}