package mvc;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbConnector {
    private static final String PORT = System.getenv("MYSQL_PORT") != null ? System.getenv("MYSQL_PORT") : "3306";
    private static final String HOST = System.getenv("MYSQL_CONTAINER_NAME") != null
            ? System.getenv("MYSQL_CONTAINER_NAME")
            : "localhost";
    private static final String DB_NAME = System.getenv("MYSQL_DATABASE") != null ? System.getenv("MYSQL_DATABASE")
            : "mystichome";
    private static final String USER = System.getenv("MYSQL_ROOT_USER") != null ? System.getenv("MYSQL_ROOT_USER")
            : "root";
    private static final String PASSWORD = System.getenv("MYSQL_ROOT_PASSWORD") != null
            ? System.getenv("MYSQL_ROOT_PASSWORD")
            : "password";

    private Connection conn;

    // Static instance for singleton pattern
    private static DbConnector instance;

    // Private constructor for singleton
    private DbConnector() {
    }

    // Get singleton instance
    public static DbConnector getInstance() {
        if (instance == null) {
            synchronized (DbConnector.class) {
                if (instance == null) {
                    instance = new DbConnector();
                }
            }
        }
        return instance;
    }

    public boolean isConnected() {
        try {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            System.err.println("Error checking connection status: " + e.getMessage());
            return false;
        }
    }

    public void connect() {
        try {
            if (conn != null && !conn.isClosed()) {
                return; // Already connected
            }

            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB_NAME +
                    "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

            this.conn = DriverManager.getConnection(url, USER, PASSWORD);

            if (conn != null) {
                System.out.println("Connected to the database successfully!");
                System.out.println("Database URL: " + url);
            }
        } catch (SQLException e) {
            System.err.println("Connection failed: " + e.getMessage());
            throw new RuntimeException("Database connection failed", e);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found: " + e.getMessage());
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    public void disconnect() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Database connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Failed to close connection: " + e.getMessage());
        }
    }

    // Get the connection object
    public Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                connect();
            }
        } catch (SQLException e) {
            System.err.println("Error getting connection: " + e.getMessage());
        }
        return conn;
    }

    // Execute SELECT query and return results as List of Maps
    public List<Map<String, Object>> executeQuery(String sql, Object... params) {
        List<Map<String, Object>> results = new ArrayList<>();

        try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
            // Set parameters
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                ResultSetMetaData metaData = rs.getMetaData();
                int columnCount = metaData.getColumnCount();

                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    for (int i = 1; i <= columnCount; i++) {
                        String columnName = metaData.getColumnName(i);
                        Object value = rs.getObject(i);
                        row.put(columnName, value);
                    }
                    results.add(row);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error executing query: " + e.getMessage());
            throw new RuntimeException("Query execution failed", e);
        }

        return results;
    }

    // Execute INSERT, UPDATE, DELETE queries
    public int executeUpdate(String sql, Object... params) {
        try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
            // Set parameters
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }

            return stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error executing update: " + e.getMessage());
            throw new RuntimeException("Update execution failed", e);
        }
    }

    // Execute INSERT and return generated key
    public long executeInsert(String sql, Object... params) {
        try (PreparedStatement stmt = getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            // Set parameters
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getLong(1);
                    }
                }
            }

            return -1;
        } catch (SQLException e) {
            System.err.println("Error executing insert: " + e.getMessage());
            throw new RuntimeException("Insert execution failed", e);
        }
    }

    // Execute batch updates
    public int[] executeBatch(String sql, List<Object[]> paramsList) {
        try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
            for (Object[] params : paramsList) {
                for (int i = 0; i < params.length; i++) {
                    stmt.setObject(i + 1, params[i]);
                }
                stmt.addBatch();
            }

            return stmt.executeBatch();
        } catch (SQLException e) {
            System.err.println("Error executing batch: " + e.getMessage());
            throw new RuntimeException("Batch execution failed", e);
        }
    }

    // Begin transaction
    public void beginTransaction() {
        try {
            getConnection().setAutoCommit(false);
        } catch (SQLException e) {
            System.err.println("Error beginning transaction: " + e.getMessage());
            throw new RuntimeException("Failed to begin transaction", e);
        }
    }

    // Commit transaction
    public void commitTransaction() {
        try {
            getConnection().commit();
            getConnection().setAutoCommit(true);
        } catch (SQLException e) {
            System.err.println("Error committing transaction: " + e.getMessage());
            throw new RuntimeException("Failed to commit transaction", e);
        }
    }

    // Rollback transaction
    public void rollbackTransaction() {
        try {
            getConnection().rollback();
            getConnection().setAutoCommit(true);
        } catch (SQLException e) {
            System.err.println("Error rolling back transaction: " + e.getMessage());
            throw new RuntimeException("Failed to rollback transaction", e);
        }
    }

    // Test connection
    public boolean testConnection() {
        try {
            connect();
            return isConnected();
        } catch (Exception e) {
            System.err.println("Connection test failed: " + e.getMessage());
            return false;
        }
    }
}
