package Controladores;

import Modelo.dao.CitasDAO;
import Modelo.dto.Citas;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServeletRegistroCitas", urlPatterns = {"/ServeletRegistroCitas"})
public class ServeletRegistroCitas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Si acceden por GET, redirigir al formulario
        response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Configurar encoding para caracteres especiales
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        
        try {
            // Obtener parámetros del formulario
            String nombreCompleto = request.getParameter("fullname");
            String telefono = request.getParameter("telefono");
            String mail = request.getParameter("mail");
            String fechaCita = request.getParameter("fechacita");
            String horaCita = request.getParameter("horacita");
            String dniStr = request.getParameter("dni"); // ✅ CORREGIDO
            String motivoCita = request.getParameter("razon");
            
            System.out.println("=== DATOS RECIBIDOS ===");
            System.out.println("Nombre: " + nombreCompleto);
            System.out.println("DNI: " + dniStr);
            System.out.println("Fecha: " + fechaCita);
            System.out.println("Hora: " + horaCita);
            
            // Validar que no estén vacíos los campos esenciales
            if (dniStr == null || dniStr.trim().isEmpty() ||
                fechaCita == null || fechaCita.trim().isEmpty() ||
                horaCita == null || horaCita.trim().isEmpty() ||
                motivoCita == null || motivoCita.trim().isEmpty()) {
                
                session.setAttribute("mensajeCita", "Por favor, complete todos los campos obligatorios del formulario");
                response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
                return;
            }
            
            // Validar DNI
            if (dniStr.trim().length() != 8) {
                session.setAttribute("mensajeCita", "El DNI debe tener exactamente 8 dígitos");
                response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
                return;
            }
            
            int dniPaciente;
            try {
                dniPaciente = Integer.parseInt(dniStr.trim());
            } catch (NumberFormatException e) {
                session.setAttribute("mensajeCita", "El DNI debe contener solo números");
                response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
                return;
            }
            
            // Convertir fecha y hora
            Date fechaSQL = Date.valueOf(fechaCita); // yyyy-MM-dd
            Time horaSQL = Time.valueOf(horaCita + ":00"); // HH:mm:ss
            
            // Crear objeto Cita usando tu constructor existente
            Citas nuevaCita = new Citas(dniPaciente, fechaSQL, horaSQL, motivoCita);
            
            // Guardar en base de datos
            CitasDAO citaDAO = new CitasDAO();
            citaDAO.postCitas(nuevaCita);
            
            session.setAttribute("mensajeCita", "SU CITA FUE GUARDADA CORRECTAMENTE");
            System.out.println("Cita registrada exitosamente para DNI: " + dniPaciente);
            
            response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
            
        } catch (IllegalArgumentException e) {
            // Error en formato de fecha/hora
            System.err.println("Error en formato de fecha/hora: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("mensajeCita", "Formato de fecha u hora inválido. Use el formato correcto.");
            response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
            
        } catch (Exception e) {
            // Error general
            System.err.println("Error al registrar cita: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("mensajeCita", "Error del sistema. Por favor, intente más tarde.");
            response.sendRedirect(request.getContextPath() + "/Vista/Citas.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar citas médicas";
    }
}