/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import Modelo.dao.LibroReclamacionesDAO;
import Modelo.dto.LibroReclamaciones;
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
@WebServlet(name = "ServeletRegistroLibroReclamos", urlPatterns = {"/ServeletRegistroLibroReclamos"})
public class ServeletRegistroLibroReclamos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServeletRegistroLibroReclamos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServeletRegistroLibroReclamos at " + request.getContextPath() + "</h1>");
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
        
        String nombreCliente=request.getParameter("nombreCompleto");
        String dniStr=request.getParameter("dniLR");
        String telefono=request.getParameter("telefonoLR");
        String mail=request.getParameter("mailLR");
        String ubicacion=request.getParameter("Domicilio");
        String razon=request.getParameter("razonReclamo");
                        
        int dniPaciente=Integer.parseInt(dniStr);


        LibroReclamaciones nuevoReclamo = new LibroReclamaciones();
        nuevoReclamo.setDni(dniPaciente);
        nuevoReclamo.setNombre(nombreCliente);
        nuevoReclamo.setTelefono(telefono);
        nuevoReclamo.setMail(mail);
        nuevoReclamo.setDomcilio(ubicacion);
        nuevoReclamo.setDetalles(razon);
        
                
        LibroReclamacionesDAO reclamo=new LibroReclamacionesDAO();
        reclamo.postLibroReclamaciones(nuevoReclamo);
        
        HttpSession session=request.getSession();
        
        session.setAttribute("mensajeCita", "SU CUENTA FUE GUARDADA CORRECTAMENTE");
        
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
