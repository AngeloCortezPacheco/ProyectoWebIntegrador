

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="verificarSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose - Reserva de Citas</title>
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
        <%-- Incluir navbar adaptativa --%>
        <%@include file="NavBar.jsp" %>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4 fade-in">Reserva tu Cita Médica Fácilmente</h1>
                <p class="text-xl mb-8 fade-in">Accede a servicios de salud de calidad con agendamientos rápidos y seguros.</p>
            </div>
        </section>

        <!-- Booking Form Section -->
        <section id="booking" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-8 text-blue-600">Formulario de Reserva de Cita</h2>
                <div class="form-container max-w-3xl mx-auto bg-white p-8">
                    <form id="appointmentForm" action="<%=request.getContextPath()%>/ServeletRegistroCitas" method="POST">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nombre Completo</label>
                                <input type="text" name="fullname" id="fullName" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Número de Teléfono</label>
                                <input type="tel" name="telefono" id="phone" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Correo Electrónico</label>
                                <input type="email" name="mail" id="email" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Fecha de Cita</label>
                                <input type="date" name="fechacita" id="date" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Hora de Cita</label>
                                <input type="time" name="horacita" id="time" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">DNI</label>
                                <input type="number" name="dni" id="dni" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required placeholder="Ej: 12345678">
                            </div>
                        </div>
                        <div class="mt-6">
                            <label class="block text-sm font-medium text-gray-700">Motivo de la Cita</label>
                            <textarea id="reason" name="razon" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn-primary text-white px-8 py-3 rounded-full mt-8 w-full text-lg font-semibold">Reservar Cita</button>
                    </form>
                </div>
            </div>
        </section>

        <!-- Steps Section -->
        <section id="steps" class="bg-gray-100 py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-12 text-blue-600">Cómo Reservar tu Cita</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="step-card bg-white p-6 rounded-lg text-center shadow-md">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/9b810e7d-f7c2-4c0c-b54b-9821f37dd49d.png" alt="Formulario de registro de paciente con campos para detalles personales como nombre teléfono y dirección" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Paso 1: Ingresa tus Datos</h3>
                        <p class="text-gray-700">Completa el formulario con tu información personal y motivo de la consulta.</p>
                    </div>
                    <div class="step-card bg-white p-6 rounded-lg text-center shadow-md">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/33f6d4be-8b12-4f8b-8d9d-03c6805e9854.png" alt="Calendario y reloj para seleccionar el tiempo de cita con fechas y horas disponibles" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Paso 2: Elige Fecha y Hora</h3>
                        <p class="text-gray-700">Selecciona la fecha y hora conveniente para tu cita médica.</p>
                    </div>
                    <div class="step-card bg-white p-6 rounded-lg text-center shadow-md">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/3954547c-475b-4098-9233-b889d446317e.png" alt="Correo de confirmación con detalles de la cita incluyendo fecha hora y médico asignado" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Paso 3: Confirma tu Reserva</h3>
                        <p class="text-gray-700">Recibe una confirmación por correo y prepárate para tu visita.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section id="faq" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-12 text-blue-600">Preguntas Frecuentes sobre Citas</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="faq-card bg-white p-6 rounded-lg shadow-md">
                        <h3 class="text-lg font-semibold mb-4">¿Cómo puedo cambiar mi cita?</h3>
                        <p class="text-gray-700">Puedes cambiarla contactándonos por teléfono o correo electrónico al menos 24 horas antes.</p>
                    </div>
                    <div class="faq-card bg-white p-6 rounded-lg shadow-md">
                        <h3 class="text-lg font-semibold mb-4">¿Qué pasa si necesito cancelar?</h3>
                        <p class="text-gray-700">Cancela con anticipación para liberar el horario; hay una política de 24 horas.</p>
                    </div>
                    <div class="faq-card bg-white p-6 rounded-lg shadow-md">
                        <h3 class="text-lg font-semibold mb-4">¿Aceptan walk-ins?</h3>
                        <p class="text-gray-700">Preferimos citas reservadas, pero atendemos emergencias urgentes.</p>
                    </div>
                    <div class="faq-card bg-white p-6 rounded-lg shadow-md">
                        <h3 class="text-lg font-semibold mb-4">¿Necesito preparación previa?</h3>
                        <p class="text-gray-700">Depende del motivo; te lo informaremos en la confirmación.</p>
                    </div>
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
            String mensaje= (String) session.getAttribute("mensajeCita");
            
            if(mensaje!=null){%>
            <script>
                window.onload=function (){
                    alert(<%=mensaje%>);
                }                
            </script>                
            <%
                session.removeAttribute("mensajeCita");
            }
        %>
        
        <script>
            // menu de moviles toggle
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
            
      
        // Seleccionamos el campo de entrada del DNI usando su ID
        const dniInput = document.getElementById('dni');

        // Añadimos un "escuchador" de eventos que se activa cada vez que el usuario teclea
        dniInput.addEventListener('input', function() {
            // Obtenemos el valor actual del campo
            let valor = this.value;

            // Definimos la longitud máxima permitida
            const maxLength = 8;

            // Verificamos si la longitud del valor actual supera el máximo
            if (valor.length > maxLength) {
                // Si es más largo, lo "cortamos" para que solo contenga los primeros 'maxLength' caracteres
                this.value = valor.slice(0, maxLength);
            }
        });

        // Opcional: Evitar que la rueda del mouse cambie el número
        dniInput.addEventListener('wheel', function(event) {
            event.preventDefault();
        });
        
        
        
        </script>
    </body>
</html>
