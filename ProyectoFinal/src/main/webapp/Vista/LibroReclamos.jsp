<%-- 
    Document   : LibroReclamos
    Created on : 6 set. 2025, 12:21:07 p. m.
    Author     : EQUIPO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="verificarSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose - Libro de Reclamos</title>
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
            .service-card, .faq-card {
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .service-card:hover, .faq-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
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
        </style>
    </head>
    <body class="text-gray-800">
        <!-- Navigation -->
        <nav class="navbar sticky top-0 z-50 shadow-md">
            <div class="container mx-auto px-4 py-4 flex justify-between items-center">
                <a href="PaginaPrincipal.jsp" class="text-2xl font-bold text-blue-600">Hospital San Jose</a>
                <ul class="hidden md:flex space-x-6">
                    <li><a href="PaginaPrincipal.jsp" class="hover:text-blue-600">Inicio</a></li>
                    <li><a href="Citas.jsp" class="hover:text-blue-600">Reservar Cita</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="hover:text-blue-600">Preguntas Frecuentes</a></li>
                </ul>
                <button id="mobile-menu-btn" class="md:hidden focus:outline-none">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>
            <div id="mobile-menu" class="hidden md:hidden bg-white py-2">
                <ul class="space-y-2 px-4">
                    <li><a href="PaginaPrincipal.jsp" class="block hover:text-blue-600">Inicio</a></li>
                    <li><a href="Citas.jsp" class="block hover:text-blue-600">Reservar Cita</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="block hover:text-blue-600">Preguntas Frecuentes</a></li>
                </ul>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4 fade-in">Ayudanos a mejorar</h1>
                <p class="text-xl mb-8 fade-in">Accede a nuestro libro de reclamos y comentenos que le molesta para asi poder mejorar en los servicios que brindamos</p>
            </div>
        </section>

        <!-- Booking Form Section -->
        <section id="booking" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-8 text-blue-600">Libro de Reclamaciones</h2>
                <div class="form-container max-w-3xl mx-auto bg-white p-8">
                    <form id="appointmentForm" action="<%=request.getContextPath()%>/ServeletRegistroLibroReclamos" method="POST">
                        <h3 style="font-size: 20px; margin-bottom: 20px; font-style: solid; font-weight: bold">Identificación del consumidor reclamante</h3>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Nombre Completo</label>
                            <input type="text" name="nombreCompleto" id="fullName" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Domicilio</label>
                            <input type="text" name="Domicilio" id="domicilio" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">DNI/CE</label>
                            <input type="number" name="dniLR" id="id" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Teléfono</label>
                            <input type="tel" name="telefonoLR" id="telefono" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Correo Electrónico</label>
                            <input type="email" name="mailLR" id="correo" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                        </div>
                        <h3 style="font-size: 20px; margin-top: 20px; font-style: solid; font-weight: bold">Detalles del Reclamo</h3>
                        <div class="mt-6">
                            <textarea name="razonReclamo" id="reason" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn-primary text-white px-8 py-3 rounded-full mt-8 w-full text-lg font-semibold">Enviar Reclamo</button>
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

        <script>
            // Mobile menu toggle
            const mobileBtn = document.getElementById('mobile-menu-btn');
            const mobileMenu = document.getElementById('mobile-menu');
            mobileBtn.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });

            // Smooth scrolling
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });

            // Fade in animation on scroll
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('fade-in');
                    }
                });
            });
            document.querySelectorAll('.step-card, .faq-card').forEach(card => observer.observe(card));
        </script>
    </body>
</html>
