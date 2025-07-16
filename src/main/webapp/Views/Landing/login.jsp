<%@ include file="../Shared/Header.jsp" %>

<!-- Login Section -->
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <div class="text-center mb-4">
                            <i class="bi bi-person-circle fs-1 text-primary"></i>
                            <h2 class="mt-2">Login</h2>
                            <p class="text-muted">Sign in to your account</p>
                        </div>
                        
                        <form action="<%= request.getContextPath() %>/Landing/login" method="POST" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-person"></i>
                                    </span>
                                    <input type="text" class="form-control" id="username" name="username" 
                                           placeholder="Enter your username" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password" 
                                           placeholder="Enter your password" required>
                                </div>
                            </div>
                            
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="remember" name="remember">
                                <label class="form-check-label" for="remember">
                                    Remember me
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100 mb-3">
                                <i class="bi bi-box-arrow-in-right me-2"></i>Login
                            </button>
                            
                            <div class="text-center">
                                <a href="<%= request.getContextPath() %>/forgot-password" class="text-decoration-none">
                                    Forgot Password?
                                </a>
                            </div>
                        </form>
                    </div>
                    
                    <div class="card-footer text-center bg-light">
                        <span class="text-muted">Don't have an account? </span>
                        <a href="<%= request.getContextPath() %>/register" class="text-decoration-none">
                            Sign up here
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../Shared/Footer.jsp" %>