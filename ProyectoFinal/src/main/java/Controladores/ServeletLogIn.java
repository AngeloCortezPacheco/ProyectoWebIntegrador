/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.dao.PacientesDAO;
import Modelo.dto.Pacientes;
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
@WebServlet(name = "ServeletLogIn", urlPatterns = {"/ServeletLogIn"})
public class ServeletLogIn extends HttpServlet {
    
    private PacientesDAO pacientesDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        pacientesDAO = new PacientesDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir al login si acceden por GET
        response.sendRedirect(request.getContextPath() + "/Vista/Login.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Configurar encoding para caracteres especiales
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        // Obtener parámetros del formulario (username puede ser email o DNI)
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Validar que no estén vacíos
        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            
            HttpSession session = request.getSession();
            session.setAttribute("mensajeLogin", "Por favor, complete todos los campos");
            response.sendRedirect(request.getContextPath() + "/Vista/Login.jsp");
            return;
        }
        
        try {
            // Crear instancia del DAO si no existe
            if (pacientesDAO == null) {
                pacientesDAO = new PacientesDAO();
            }
            
            // Validar credenciales usando el DAO
            Pacientes paciente = pacientesDAO.validarLogin(username.trim(), password);
            
            if (paciente != null) {
                // Login exitoso - Crear sesión
                HttpSession session = request.getSession(true);
                
                // Guardar información del paciente en la sesión
                session.setAttribute("paciente", paciente);
                session.setAttribute("usuarioLogueado", true);
                session.setAttribute("dniPaciente", paciente.getIdPaciente());
                session.setAttribute("nombrePaciente", paciente.getNombre());
                session.setAttribute("emailPaciente", paciente.getEmail());
                session.setAttribute("telefonoPaciente", paciente.getTelefono());
                session.setAttribute("generoPaciente", paciente.getGenero());
                
                // Establecer tiempo de expiración de la sesión (30 minutos)
                session.setMaxInactiveInterval(30 * 60);
                
                System.out.println("Login exitoso para DNI: " + paciente.getIdPaciente());
                System.out.println("Nombre: " + paciente.getNombre());
                
                // Mensaje de bienvenida
                session.setAttribute("mensajeBienvenida", "¡Bienvenido/a " + paciente.getNombre() + "!");
                
                // Verificar si hay una página de destino guardada
                String paginaDestino = (String) session.getAttribute("redirigirA");
                if (paginaDestino != null && !paginaDestino.isEmpty()) {
                    session.removeAttribute("redirigirA");
                    response.sendRedirect(paginaDestino);
                } else {
                    // Redirigir a la página principal
                    response.sendRedirect(request.getContextPath() + "/Vista/PaginaPrincipal.jsp");
                }
                
            } else {
                // Login fallido
                HttpSession session = request.getSession();
                session.setAttribute("mensajeLogin", "Email/DNI o contraseña incorrectos. Por favor, intente nuevamente.");
                
                System.out.println("Login fallido para: " + username);
                response.sendRedirect(request.getContextPath() + "/Vista/Login.jsp");
            }
            
        } catch (Exception e) {
            System.err.println("Error en ServletLogin: " + e.getMessage());
            e.printStackTrace();
            
            HttpSession session = request.getSession();
            session.setAttribute("mensajeLogin", "Error del sistema. Por favor, intente más tarde.");
            response.sendRedirect(request.getContextPath() + "/Vista/Login.jsp");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Servlet para manejar el inicio de sesión de pacientes";
    }
}