<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%-- Incluir verificación de sesión --%>
<%@include file="verificarSesion.jsp" %>

<%
    // FALLBACK: Si verificarSesion.jsp no definió las variables, 
    // intentar obtenerlas del request (enviadas por el servlet)
    if (dniPaciente == null) {
        dniPaciente = (Integer) request.getAttribute("dniPaciente");
    }
    if (nombrePaciente == null || nombrePaciente.trim().isEmpty()) {
        nombrePaciente = (String) request.getAttribute("nombrePaciente");
    }
    
    // Valores por defecto final
    if (dniPaciente == null) dniPaciente = 0;
    if (nombrePaciente == null || nombrePaciente.trim().isEmpty()) {
        nombrePaciente = "Usuario";
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose - Mis Citas</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            }
            .hero-bg {
                background: linear-gradient(45deg, rgba(0,123,255,0.8) 0%, rgba(40,167,69,0.8) 100%), url('https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/eb3c654a-a7ef-4f0d-b051-3001b5700196.png');
                background-size: cover;
                background-position: center;
            }
            footer {
                background: #2d3748;
                color: white;
            }
            .table-container {
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                border-radius: 15px;
                overflow-x: auto;
            }
            .estado-pendiente {
                background-color: #fef3c7;
                color: #92400e;
                padding: 4px 12px;
                border-radius: 9999px;
                font-weight: 600;
                font-size: 0.875rem;
            }
            .estado-confirmada {
                background-color: #dbeafe;
                color: #1e40af;
                padding: 4px 12px;
                border-radius: 9999px;
                font-weight: 600;
                font-size: 0.875rem;
            }
            .estado-completada {
                background-color: #d1fae5;
                color: #065f46;
                padding: 4px 12px;
                border-radius: 9999px;
                font-weight: 600;
                font-size: 0.875rem;
            }
            .estado-cancelada {
                background-color: #fee2e2;
                color: #991b1b;
                padding: 4px 12px;
                border-radius: 9999px;
                font-weight: 600;
                font-size: 0.875rem;
            }
        </style>
    </head>
    <body class="text-gray-800">
        <%-- Incluir navbar --%>
        <%@include file="NavBar.jsp" %>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4">Mis Citas Médicas</h1>
                <p class="text-xl mb-8">Revisa y gestiona tus citas programadas en Hospital San Jose</p>
                <p class="text-lg">Paciente: <strong><%= nombrePaciente %></strong> | DNI: <strong><%= dniPaciente %></strong></p>
            </div>
        </section>

        <!-- Appointments List Section -->
        <section id="appointments" class="py-16">
            <div class="container mx-auto px-4">
                
                <%-- Mostrar error si existe --%>
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                    <div class="max-w-6xl mx-auto mb-6 bg-red-100 border-l-4 border-red-500 p-4 rounded">
                        <p class="text-red-800"><strong>⚠️ Error:</strong> <%= error %></p>
                    </div>
                <%
                    }
                %>
                
                <h2 class="text-3xl font-semibold text-center mb-8 text-blue-600">Lista de Citas</h2>
                
                <%-- Estadísticas --%>
                <%
                    Integer totalCitas = (Integer) request.getAttribute("totalCitas");
                    if (totalCitas == null) totalCitas = 0;
                %>
                <div class="max-w-6xl mx-auto mb-6 bg-blue-50 border-l-4 border-blue-500 p-4 rounded">
                    <p class="text-blue-800"><strong>📊 Total de citas:</strong> <%= totalCitas %></p>
                </div>
                
                <div class="table-container max-w-6xl mx-auto bg-white">
                    <table class="w-full table-auto min-w-full">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="px-4 py-3 text-left">DNI</th>
                                <th class="px-4 py-3 text-left">Fecha</th>
                                <th class="px-4 py-3 text-left">Hora</th>
                                <th class="px-4 py-3 text-left">Motivo</th>
                                <th class="px-4 py-3 text-center">Estado</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-700">
                            <%
                                List<Map<String, String>> citas = (List<Map<String, String>>) request.getAttribute("citas");
                                if (citas == null || citas.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="5" class="px-4 py-8 text-center">
                                    <div class="text-gray-500">
                                        <svg class="w-16 h-16 mx-auto mb-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                        </svg>
                                        <p class="text-lg font-semibold">No tienes citas programadas</p>
                                        <p class="mt-2">¡Reserva tu primera cita ahora!</p>
                                    </div>
                                </td>
                            </tr>
                            <%
                                } else {
                                    for (Map<String, String> cita : citas) {
                                        String estado = cita.get("estado");
                                        String claseEstado = "estado-pendiente";
                                        
                                        if ("Confirmada".equalsIgnoreCase(estado)) {
                                            claseEstado = "estado-confirmada";
                                        } else if ("Completada".equalsIgnoreCase(estado)) {
                                            claseEstado = "estado-completada";
                                        } else if ("Cancelada".equalsIgnoreCase(estado)) {
                                            claseEstado = "estado-cancelada";
                                        }
                            %>
                            <tr class="border-b hover:bg-gray-50 transition">
                                <td class="px-4 py-3 font-medium"><%= cita.get("dni") %></td>
                                <td class="px-4 py-3"><%= cita.get("fecha") %></td>
                                <td class="px-4 py-3"><%= cita.get("hora") %></td>
                                <td class="px-4 py-3"><%= cita.get("motivo") %></td>
                                <td class="px-4 py-3 text-center">
                                    <span class="<%= claseEstado %>"><%= estado %></span>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                
                <div class="text-center mt-8 flex gap-4 justify-center flex-wrap">
                    <a href="<%=request.getContextPath()%>/Vista/Citas.jsp" 
                       class="bg-blue-600 text-white px-8 py-3 rounded-full text-lg font-semibold inline-block hover:bg-blue-700 transition">
                        📅 Reservar Nueva Cita
                    </a>
                    <button onclick="location.reload()" 
                            class="bg-gray-200 text-gray-700 px-8 py-3 rounded-full text-lg font-semibold inline-block hover:bg-gray-300 transition">
                        🔄 Actualizar
                    </button>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="py-8">
            <div class="container mx-auto px-4 text-center">
                <p>© 2025 Hospital San Jose. Todos los derechos reservados.</p>
                <div class="mt-4 space-x-4">
                    <a href="<%=request.getContextPath()%>/Vista/LibroReclamos.jsp" class="hover:underline">Libro de Reclamos</a>
                    <a href="<%=request.getContextPath()%>/Vista/PaginaPrincipal.jsp" class="hover:underline">Página Principal</a>
                </div>
            </div>
        </footer>
    </body>
</html>