<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-light py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5 class="mb-3">
                        <i class="bi bi-code-slash me-2"></i>
                        MVC Template
                    </h5>
                    <p class="mb-2">A Java Servlet MVC framework template for rapid application development.</p>
                    <p class="mb-0">
                        <i class="bi bi-github me-2"></i>
                        Open Source Template
                    </p>
                </div>
                <div class="col-md-3">
                    <h6 class="mb-3">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><a href="<%= request.getContextPath() %>/" class="text-light text-decoration-none">Home</a></li>
                        <li><a href="<%= request.getContextPath() %>/about" class="text-light text-decoration-none">About</a></li>
                        <li><a href="<%= request.getContextPath() %>/contact" class="text-light text-decoration-none">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h6 class="mb-3">Resources</h6>
                    <div class="d-flex gap-3">
                        <a href="#" class="text-light fs-4"><i class="bi bi-github"></i></a>
                        <a href="#" class="text-light fs-4"><i class="bi bi-book"></i></a>
                        <a href="#" class="text-light fs-4"><i class="bi bi-question-circle"></i></a>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="mb-0">&copy; 2025 Servlet MVC Template. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <a href="#" class="text-light text-decoration-none me-3">Documentation</a>
                    <a href="#" class="text-light text-decoration-none">License</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
