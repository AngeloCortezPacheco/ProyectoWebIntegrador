/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controladores;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletVistaCitas", urlPatterns = {"/ServletVistaCitas"})
public class ServeletVistaCitas extends HttpServlet {
    
    // URL del microservicio Spring Boot
    private static final String MICROSERVICE_URL = "http://localhost:8083/api/citas/paciente/";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Verificar que el usuario esté logueado
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            session = request.getSession(true);
            session.setAttribute("mensajeLogin", "Debe iniciar sesión para ver sus citas");
            response.sendRedirect(request.getContextPath() + "/Vista/Login.jsp");
            return;
        }
        
        // Obtener el DNI del paciente de la sesión
        Integer dniPaciente = (Integer) session.getAttribute("dniPaciente");
        
        if (dniPaciente == null) {
            session.setAttribute("mensajeLogin", "No se pudo identificar su cuenta");
            response.sendRedirect(request.getContextPath() + "/Vista/Login.jsp");
            return;
        }
        
        try {
            // Consumir el microservicio
            List<Map<String, String>> citas = obtenerCitasDesdeAPI(dniPaciente);
            
            // Enviar datos al JSP
            request.setAttribute("citas", citas);
            request.setAttribute("totalCitas", citas.size());
            
            // Forward al JSP
            request.getRequestDispatcher("/Vista/VistaCitas.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error al obtener citas del microservicio: " + e.getMessage());
            e.printStackTrace();
            
            request.setAttribute("error", "Error al cargar las citas: " + e.getMessage());
            request.setAttribute("citas", new ArrayList<>());
            request.getRequestDispatcher("/Vista/VistaCitas.jsp").forward(request, response);
        }
    }
    
    /**
     * Método para consumir el API REST del microservicio
     * @param dniPaciente DNI del paciente
     * @return Lista de citas
     */
    private List<Map<String, String>> obtenerCitasDesdeAPI(Integer dniPaciente) throws IOException {
        List<Map<String, String>> citasList = new ArrayList<>();
        
        // Construir URL
        String urlString = MICROSERVICE_URL + dniPaciente;
        URL url = new URL(urlString);
        
        System.out.println("=== Consumiendo API: " + urlString + " ===");
        
        // Abrir conexión
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(5000);
        
        // Verificar respuesta
        int responseCode = conn.getResponseCode();
        System.out.println("Response Code: " + responseCode);
        
        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Leer respuesta
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder responseBody = new StringBuilder();
            
            while ((inputLine = in.readLine()) != null) {
                responseBody.append(inputLine);
            }
            in.close();
            
            System.out.println("Response: " + responseBody.toString());
            
            // Parsear JSON con Gson
            Gson gson = new Gson();
            JsonObject jsonResponse = gson.fromJson(responseBody.toString(), JsonObject.class);
            
            if (jsonResponse.get("success").getAsBoolean()) {
                JsonArray citasArray = jsonResponse.getAsJsonArray("citas");
                
                for (int i = 0; i < citasArray.size(); i++) {
                    JsonObject citaJson = citasArray.get(i).getAsJsonObject();
                    
                    Map<String, String> cita = new HashMap<>();
                    cita.put("dni", citaJson.get("dniPaciente").getAsString());
                    cita.put("fecha", citaJson.get("fechaCitaFormateada").getAsString());
                    cita.put("hora", citaJson.get("horaCitaFormateada").getAsString());
                    cita.put("motivo", citaJson.get("motivoCita").getAsString());
                    cita.put("estado", citaJson.get("estadoCita").getAsString());
                    
                    citasList.add(cita);
                }
                
                System.out.println("=== Se cargaron " + citasList.size() + " citas ===");
            }
        } else {
            throw new IOException("Error en la API: HTTP " + responseCode);
        }
        
        conn.disconnect();
        return citasList;
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}