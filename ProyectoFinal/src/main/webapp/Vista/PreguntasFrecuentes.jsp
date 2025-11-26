<%-- 
    Document   : PreguntasFrecuentes
    Created on : 6 set. 2025, 12:49:00 p. m.
    Author     : EQUIPO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose - Preguntas Frecuentes</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            }
            .hero-bg {
                background: linear-gradient(45deg, rgba(0,123,255,0.8) 0%, rgba(40,167,69,0.8) 100%), url('https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/2eb413e2-0eb1-4e41-8edd-0d74777b7c8f.png');
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
            .faq-item {
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .faq-item:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 15px rgba(0,0,0,0.1);
            }
            .category-card {
                transition: background-color 0.3s;
            }
            .category-card:hover {
                background-color: #e8f4f8;
            }
            footer {
                background: #2d3748;
                color: white;
            }
            .accordion {
                display: none;
                transition: display 0.3s ease;
            }
        </style>
    </head>
    <body class="text-gray-800">
        <%-- Incluir navbar adaptativa --%>
        <%@include file="NavBar.jsp" %>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4 fade-in">Preguntas Frecuentes</h1>
                <p class="text-xl mb-8 fade-in">Encuentra respuestas a las preguntas más comunes sobre nuestros servicios y procedimientos.</p>
            </div>
        </section>

        <!-- Categories Section -->
        <section id="categories" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-12 text-blue-600">Categorías de Preguntas</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <div class="category-card bg-white p-6 rounded-lg shadow-md text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/ce1319e3-fa65-47c2-9fa9-5f6752ebcc8d.png" alt="Icono de calendario para reservas de citas médicas con fechas y horas" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Citas Médicas</h3>
                        <p class="text-gray-700 mb-4">Todo sobre cómo reservar, cambiar o cancelar citas.</p>
                        <button onclick="toggleAccordion('appointments')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full">Ver Preguntas</button>
                    </div>
                    <div class="category-card bg-white p-6 rounded-lg shadow-md text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/e195df84-571a-45ed-a477-cbeee598af91.png" alt="Cruz médica para servicios hospitalarios incluyendo diagnósticos y tratamientos" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Servicios y Especialidades</h3>
                        <p class="text-gray-700 mb-4">Información sobre nuestros servicios médicos y especialistas.</p>
                        <button onclick="toggleAccordion('services')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full">Ver Preguntas</button>
                    </div>
                    <div class="category-card bg-white p-6 rounded-lg shadow-md text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/9723210e-d25f-46d6-a0d0-12fb2567113d.png" alt="Reloj para horarios de atención del hospital de lunes a domingo" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Horarios y Ubicación</h3>
                        <p class="text-gray-700 mb-4">Detalles sobre nuestros horarios y cómo llegar.</p>
                        <button onclick="toggleAccordion('hours')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full">Ver Preguntas</button>
                    </div>
                    <div class="category-card bg-white p-6 rounded-lg shadow-md text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/464b79ba-e742-4658-9908-772697e17715.png" alt="Escudo para políticas y procedimientos del hospital incluyendo seguros y confidencialidad" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Políticas y Pagos</h3>
                        <p class="text-gray-700 mb-4">Información sobre seguros, pagos y otras políticas.</p>
                        <button onclick="toggleAccordion('policies')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full">Ver Preguntas</button>
                    </div>
                    <div class="category-card bg-white p-6 rounded-lg shadow-md text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/4bf8565b-279f-4cb0-a327-d4592fe9941b.png" alt="Burbuja de chat para retroalimentación comentarios y reclamos al hospital" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Reclamos y Sugerencias</h3>
                        <p class="text-gray-700 mb-4">Cómo enviar reclamos, sugerencias y comentarios.</p>
                        <button onclick="toggleAccordion('feedback')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full">Ver Preguntas</button>
                    </div>
                    <div class="category-card bg-white p-6 rounded-lg shadow-md text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/5c6da57c-4c57-4e1f-a992-1a80548f3fee.png" alt="Icono de teléfono para información de contacto del hospital con números y correos" class="w-16 h-16 mx-auto mb-4 rounded-full">
                        <h3 class="text-xl font-semibold mb-2">Contacto y Emergencias</h3>
                        <p class="text-gray-700 mb-4">Cómo contactarnos y qué hacer en emergencias.</p>
                        <button onclick="toggleAccordion('contact')" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-full">Ver Preguntas</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Accordion Sections -->
        <div id="faqs" class="py-16 bg-gray-100">
            <div class="container mx-auto px-4">
                <!-- Appointments -->
                <div id="appointments" class="accordion mb-8 max-w-4xl mx-auto">
                    <h3 class="text-2xl font-semibold mb-6 text-blue-600">Citas Médicas</h3>
                    <div class="space-y-4">
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Cómo puedo reservar una cita?</h4>
                            <p class="text-gray-700">Puedes reservar una cita a través de nuestro sitio web, llamando a recepción o visitándonos en persona.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Qué documentos necesito llevar?</h4>
                            <p class="text-gray-700">Por favor, trae una identificación válida, tu historial médico relevante y detalles de seguro si aplica.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Puedo cambiar o cancelar mi cita?</h4>
                            <p class="text-gray-700">Sí, avísanos al menos 24 horas antes. Puedes hacerlo por teléfono o en línea.</p>
                        </div>
                    </div>
                </div>
                <!-- Services -->
                <div id="services" class="accordion mb-8 max-w-4xl mx-auto">
                    <h3 class="text-2xl font-semibold mb-6 text-blue-600">Servicios y Especialidades</h3>
                    <div class="space-y-4">
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Qué especialidades ofrecen?</h4>
                            <p class="text-gray-700">Ofrecemos medicina general, cardiología, pediatría, oncología, dermatología y más.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Tienen servicios de emergencia?</h4>
                            <p class="text-gray-700">Sí, atendemos emergencias 24/7 para casos críticos.</p>
                        </div>
                    </div>
                </div>
                <!-- Hours -->
                <div id="hours" class="accordion mb-8 max-w-4xl mx-auto">
                    <h3 class="text-2xl font-semibold mb-6 text-blue-600">Horarios y Ubicación</h3>
                    <div class="space-y-4">
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Cuáles son sus horarios de atención?</h4>
                            <p class="text-gray-700">De lunes a viernes de 8:00 AM a 6:00 PM, sábados 9:00 AM a 2:00 PM.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Dónde están ubicados?</h4>
                            <p class="text-gray-700">En Calle Hospitalaria 123, Ciudad Médica, País.</p>
                        </div>
                    </div>
                </div>
                <!-- Policies -->
                <div id="policies" class="accordion mb-8 max-w-4xl mx-auto">
                    <h3 class="text-2xl font-semibold mb-6 text-blue-600">Políticas y Pagos</h3>
                    <div class="space-y-4">
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Aceptan seguros médicos?</h4>
                            <p class="text-gray-700">Aceptamos varios planes de seguro; verifica con nosotros tu cobertura específica.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Cuáles son sus políticas de privacidad?</h4>
                            <p class="text-gray-700">Cumplimos con HIPPA; tu información médica está protegida y confidencial.</p>
                        </div>
                    </div>
                </div>
                <!-- Feedback -->
                <div id="feedback" class="accordion mb-8 max-w-4xl mx-auto">
                    <h3 class="text-2xl font-semibold mb-6 text-blue-600">Reclamos y Sugerencias</h3>
                    <div class="space-y-4">
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Cómo enviar un reclamo?</h4>
                            <p class="text-gray-700">Usa nuestro formulario en línea o contacta a recepción.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Puedo hacer sugerencias?</h4>
                            <p class="text-gray-700">Sí, valoramos tu opinión; envía tus sugerencias a través de nuestro formulario.</p>
                        </div>
                    </div>
                </div>
                <!-- Contact -->
                <div id="contact" class="accordion mb-8 max-w-4xl mx-auto">
                    <h3 class="text-2xl font-semibold mb-6 text-blue-600">Contacto y Emergencias</h3>
                    <div class="space-y-4">
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Cómo contactar al hospital?</h4>
                            <p class="text-gray-700">Llámanos al +123 456 7890 o envía correo a info@hospital.com.</p>
                        </div>
                        <div class="faq-item bg-white p-4 rounded-lg shadow-sm">
                            <h4 class="font-semibold cursor-pointer mb-2">¿Qué hago en una emergencia?</h4>
                            <p class="text-gray-700">Ve directo a emergencias; estamos equipados para casos críticos 24/7.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact CTA Section -->
        <section id="contact" class="py-16 bg-blue-600 text-white">
            <div class="container mx-auto px-4 text-center">
                <h2 class="text-3xl font-semibold mb-4">¿No encuentras la respuesta que buscas?</h2>
                <p class="mb-8 text-lg">Contáctanos directamente para más ayuda.</p>
                <form id="contactForm" class="max-w-lg mx-auto bg-white p-6 rounded-lg text-gray-800">
                    <div class="mb-4">
                        <label class="block font-semibold">Nombre</label>
                        <input type="text" id="contactName" class="w-full p-2 border rounded" required>
                    </div>
                    <div class="mb-4">
                        <label class="block font-semibold">Correo</label>
                        <input type="email" id="contactEmail" class="w-full p-2 border rounded" required>
                    </div>
                    <div class="mb-4">
                        <label class="block font-semibold">Mensaje</label>
                        <textarea id="contactMessage" rows="4" class="w-full p-2 border rounded" required></textarea>
                    </div>
                    <button type="submit" class="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700 transition">Enviar Mensaje</button>
                </form>
            </div>
        </section>

        <!-- Footer -->
        <footer class="py-8">
            <div class="container mx-auto px-4 text-center">
                <p>© 2025 Hospital General. Todos los derechos reservados.</p>
                <div class="mt-4 space-x-4">
                    <a href="LibroReclamos.jsp" class="hover:underline">Libro de Reclamos</a>
                    <a href="Citas.jsp" class="hover:underline">Reservar Cita</a>
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

            // Accordion toggle
            function toggleAccordion(id) {
                const element = document.getElementById(id);
                element.style.display = element.style.display === 'block' ? 'none' : 'block';
            }

            // Form submission
            document.getElementById('contactForm').addEventListener('submit', function(e) {
                e.preventDefault();
                alert('¡Mensaje enviado! Gracias por contactarnos.');
            });

            // Fade in animation on scroll
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('fade-in');
                    }
                });
            });
            document.querySelectorAll('.category-card, .faq-item').forEach(card => observer.observe(card));
        </script>
    </body>
</html>

