<%-- 
    Document   : LogIn
    Created on : 24 nov. 2025, 6:49:15 p. m.
    Author     : EQUIPO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión - Hospital San Jose</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            }
            .form-container {
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                border-radius: 15px;
            }
            .btn-primary {
                background: linear-gradient(45deg, #4facfe, #00f2fe);
                border: none;
                transition: all 0.3s;
            }
            .btn-primary:hover {
                box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
            }
        </style>
    </head>
    <body class="text-gray-800">

        <!-- Navbar simple -->
        <nav class="sticky top-0 z-50 shadow-md bg-white">
            <div class="container mx-auto px-4 py-4">
                <a href="<%=request.getContextPath()%>/Vista/PaginaPrincipal.jsp" class="text-2xl font-bold text-blue-600">
                    Hospital San Jose
                </a>
            </div>
        </nav>

        <!-- Login Form Section -->
        <section id="login" class="py-16 min-h-screen flex items-center">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-8 text-blue-600">Inicio de Sesión</h2>

                <div class="form-container max-w-md mx-auto bg-white p-8">
                    <form id="loginForm" action="<%=request.getContextPath()%>/ServeletLogIn" method="POST">
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700">Correo Electrónico o DNI</label>
                            <input type="text" name="username" id="username" 
                                   class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" 
                                   required placeholder="Ingresa tu email o DNI"
                                   autocomplete="username">
                        </div>

                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700">Contraseña</label>
                            <input type="password" name="password" id="password" 
                                   class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" 
                                   required placeholder="Ingresa tu contraseña"
                                   autocomplete="current-password">
                        </div>

                        <button type="submit" class="btn-primary text-white px-8 py-3 rounded-full w-full text-lg font-semibold">
                            Iniciar Sesión
                        </button>

                        <div class="mt-4 text-center">
                            <a href="<%=request.getContextPath()%>/Vista/Registro.jsp" class="text-blue-600 hover:underline">
                                ¿No tienes cuenta? Regístrate aquí
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="py-8 bg-gray-800 text-white">
            <div class="container mx-auto px-4 text-center">
                <p>© 2025 Hospital San Jose. Todos los derechos reservados.</p>
            </div>
        </footer>

        <%-- Mostrar mensajes --%>
        <%
            String mensaje = (String) session.getAttribute("mensajeLogin");
            if (mensaje != null) { 
        %>
            <script>
                window.onload = function() {
                    alert('<%= mensaje %>');
                };
            </script>
        <%
                session.removeAttribute("mensajeLogin");
            }
        %>
    </body>
</html>