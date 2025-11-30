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

@WebServlet(name = "ServeletVistaCitas", urlPatterns = {"/ServeletVistaCitas"})
public class ServeletVistaCitas extends HttpServlet {
    
    private static final String MICROSERVICE_URL = "http://localhost:8083/citas/paciente/";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("\n═══════════════════════════════════════════════════");
        System.out.println("🚀 ServeletVistaCitas - INICIO DE EJECUCIÓN");
        System.out.println("═══════════════════════════════════════════════════");
        
        HttpSession session = request.getSession(false);
        
        // Verificar que el usuario esté logueado
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            System.out.println("⚠️ Usuario NO logueado - Redirigiendo a Login");
            session = request.getSession(true);
            session.setAttribute("mensajeLogin", "Debe iniciar sesión para ver sus citas");
            response.sendRedirect(request.getContextPath() + "/Vista/LogIn.jsp");
            return;
        }
        
        // Obtener datos del paciente de la sesión
        Integer dniPaciente = (Integer) session.getAttribute("dniPaciente");
        String nombrePaciente = (String) session.getAttribute("nombrePaciente");
        
        System.out.println("👤 DNI del paciente: " + dniPaciente);
        System.out.println("📝 Nombre del paciente: " + nombrePaciente);
        
        if (dniPaciente == null) {
            System.err.println("❌ ERROR: dniPaciente es NULL");
            session.setAttribute("mensajeLogin", "No se pudo identificar su cuenta");
            response.sendRedirect(request.getContextPath() + "/Vista/LogIn.jsp");
            return;
        }
        
        // Si no hay nombre, usar un valor por defecto
        if (nombrePaciente == null || nombrePaciente.trim().isEmpty()) {
            nombrePaciente = "Usuario";
        }
        
        try {
            System.out.println("\n🔄 Intentando obtener citas del microservicio...");
            
            // Consumir el microservicio
            List<Map<String, String>> citas = obtenerCitasDesdeAPI(dniPaciente);
            
            System.out.println("✅ Total de citas obtenidas: " + citas.size());
            
            // Enviar TODOS los datos al JSP
            request.setAttribute("citas", citas);
            request.setAttribute("totalCitas", citas.size());
            request.setAttribute("dniPaciente", dniPaciente);
            request.setAttribute("nombrePaciente", nombrePaciente);
            
            System.out.println("📤 Datos enviados al JSP:");
            System.out.println("   - citas: " + citas.size() + " elementos");
            System.out.println("   - totalCitas: " + citas.size());
            System.out.println("   - dniPaciente: " + dniPaciente);
            System.out.println("   - nombrePaciente: " + nombrePaciente);
            System.out.println("\n🎯 Haciendo forward a VistaCitas.jsp...");
            
            // Forward al JSP
            request.getRequestDispatcher("/Vista/VistaCitas.jsp").forward(request, response);
            
            System.out.println("✅ Forward completado exitosamente");
            
        } catch (Exception e) {
            System.err.println("\n❌❌❌ ERROR AL OBTENER CITAS ❌❌❌");
            System.err.println("Tipo de error: " + e.getClass().getName());
            System.err.println("Mensaje: " + e.getMessage());
            System.err.println("StackTrace:");
            e.printStackTrace();
            
            request.setAttribute("error", "Error al cargar las citas: " + e.getMessage());
            request.setAttribute("citas", new ArrayList<>());
            request.setAttribute("totalCitas", 0);
            request.setAttribute("dniPaciente", dniPaciente);
            request.setAttribute("nombrePaciente", nombrePaciente);
            
            System.out.println("\n⚠️ Enviando página con error al usuario...");
            request.getRequestDispatcher("/Vista/VistaCitas.jsp").forward(request, response);
        }
        
        System.out.println("═══════════════════════════════════════════════════");
        System.out.println("🏁 ServeletVistaCitas - FIN DE EJECUCIÓN");
        System.out.println("═══════════════════════════════════════════════════\n");
    }
    
    /**
     * Método para consumir el API REST del microservicio
     */
    private List<Map<String, String>> obtenerCitasDesdeAPI(Integer dniPaciente) throws IOException {
        List<Map<String, String>> citasList = new ArrayList<>();
        
        String urlString = MICROSERVICE_URL + dniPaciente;
        
        System.out.println("\n🌐 Configurando conexión HTTP...");
        System.out.println("   URL: " + urlString);
        
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(5000);
        
        System.out.println("📡 Enviando petición GET...");
        
        int responseCode = conn.getResponseCode();
        System.out.println("📥 Response Code: " + responseCode);
        
        if (responseCode == HttpURLConnection.HTTP_OK) {
            System.out.println("✅ Conexión exitosa - Leyendo respuesta...");
            
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuilder responseBody = new StringBuilder();
            
            while ((inputLine = in.readLine()) != null) {
                responseBody.append(inputLine);
            }
            in.close();
            
            String jsonResponse = responseBody.toString();
            System.out.println("📄 Response JSON recibido (" + jsonResponse.length() + " caracteres)");
            System.out.println("📄 Primeros 200 caracteres: " + 
                (jsonResponse.length() > 200 ? jsonResponse.substring(0, 200) + "..." : jsonResponse));
            
            try {
                System.out.println("\n🔧 Parseando JSON con Gson...");
                
                Gson gson = new Gson();
                JsonObject jsonObject = gson.fromJson(jsonResponse, JsonObject.class);
                
                System.out.println("✅ JSON parseado correctamente");
                System.out.println("   - Tiene 'success': " + jsonObject.has("success"));
                System.out.println("   - Valor de 'success': " + (jsonObject.has("success") ? jsonObject.get("success").getAsBoolean() : "N/A"));
                
                if (jsonObject.has("success") && jsonObject.get("success").getAsBoolean()) {
                    
                    if (jsonObject.has("citas") && jsonObject.get("citas").isJsonArray()) {
                        JsonArray citasArray = jsonObject.getAsJsonArray("citas");
                        
                        System.out.println("📋 Array de citas encontrado: " + citasArray.size() + " elementos");
                        
                        for (int i = 0; i < citasArray.size(); i++) {
                            JsonElement element = citasArray.get(i);
                            JsonObject citaJson = element.getAsJsonObject();
                            
                            Map<String, String> cita = new HashMap<>();
                            
                            cita.put("dni", getStringValue(citaJson, "dniPaciente"));
                            cita.put("fecha", getStringValue(citaJson, "fechaCitaFormateada"));
                            cita.put("hora", getStringValue(citaJson, "horaCitaFormateada"));
                            cita.put("motivo", getStringValue(citaJson, "motivoCita"));
                            
                            String estadoOriginal = getStringValue(citaJson, "estadoCita");
                            String estadoMapeado = mapearEstado(estadoOriginal);
                            cita.put("estado", estadoMapeado);
                            
                            citasList.add(cita);
                            
                            System.out.println("   ✔️ Cita #" + (i+1) + ": Fecha=" + cita.get("fecha") + 
                                             ", Hora=" + cita.get("hora") + 
                                             ", Estado=" + estadoMapeado + " (orig: " + estadoOriginal + ")");
                        }
                        
                        System.out.println("✅ Se procesaron " + citasList.size() + " citas correctamente");
                        
                    } else {
                        System.out.println("⚠️ No se encontró el array 'citas' en la respuesta");
                        System.out.println("   Keys disponibles: " + jsonObject.keySet());
                    }
                } else {
                    System.out.println("❌ La respuesta no contiene success=true");
                    throw new IOException("La API no retornó success=true");
                }
                
            } catch (Exception parseException) {
                System.err.println("❌ Error al parsear JSON:");
                parseException.printStackTrace();
                throw new IOException("Error al parsear respuesta del microservicio: " + parseException.getMessage());
            }
            
        } else {
            System.err.println("❌ Error HTTP " + responseCode);
            
            BufferedReader errorReader = new BufferedReader(
                new InputStreamReader(conn.getErrorStream(), "UTF-8"));
            StringBuilder errorBody = new StringBuilder();
            String line;
            while ((line = errorReader.readLine()) != null) {
                errorBody.append(line);
            }
            errorReader.close();
            
            System.err.println("   Error body: " + errorBody.toString());
            throw new IOException("Error en la API: HTTP " + responseCode + " - " + errorBody.toString());
        }
        
        conn.disconnect();
        return citasList;
    }
    
    private String getStringValue(JsonObject json, String key) {
        if (json.has(key) && !json.get(key).isJsonNull()) {
            JsonElement element = json.get(key);
            if (element.isJsonPrimitive()) {
                return element.getAsString();
            }
        }
        return "N/A";
    }
    
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