<%@ include file="../Shared/Header.jsp" %>

<!-- Hero Section -->
<section class="bg-primary text-white py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">Welcome to Servlet MVC Template</h1>
                <p class="lead mb-4">A powerful Java Servlet MVC framework template for building scalable web applications with modern features.</p>
                <div class="d-flex gap-3">
                    <a href="<%= request.getContextPath() %>/about" class="btn btn-light btn-lg">
                        <i class="bi bi-info-circle me-2"></i>Learn More
                    </a>
                    <a href="<%= request.getContextPath() %>/contact" class="btn btn-outline-light btn-lg">
                        <i class="bi bi-envelope me-2"></i>Get Started
                    </a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="text-center">
                    <i class="bi bi-code-square display-1 text-light"></i>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5">
    <div class="container">
        <div class="row text-center mb-5">
            <div class="col-lg-8 mx-auto">
                <h2 class="display-5 fw-bold mb-3">Why Choose This Template?</h2>
                <p class="lead text-muted">Modern features and best practices for enterprise-grade applications.</p>
            </div>
        </div>
        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="text-center">
                    <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width: 80px; height: 80px;">
                        <i class="bi bi-lightning fs-1"></i>
                    </div>
                    <h4>Fast Development</h4>
                    <p class="text-muted">Rapid application development with pre-built components and utilities.</p>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="text-center">
                    <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width: 80px; height: 80px;">
                        <i class="bi bi-shield-check fs-1"></i>
                    </div>
                    <h4>Secure & Scalable</h4>
                    <p class="text-muted">Built-in security features and middleware support for enterprise applications.</p>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="text-center">
                    <div class="bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                         style="width: 80px; height: 80px;">
                        <i class="bi bi-gear fs-1"></i>
                    </div>
                    <h4>Highly Configurable</h4>
                    <p class="text-muted">Flexible configuration options and easy customization for any project needs.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="bg-light py-5">
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-8 mx-auto">
                <h2 class="mb-4">Ready to Start Building?</h2>
                <p class="lead mb-4">Get started with this template and build your next web application.</p>
                <div class="d-flex gap-3 justify-content-center">
                    <a href="<%= request.getContextPath() %>/login" class="btn btn-primary btn-lg">
                        <i class="bi bi-box-arrow-in-right me-2"></i>Login
                    </a>
                    <a href="<%= request.getContextPath() %>/register" class="btn btn-outline-primary btn-lg">
                        <i class="bi bi-person-plus me-2"></i>Register
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../Shared/Footer.jsp" %>