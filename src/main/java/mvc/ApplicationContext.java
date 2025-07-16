package mvc;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import mvc.Annotations.AuthorizationHandler;
import mvc.App.Application;
import mvc.Exceptions.PageNotFoundException;
import mvc.Helpers.Audit.AuditService;
import mvc.Helpers.Audit.AuditType;
import mvc.Helpers.Audit.LogTarget;
import mvc.Http.HttpBase;

public class ApplicationContext implements Application {

    private static Application application = new ApplicationContext();
    private static final String NOT_FOUND_URL = "/web/Views/Error/notFound.jsp";
    private static final String INTERNAL_ERROR_URL = "/web/Views/Error/internalError.jsp";
    private static String ROOT_PATH = "";

    static {
        String path = ApplicationContext.class.getProtectionDomain().getCodeSource().getLocation().getPath();
        File current = new File(path);

        // Step 2: Move up to the project root by checking for "target" directory
        while (current != null && !new File(current, "pom.xml").exists()) {
            current = current.getParentFile();
        }

        if (current != null) {
            ROOT_PATH = current.getAbsolutePath().replace('\\', '/');
            System.out.println("Root project directory: " + current.getAbsolutePath());
        } else {
            System.out.println("Project root not found.");
        }
    }

    public static Application getInstance() {
        return application;
    }

    @Override
    public void initialize(ServletContextEvent sce) {
        // ✅ This runs when the web app starts
        System.out.println("[Startup] MysticHome is initializing...");

        // Register middlewares
        HttpBase.addMiddleware(new AuthorizationHandler());
        System.out.println("[Startup] Middleware handlers registered");
        try {
            loadEnvironmentVariables();
        } catch (IOException e) {
            System.err.println("[Startup] Error loading environment variables: " +
                    e.getMessage());
        }
    }

    @Override
    public void onError(ServletRequest request, ServletResponse response, FilterChain chain, Throwable t) {
        // log error to file
        AuditService audit = new AuditService();
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String uri = httpRequest.getRequestURI();

        // Skip static resources (css, js, images, video, etc.)
        if (uri.matches(".*\\.(css|js|png|jpg|jpeg|gif|svg|ico|woff2?|ttf|eot|mp4|webm|avif)$") || uri
                .startsWith("/web/path_to_") || uri.startsWith("/web/Content/assets/")) {
            return; // Don't log static files
        }

        audit.setSource(uri);
        audit.setMessage(t.getMessage());
        audit.setType(AuditType.ERROR);
        audit.setTarget(LogTarget.FILE);
        audit.log();

        // Redirect to error page based on the Exception type
        try {
            if (t instanceof PageNotFoundException) {
                httpResponse.sendRedirect(NOT_FOUND_URL);

            } else {
                httpResponse.sendRedirect(INTERNAL_ERROR_URL);
            }
        } catch (IOException e) {
            e.printStackTrace(System.err);
        }

    }

    @Override
    public void onHttpRequest(ServletRequest request, ServletResponse response, FilterChain chain) {
        // Log to Database to replace Watcher
        AuditService audit = new AuditService();
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String uri = httpRequest.getRequestURI();

        // Skip static resources (css, js, images, video, etc.)
        if (uri.matches(".*\\.(css|js|png|jpg|jpeg|gif|svg|ico|woff2?|ttf|eot|mp4|webm|avif)$") || uri
                .startsWith("/web/path_to_") || uri.startsWith("/web/Content/assets/")) {
            return; // Don't log static files
        }

        audit.setSource(uri);
        audit.setMessage("API Request");
        audit.setType(AuditType.INFO);
        audit.setTarget(LogTarget.DATABASE);
        audit.log();
    }

    /*
     * Implementation to execute during server shutdown
     */
    @Override
    public void onDestroy(ServletContextEvent sce) {
        System.out.println("[Shutdown] MysticHome shutdown completed");
    }

    private void loadEnvironmentVariables() throws IOException {
        System.out.println("[Startup] Loading environment variables...");

        // load environment variables thats located in the .env file
        String filePath = ROOT_PATH + "/.env";
        File envFile = new File(filePath);

        // Check if file exists
        if (!envFile.exists()) {
            throw new IOException("The .env file does not exist at the specified location: " + filePath);
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(envFile))) {
            String line;
            // Read each line of the file
            while ((line = reader.readLine()) != null) {
                line = line.trim();

                // Skip empty lines and comments
                if (line.isEmpty() || line.startsWith("#")) {
                    continue;
                }

                // Split the line by '=' to get key-value pairs
                String[] keyValue = line.split("=", 2);
                if (keyValue.length == 2) {
                    String key = keyValue[0].trim();
                    String value = keyValue[1].trim();

                    // Set the property in the system
                    System.setProperty(key, value);
                    System.out.println("Loaded property: " + key + "=" + value);
                } else {
                    System.out.println("Invalid line in .env file: " + line);
                }
            }
        }
    }

    public static String ROOT_PATH() {
        return ROOT_PATH;
    }
}
