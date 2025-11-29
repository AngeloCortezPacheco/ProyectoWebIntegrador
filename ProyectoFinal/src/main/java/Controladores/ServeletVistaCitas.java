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
import com.google.gson.JsonElement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletVistaCitas", urlPatterns = {"/ServletVistaCitas"})
public class ServeletVistaCitas extends HttpServlet {
    
    private static final String MICROSERVICE_URL = "http://localhost:8083/citas/paciente/";
    
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
            
            // Debug: Imprimir cantidad de citas encontradas
            System.out.println("✅ Total de citas obtenidas: " + citas.size());
            
            // Enviar datos al JSP
            request.setAttribute("citas", citas);
            request.setAttribute("totalCitas", citas.size());
            
            // Forward al JSP
            request.getRequestDispatcher("/Vista/VistaCitas.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ Error al obtener citas del microservicio: " + e.getMessage());
            e.printStackTrace();
            
            request.setAttribute("error", "Error al cargar las citas: " + e.getMessage());
            request.setAttribute("citas", new ArrayList<>());
            request.setAttribute("totalCitas", 0);
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
        
        System.out.println("🌐 Consumiendo API: " + urlString);
        
        // Abrir conexión
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(5000);
        
        // Verificar respuesta
        int responseCode = conn.getResponseCode();
        System.out.println("📡 Response Code: " + responseCode);
        
        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Leer respuesta
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuilder responseBody = new StringBuilder();
            
            while ((inputLine = in.readLine()) != null) {
                responseBody.append(inputLine);
            }
            in.close();
            
            String jsonResponse = responseBody.toString();
            System.out.println("📄 Response JSON: " + jsonResponse);
            
            // Parsear JSON con Gson
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(jsonResponse, JsonObject.class);
            
            // Verificar si el campo "success" existe y es true
            if (jsonObject.has("success") && jsonObject.get("success").getAsBoolean()) {
                
                // Verificar si existe el array de citas
                if (jsonObject.has("citas") && jsonObject.get("citas").isJsonArray()) {
                    JsonArray citasArray = jsonObject.getAsJsonArray("citas");
                    
                    System.out.println("📋 Procesando " + citasArray.size() + " citas...");
                    
                    for (JsonElement element : citasArray) {
                        JsonObject citaJson = element.getAsJsonObject();
                        
                        Map<String, String> cita = new HashMap<>();
                        
                        // Extraer campos con manejo seguro de nulos
                        cita.put("dni", getStringValue(citaJson, "dniPaciente"));
                        cita.put("fecha", getStringValue(citaJson, "fechaCitaFormateada"));
                        cita.put("hora", getStringValue(citaJson, "horaCitaFormateada"));
                        cita.put("motivo", getStringValue(citaJson, "motivoCita"));
                        
                        // ⚠️ IMPORTANTE: Mapear el estado correctamente
                        String estadoOriginal = getStringValue(citaJson, "estadoCita");
                        cita.put("estado", mapearEstado(estadoOriginal));
                        
                        citasList.add(cita);
                        
                        // Debug de cada cita
                        System.out.println("   ✔️ Cita agregada - Fecha: " + cita.get("fecha") + 
                                         ", Estado: " + cita.get("estado"));
                    }
                    
                    System.out.println("✅ Se procesaron " + citasList.size() + " citas correctamente");
                } else {
                    System.out.println("⚠️ No se encontró el array 'citas' en la respuesta");
                }
            } else {
                System.out.println("❌ La respuesta no contiene success=true");
                throw new IOException("La API no retornó success=true");
            }
        } else {
            // Leer mensaje de error si existe
            BufferedReader errorReader = new BufferedReader(
                new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            StringBuilder errorBody = new StringBuilder();
            String line;
            while ((line = errorReader.readLine()) != null) {
                errorBody.append(line);
            }
            errorReader.close();
            
            System.err.println("❌ Error HTTP " + responseCode + ": " + errorBody.toString());
            throw new IOException("Error en la API: HTTP " + responseCode);
        }
        
        conn.disconnect();
        return citasList;
    }
    
    /**
     * Método auxiliar para extraer valores String de manera segura
     */
    private String getStringValue(JsonObject json, String key) {
        if (json.has(key) && !json.get(key).isJsonNull()) {
            JsonElement element = json.get(key);
            if (element.isJsonPrimitive()) {
                return element.getAsString();
            }
        }
        return "N/A";
    }
    
    /**
     * Mapea los estados del API a los estados esperados por el JSP
     * Tu API retorna: "Desconocido", "Aceptado"
     * Tu JSP espera: "Pendiente", "Confirmada", "Completada", "Cancelada"
     */
    private String mapearEstado(String estadoOriginal) {
        if (estadoOriginal == null || estadoOriginal.trim().isEmpty()) {
            return "Pendiente";
        }
        
        switch (estadoOriginal.toLowerCase()) {
            case "aceptado":
            case "confirmada":
                return "Confirmada";
            case "desconocido":
            case "pendiente":
                return "Pendiente";
            case "completada":
            case "realizada":
                return "Completada";
            case "cancelada":
            case "rechazada":
                return "Cancelada";
            default:
                return "Pendiente";
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}