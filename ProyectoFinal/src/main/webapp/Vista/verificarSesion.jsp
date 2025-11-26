
<%@page import="Modelo.dto.Pacientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Obtener la sesión sin crear una nueva
    HttpSession currentSession = request.getSession(false);
    
    // Verificar si existe sesión y si el usuario está logueado
    Boolean usuarioLogueado = null;
    if (currentSession != null) {
        Object atributo = currentSession.getAttribute("usuarioLogueado");
        if (atributo != null) {
            usuarioLogueado = (Boolean) atributo;
        }
    }
    
    // Si no hay sesión o el usuario no está logueado, redirigir al login
    if (usuarioLogueado == null || !usuarioLogueado) {
        // No hay sesión activa - redirigir al login
        HttpSession nuevaSesion = request.getSession(true);
        nuevaSesion.setAttribute("mensajeLogin", "Debe iniciar sesión para acceder a esta página");
        response.sendRedirect(request.getContextPath() + "/Vista/LogIn.jsp");
        return;
    }
    
    // Obtener datos del paciente de la sesión
    Pacientes pacienteActual = (Pacientes) currentSession.getAttribute("paciente");
    String nombrePaciente = (String) currentSession.getAttribute("nombrePaciente");
    Integer dniPaciente = (Integer) currentSession.getAttribute("dniPaciente");
    String emailPaciente = (String) currentSession.getAttribute("emailPaciente");
%>