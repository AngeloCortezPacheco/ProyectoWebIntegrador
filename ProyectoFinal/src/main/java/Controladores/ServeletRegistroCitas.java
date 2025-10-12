package Controladores;

import Modelo.dao.CitasDAO;
import Modelo.dto.Citas;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServeletRegistroCitas", urlPatterns = {"/ServeletRegistroCitas"})
public class ServeletRegistroCitas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServeletRegistroCitas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServeletRegistroCitas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String nombreCompleto = request.getParameter("fullname");
        String telefono = request.getParameter("telefono");
        String mail = request.getParameter("mail");
        String fechaCita = request.getParameter("fechacita");
        String horaCita = request.getParameter("horacita");
        int dniStr = Integer.parseInt(request.getParameter("dni"));
        String motivoCita = request.getParameter("razon");

        Date fechaSQL = Date.valueOf(fechaCita); // Convierte "yyyy-MM-dd" a un objeto Date
        Time horaSQL = Time.valueOf(horaCita + ":00"); // Convierte "HH:mm" a "HH:mm:ss" y luego a un objeto Time
    
        
        /*if (dniStr == null || dniStr.trim().length() != 8) {
            // Si el DNI es inválido, redirigimos a una página de error
            response.sendRedirect("error.jsp?msg=DNI_invalido");
            return;
        }*/


        Citas nuevaCita = new Citas();
        nuevaCita.setDniPaciente(dniStr);
        nuevaCita.setFechaCita(fechaSQL);
        nuevaCita.setHoraCita(horaSQL);
        nuevaCita.setText(motivoCita);
        
        CitasDAO citaDAO=new CitasDAO();
        citaDAO.postCitas(nuevaCita);
        
        response.sendRedirect(request.getContextPath() + "/Vista/PaginaPrincipal.jsp");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
