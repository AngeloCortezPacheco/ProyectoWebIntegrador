<%-- 
    Document   : PaginaPrincipal
    Created on : 6 set. 2025, 11:45:51 a. m.
    Author     : EQUIPO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            }
            .hero-bg {
                background: linear-gradient(45deg, rgba(0,123,255,0.8) 0%, rgba(40,167,69,0.8) 100%), url('https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/a03a0a36-d404-4729-a767-cb8ea79c28d6.png');
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
            .service-card {
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .service-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
            .testimonial-card {
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            footer {
                background: #2d3748;
                color: white;
            }
            .maps{
                border-radius: 30px;
            }
            
            .mapsContent{
                align-content: center;
                text-align: center;
                align-items: center;
            }
            
        </style>
    </head>
    <body class="text-gray-800">
        <!-- Navigation -->
        <nav class="navbar sticky top-0 z-50 shadow-md">
            <div class="container mx-auto px-4 py-4 flex justify-between items-center">
                <a href="PaginaPrincipal.jsp" class="text-2xl font-bold text-blue-600">Hospital San Jose</a>
                <ul class="hidden md:flex space-x-6">
                    <li><a href="#about" class="hover:text-blue-600 letras">Acerca de</a></li>
                    <li><a href="#services" class="hover:text-blue-600 letras">Servicios</a></li>
                    <li><a href="Citas.jsp" class="hover:text-blue-600 letras">Reservar Cita</a></li>
                    <li><a href="LibroReclamos.jsp" class="hover:text-blue-600 letras">Libro de Reclamos</a></li>   
                    <li><a href="#contact" class="hover:text-blue-600 letras">Contacto</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="hover:text-blue-600 letras">Preguntas Frecuentes</a></li>
                </ul>
                <button id="mobile-menu-btn" class="md:hidden focus:outline-none">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>
            <div id="mobile-menu" class="hidden md:hidden bg-white py-2">
                <ul class="space-y-2 px-4">
                    <li><a href="#about" class="block hover:text-blue-600">Acerca de</a></li>
                    <li><a href="#services" class="block hover:text-blue-600">Servicios</a></li>
                    <li><a href="Citas.jsp" class="block hover:text-blue-600">Reservar Cita</a></li>
                    <li><a href="LibroReclamos.jsp" class="block hover:text-blue-600">Libro de Reclamos</a></li>
                    <li><a href="#contact" class="block hover:text-blue-600">Contacto</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="block hover:text-blue-600">Preguntas Frecuentes</a></li>
                </ul>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4 fade-in">Bienvenidos al Hospital San Jose</h1>
                <p class="text-xl mb-8 fade-in">Cuidado integral de salud con tecnología de vanguardia y atención personalizada.</p>
                <div class="flex justify-center space-x-4 fade-in">
                    <a href="Citas.jsp" class="bg-green-500 hover:bg-green-600 text-white px-6 py-3 rounded-full font-semibold transition">Reservar Cita</a>
                    <a href="#contact" class="bg-transparent border-2 border-white text-white hover:bg-white hover:text-blue-600 px-6 py-3 rounded-full font-semibold transition">Contáctanos</a>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="about" class="py-16">
            <div class="container mx-auto px-4">
                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 mb-8 md:mb-0">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/658cb41a-c4cd-4b94-b40b-a974b6b61578.png" alt="Profesionales médicos en un pasillo moderno de hospital con equipo de cuidado paciente incluyendo carritos médicos y monitores" class="rounded-lg shadow-lg">
                    </div>
                    <div class="md:w-1/2 md:pl-8">
                        <h2 class="text-3xl font-semibold mb-4 text-blue-600">Acerca de Nosotros</h2>
                        <p class="text-gray-700 mb-4">Aqui en el Hospital San Jose nos dedicamos a proporcionar servicios médicos excepcionales a la comunidad desde 1970. Nuestro equipo de profesionales altamente calificados combina experiencia con tecnología avanzada para ofrecer el mejor cuidado posible.</p>
                        <ul class="list-disc list-inside text-gray-700">
                            <li>Instalaciones modernas y equipadas.</li>
                            <li>Atención 24/7 para emergencias.</li>
                            <li>Especialistas en diversas áreas médicas.</li>
                            <li>Compromiso con la innovación y el bienestar del paciente.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section id="services" class="bg-gray-100 py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-12 text-blue-600">Nuestros Servicios</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="service-card bg-white p-6 rounded-lg text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/60cf7668-4a97-4c59-90a8-152393f0018f.png" alt="Sala de cardiología con monitor de corazón, electrocardiograma y gráficos médicos en equipo hospitalario" class="w-full h-48 object-cover rounded mb-4">
                        <h3 class="text-xl font-semibold mb-2">Cardiología</h3>
                        <p class="text-gray-700">Diagnóstico y tratamiento avanzado de enfermedades cardíacas con equipo de última generación.</p>
                    </div>
                    <div class="service-card bg-white p-6 rounded-lg text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/52303119-6a5f-4996-b545-db9be3def346.png" alt="Sala de espera pediátrica con niño jugando, muñecos coloridos y muebles infantiles alegres" class="w-full h-48 object-cover rounded mb-4">
                        <h3 class="text-xl font-semibold mb-2">Pediatría</h3>
                        <p class="text-gray-700">Cuidado especializado para niños, desde recién nacidos hasta adolescentes, con un enfoque en el bienestar general.</p>
                    </div>
                    <div class="service-card bg-white p-6 rounded-lg text-center">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/8589fa64-4d15-4e66-9be3-c9882fbf1458.png" alt="Equipo de radiología en un laboratorio médico limpio con máquinas de rayos X y tomografías computarizadas" class="w-full h-48 object-cover rounded mb-4">
                        <h3 class="text-xl font-semibold mb-2">Radiología</h3>
                        <p class="text-gray-700">Imágenes diagnósticas precisas utilizando tecnología de vanguardia para una evaluación oportuna.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section id="testimonials" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-12 text-blue-600">Testimonios de Pacientes</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="testimonial-card bg-white p-6 rounded-lg">
                        <p class="text-gray-700 mb-4">"El equipo de Hospital General me salvó la vida durante una emergencia cardíaca. Su rápida respuesta y cuidado profesional fueron excepcionales."</p>
                        <p class="font-semibold">- Ana García</p>
                    </div>
                    <div class="testimonial-card bg-white p-6 rounded-lg">
                        <p class="text-gray-700 mb-4">"La atención pediátrica aquí es increíble. Mis hijos se sienten seguros y bien cuidados en cada visita."</p>
                        <p class="font-semibold">- Carlos López</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="bg-blue-600 text-white py-16">
            <div class="container mx-auto px-4">
                <div class="flex flex-col md:flex-row">
                    <div class="md:w-1/2 mb-8 md:mb-0">
                        <h2 class="text-3xl font-semibold mb-4">Contáctanos</h2>
                        <ul>
                            <li class="mb-2">Dirección: Magnolias 475, Carmen de La Legua - Reynoso 15103, Perú</li>
                            <li class="mb-2">Correo: tramite@hsj.gob.pe</li>
                            <li class="mb-2">Teléfono: (01) 3197830</li>
                            <li class="mb-2">Horarios: 24/7 para emergencias</li>
                        </ul>
                        <div class="mapsContent">
                            <iframe class="maps" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3902.0137598300635!2d-77.09886243968714!3d-12.04257349785787!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105ceab3d93b059%3A0xee2c942e51dfc5e!2sMagnolias%20475%2C%20Carmen%20de%20La%20Legua%20-%20Reynoso%2015103!5e0!3m2!1ses-419!2spe!4v1757378517748!5m2!1ses-419!2spe" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                    <div class="md:w-1/2">
                        <h2 class="text-3xl font-semibold mb-4">Sugerencias</h2>
                        <form id="contactForm" class="bg-white text-gray-800 p-6 rounded-lg">
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
                            <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">Enviar</button>
                        </form>
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
                    <a href="PreguntasFrecuentes.jsp" class="hover:underline">Preguntas Frecuentes</a>
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
            document.querySelectorAll('.service-card, .testimonial-card').forEach(card => observer.observe(card));
        </script>
    </body>
</html>

