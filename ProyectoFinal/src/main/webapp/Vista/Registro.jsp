<%-- 
    Document   : Registro
    Created on : 24 nov. 2025, 7:48:23 p. m.
    Author     : EQUIPO
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose - Registro de Usuario</title>
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
            .fade-in {
                animation: fadeIn 1s ease forwards;
            }
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }
            .navbar {
                backdrop-filter: blur(10px);
                background: rgba(255,255,255,0.9);
            }
            footer {
                background: #2d3748;
                color: white;
            }
            .form-container {
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                border-radius: 15px;
                transition: transform 0.2s;
            }
            .form-container:hover {
                transform: translateY(-5px);
            }
            .btn-primary {
                background: linear-gradient(45deg, #4facfe, #00f2fe);
                border: none;
                transition: all 0.3s;
            }
            .btn-primary:hover {
                box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
            }
            /* Estilos adicionales para el menú desplegable de usuario */
            .user-menu {
                transition: opacity 0.3s ease, transform 0.3s ease;
            }
            .user-menu.hidden {
                opacity: 0;
                transform: translateY(-10px);
            }
        </style>
    </head>
    <body class="text-gray-800">
        <!-- Navigation -->
        <nav class="navbar sticky top-0 z-50 shadow-md">
            <div class="container mx-auto px-4 py-4 flex justify-between items-center">
                <a href="PaginaPrincipal.jsp" class="text-2xl font-bold text-blue-600">Hospital San Jose</a>
                <ul class="hidden md:flex space-x-6">
                    <li><a href="PaginaPrincipal.jsp" class="hover:text-blue-600">Inicio</a></li>
                    <li><a href="LibroReclamos.jsp" class="hover:text-blue-600">Libro de Reclamos</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="hover:text-blue-600">Preguntas Frecuentes</a></li>
                </ul>
                <!-- Botón para menú de usuario en escritorio -->
                <div class="relative hidden md:block">
                    <button id="user-menu-btn" class="focus:outline-none text-blue-600 hover:text-blue-800">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg>
                    </button>
                    <!-- Menú desplegable de opciones de usuario -->
                    <div id="user-menu" class="user-menu hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg z-10">
                        <ul class="py-1">
                            <li><a href="Perfil.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Perfil</a></li>
                            <li><a href="Configuracion.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Configuración</a></li>
                            <li><a href="Logout.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">Cerrar Sesión</a></li>
                        </ul>
                    </div>
                </div>
                <button id="mobile-menu-btn" class="md:hidden focus:outline-none">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>
            <div id="mobile-menu" class="hidden md:hidden bg-white py-2">
                <ul class="space-y-2 px-4">
                    <li><a href="PaginaPrincipal.jsp" class="block hover:text-blue-600">Inicio</a></li>
                    <li><a href="LibroReclamos.jsp" class="block hover:text-blue-600">Libro de Reclamos</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="block hover:text-blue-600">Preguntas Frecuentes</a></li>
                    <!-- Sección de opciones de usuario en menú móvil -->
                    <li class="border-t pt-2">
                        <span class="block font-semibold text-gray-700">Opciones de Usuario</span>
                        <ul class="ml-4 space-y-1 mt-1">
                            <li><a href="Perfil.jsp" class="block hover:text-blue-600">Perfil</a></li>
                            <li><a href="Configuracion.jsp" class="block hover:text-blue-600">Configuración</a></li>
                            <li><a href="Logout.jsp" class="block hover:text-blue-600">Cerrar Sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4 fade-in">Regístrate en Hospital San Jose</h1>
                <p class="text-xl mb-8 fade-in">Crea tu cuenta para acceder a servicios médicos personalizados.</p>
            </div>
        </section>

        <!-- Registration Form Section -->
        <section id="register" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-8 text-blue-600">Formulario de Registro</h2>
                <div class="form-container max-w-2xl mx-auto bg-white p-8">
                    <form id="registerForm" action="<%=request.getContextPath()%>/ServeletRegistroPaciente" method="POST">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-700">DNI</label>
                                <input type="number" name="dniPaciente" id="dni" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required placeholder="Ej: 12345678">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nombre Completo</label>
                                <input type="text" name="nombreCompleto" id="fullname" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Fecha de Nacimiento</label>
                                <input type="date" name="fechaNacimiento" id="fechanacimiento" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Género</label>
                                <select name="genero" id="genero" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                                    <option value="">Selecciona tu género</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                    <option value="Otro">Otro</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Número de Teléfono</label>
                                <input type="tel" name="telefonoPaciente" id="telefono" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Correo Electrónico</label>
                                <input type="email" name="mailPaciente" id="mail" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Contraseña</label>
                                <input type="password" name="password" id="password" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Domicilio</label>
                                <input type="text" name="ubicacion" id="domicilio" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                        </div>
                        <div class="mt-6">
                            <label class="block text-sm font-medium text-gray-700">Condiciones Médicas (Opcional)</label>
                            <textarea name="condicionmedica" id="condicionmedica" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" rows="3" placeholder="Describe si sufres de alguna condición médica"></textarea>
                        </div>
                        <button type="submit" class="btn-primary text-white px-8 py-3 rounded-full mt-8 w-full text-lg font-semibold">Registrarse</button>
                        <div class="mt-4 text-center">
                            <a href="Login.jsp" class="text-blue-600 hover:underline">¿Ya tienes cuenta? Inicia sesión aquí</a>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="py-8">
            <div class="container mx-auto px-4 text-center">
                <p>© 2025 Hospital San Jose. Todos los derechos reservados.</p>
                <div class="mt-4 space-x-4">
                    <a href="LibroReclamos.jsp" class="hover:underline">Libro de Reclamos</a>
                    <a href="PaginaPrincipal.jsp" class="hover:underline">Página Principal</a>
                </div>
            </div>
        </footer>

        <%
            String mensaje = (String) session.getAttribute("mensajeRegistro");
            if (mensaje != null) { %>
            <script>
                window.onload = function() {
                    alert('<%= mensaje %>');
                };
            </script>
            <%
                session.removeAttribute("mensajeRegistro");
            }
        %>

        <script>
            // Toggle para el menú móvil
            const mobileBtn = document.getElementById('mobile-menu-btn');
            const mobileMenu = document.getElementById('mobile-menu');
            mobileBtn.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });

            // Toggle para el menú de usuario en escritorio
            const userMenuBtn = document.getElementById('user-menu-btn');
            const userMenu = document.getElementById('user-menu');
            userMenuBtn.addEventListener('click', () => {
                userMenu.classList.toggle('hidden');
            });

            // Smooth scrolling (si hay enlaces internos)
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });

            // Validación para DNI (máximo 8 dígitos)
            const dniInput = document.getElementById('dni');
            dniInput.addEventListener('input', function() {
                let valor = this.value;
                const maxLength = 8;
                if (valor.length > maxLength) {
                    this.value = valor.slice(0, maxLength);
                }
            });
            dniInput.addEventListener('wheel', function(event) {
                event.preventDefault();
            });
        </script>
    </body>
</html>
