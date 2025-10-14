<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hospital San Jose - Registro de Paciente</title>
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
            footer {
                background: #2d3748;
                color: white;
            }
        </style>
    </head>
    <body class="text-gray-800">
        <!-- Navigation -->
        <nav class="navbar sticky top-0 z-50 shadow-md">
            <div class="container mx-auto px-4 py-4 flex justify-between items-center">
                <a href="PaginaPrincipal.jsp" class="text-2xl font-bold text-blue-600">Hospital San Jose</a>
                <ul class="hidden md:flex space-x-6">
                    <li><a href="<%= request.getContextPath()%>Vista/PaginaPrincipal.jsp" class="hover:text-blue-600">Inicio</a></li>
                    <li><a href="LibroReclamos.jsp" class="hover:text-blue-600">Libro de Reclamos</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="hover:text-blue-600">Preguntas Frecuentes</a></li>
                    <li><a href="ReservaCitas.jsp" class="hover:text-blue-600">Reservar Cita</a></li>
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
                    <li><a href="LibroReclamos.jsp" class="block hover:text-blue-600">Libro de Reclamos</a></li>
                    <li><a href="PreguntasFrecuentes.jsp" class="block hover:text-blue-600">Preguntas Frecuentes</a></li>
                    <li><a href="ReservaCitas.jsp" class="block hover:text-blue-600">Reservar Cita</a></li>
                </ul>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-bg text-white py-20">
            <div class="container mx-auto px-4 text-center">
                <h1 class="text-5xl font-bold mb-4 fade-in">Registro de Nuevo Paciente</h1>
                <p class="text-xl mb-8 fade-in">Completa tus datos para registrarte y acceder a nuestros servicios de salud.</p>
            </div>
        </section>

        <!-- Registration Form Section -->
        <section id="registration" class="py-16">
            <div class="container mx-auto px-4">
                <h2 class="text-3xl font-semibold text-center mb-8 text-blue-600">Formulario de Registro de Paciente</h2>
                <div class="form-container max-w-3xl mx-auto bg-white p-8">
                    <form id="patientRegistrationForm" action="<%=request.getContextPath()%>/ServeletRegistroPaciente" method="POST">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nombre Completo *</label>
                                <input type="text" name="nombreCompleto" id="fullName" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Número de DNI o ID *</label>
                                <input type="number" name="dniPaciente" id="dni" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Fecha de Nacimiento *</label>
                                <input type="date" name="fechaNacimiento" id="birthDate" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Género *</label>
                                <select id="gender" name="genero" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                                    <option value="">Seleccionar Género</option>
                                    <option value="masculino">Masculino</option>
                                    <option value="femenino">Femenino</option>
                                    <option value="otro">Otro</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Número de Teléfono *</label>
                                <input type="tel" name="telefonoPaciente" id="phone" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Correo Electrónico *</label>
                                <input type="email" name="mailPaciente" id="email" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Contraseña *</label>
                                <input type="password" name="password" id="password" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" required>
                            </div>
                            <div class="md:col-span-2">
                                <label class="block text-sm font-medium text-gray-700">Dirección Completa</label>
                                <textarea id="address" name="ubicacion" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" rows="2" placeholder="Incluye calle, número, distrito y ciudad"></textarea>
                            </div>
                            <div class="md:col-span-2">
                                <label class="block text-sm font-medium text-gray-700">Alergias o Condiciones Médicas Preexistentes (Opcional)</label>
                                <textarea id="medicalHistory" name="historialMedico" class="w-full p-3 border border-gray-300 rounded-lg mt-1 focus:border-blue-500" rows="3" placeholder="Describe cualquier alergia, enfermedad crónica o medicamento actual"></textarea>
                            </div>
                        </div>
                        <div class="mt-6 text-center">
                            <button type="submit" class="btn-primary text-white px-8 py-3 rounded-full mt-8 w-full text-lg font-semibold">Continuar Registro</button>
                        </div>
                    </form>
                    <div class="mt-4 text-sm text-gray-600 text-center">
                        <p>Al registrarte, aceptas nuestros <a href="#" class="text-blue-600 hover:underline">Términos y Condiciones</a> y <a href="#" class="text-blue-600 hover:underline">Política de Privacidad</a>.</p>
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
                    <a href="ReservaCitas.jsp" class="hover:underline">Reservar Cita</a>
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


            /*document.getElementById('patientRegistrationForm').addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Simulate form validation and submission (in a real app, send to server via AJAX or form action)
                const formData = new FormData(this);
                // Here you could add AJAX to save data to backend, e.g., fetch('/registerPatient', {method: 'POST', body: formData})
                
                alert('¡Registro completado exitosamente! Ahora serás redirigido para reservar tu cita.');
                
                // Redirect to the booking page (assuming it's named ReservaCitas.jsp)
                window.location.href = 'ReservaCitas.jsp';
            });

            // Fade in animation on load for hero
            window.addEventListener('load', () => {
                document.querySelector('.hero-bg h1').classList.add('fade-in');
                document.querySelector('.hero-bg p').classList.add('fade-in');
            });*/
            
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