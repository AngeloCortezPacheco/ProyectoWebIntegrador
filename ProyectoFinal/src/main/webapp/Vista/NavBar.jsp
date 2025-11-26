

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar si las variables ya existen (desde verificarSesion.jsp)
    HttpSession navSession = request.getSession(false);
    Boolean navUsuarioLogueado = false;
    String navNombreUsuario = "";
    
    if (navSession != null) {
        Object atributo = navSession.getAttribute("usuarioLogueado");
        if (atributo != null) {
            navUsuarioLogueado = (Boolean) atributo;
        }
        
        if (navUsuarioLogueado) {
            navNombreUsuario = (String) navSession.getAttribute("nombrePaciente");
            if (navNombreUsuario == null) navNombreUsuario = "Usuario";
        }
    }
%>

<style>
    .navbar {
        backdrop-filter: blur(10px);
        background: rgba(255,255,255,0.9);
    }
    .user-menu {
        transition: opacity 0.3s ease, transform 0.3s ease;
    }
    .user-menu.hidden {
        opacity: 0;
        transform: translateY(-10px);
        pointer-events: none;
    }
</style>

<nav class="navbar sticky top-0 z-50 shadow-md">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <a href="<%=request.getContextPath()%>/Vista/PaginaPrincipal.jsp" class="text-2xl font-bold text-blue-600">
            Hospital San Jose
        </a>
        
        <ul class="hidden md:flex space-x-6">
            <li><a href="<%=request.getContextPath()%>/Vista/PaginaPrincipal.jsp" class="hover:text-blue-600">Inicio</a></li>
            <li><a href="<%=request.getContextPath()%>/Vista/LibroReclamos.jsp" class="hover:text-blue-600">Libro de Reclamos</a></li>
            <li><a href="<%=request.getContextPath()%>/Vista/PreguntasFrecuentes.jsp" class="hover:text-blue-600">Preguntas Frecuentes</a></li>
        </ul>
        
        <!-- Botón para menú de usuario en escritorio -->
        <div class="relative hidden md:block">
            <% if (navUsuarioLogueado) { %>
                <!-- Usuario LOGUEADO: Mostrar icono con menú desplegable -->
                <button id="user-menu-btn" class="focus:outline-none text-blue-600 hover:text-blue-800 flex items-center space-x-2">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    <span class="text-sm font-medium"><%= navNombreUsuario %></span>
                </button>
                
                <!-- Menú desplegable para usuarios logueados -->
                <div id="user-menu" class="user-menu hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg z-10">
                    <ul class="py-1">
                        <li><a href="<%=request.getContextPath()%>/Vista/Citas.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">📅 Reservar Cita</a></li>
                        <li><a href="<%=request.getContextPath()%>/Vista/VistaCitas.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100">📋 Revisar Citas</a></li>
                        <li><hr class="my-1"></li>
                        <li><a href="<%=request.getContextPath()%>/ServletLogout" class="block px-4 py-2 text-red-600 hover:bg-red-50">🚪 Cerrar Sesión</a></li>
                    </ul>
                </div>
            <% } else { %>
                <!-- Usuario NO LOGUEADO: Mostrar botón de login -->
                <a href="<%=request.getContextPath()%>/Vista/Login.jsp" 
                   class="flex items-center space-x-2 bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path>
                    </svg>
                    <span>Iniciar Sesión</span>
                </a>
            <% } %>
        </div>
        
        <button id="mobile-menu-btn" class="md:hidden focus:outline-none">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
    </div>
    
    <!-- Menú móvil -->
    <div id="mobile-menu" class="hidden md:hidden bg-white py-2">
        <ul class="space-y-2 px-4">
            <li><a href="<%=request.getContextPath()%>/Vista/PaginaPrincipal.jsp" class="block hover:text-blue-600">Inicio</a></li>
            <li><a href="<%=request.getContextPath()%>/Vista/LibroReclamos.jsp" class="block hover:text-blue-600">Libro de Reclamos</a></li>
            <li><a href="<%=request.getContextPath()%>/Vista/PreguntasFrecuentes.jsp" class="block hover:text-blue-600">Preguntas Frecuentes</a></li>
            
            <!-- Sección de opciones de usuario en menú móvil -->
            <li class="border-t pt-2">
                <% if (navUsuarioLogueado) { %>
                    <!-- Usuario LOGUEADO en móvil -->
                    <span class="block font-semibold text-gray-700">Hola, <%= navNombreUsuario %></span>
                    <ul class="ml-4 space-y-1 mt-1">
                        <li><a href="<%=request.getContextPath()%>/Vista/Citas.jsp" class="block hover:text-blue-600">📅 Reservar Cita</a></li>
                        <li><a href="<%=request.getContextPath()%>/Vista/VistaCitas.jsp" class="block hover:text-blue-600">📋 Revisar Citas</a></li>
                        <li><a href="<%=request.getContextPath()%>/ServletLogout" class="block text-red-600 hover:text-red-800">🚪 Cerrar Sesión</a></li>
                    </ul>
                <% } else { %>
                    <!-- Usuario NO LOGUEADO en móvil -->
                    <a href="<%=request.getContextPath()%>/Vista/Login.jsp" 
                       class="block bg-blue-600 text-white px-4 py-2 rounded-lg text-center hover:bg-blue-700 transition">
                        Iniciar Sesión
                    </a>
                <% } %>
            </li>
        </ul>
    </div>
</nav>

<script>
    // Toggle menú móvil
    const mobileBtn = document.getElementById('mobile-menu-btn');
    const mobileMenu = document.getElementById('mobile-menu');
    if (mobileBtn && mobileMenu) {
        mobileBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    }

    // Toggle menú de usuario (solo si existe, es decir, si el usuario está logueado)
    const userMenuBtn = document.getElementById('user-menu-btn');
    const userMenu = document.getElementById('user-menu');
    if (userMenuBtn && userMenu) {
        userMenuBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            userMenu.classList.toggle('hidden');
        });
        
        // Cerrar menú al hacer clic fuera
        document.addEventListener('click', (e) => {
            if (!userMenuBtn.contains(e.target) && !userMenu.contains(e.target)) {
                userMenu.classList.add('hidden');
            }
        });
    }
</script>