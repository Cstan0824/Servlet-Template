# Servlet MVC Template

A comprehensive Java Servlet MVC framework template for building scalable web applications with Bootstrap UI, MySQL database integration, and enterprise-grade features.

## 🏗️ Architecture Overview

This template follows a modern MVC (Model-View-Controller) architecture pattern with the following layers:

```
┌─────────────────────────────────────────────────────────────┐
│                    CLIENT (Browser)                         │
└─────────────────────┬───────────────────────────────────────┘
                      │ HTTP Requests/Responses
┌─────────────────────▼───────────────────────────────────────┐
│                 PRESENTATION LAYER                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   JSP Views │  │  Bootstrap  │  │  Static Resources   │  │
│  │   (UI)      │  │   (CSS/JS)  │  │   (Images/CSS)      │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                 CONTROL LAYER                               │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │Controllers  │  │ Middleware  │  │   HTTP Handlers     │  │
│  │   (Logic)   │  │(Security)   │  │   (Routing)         │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                 BUSINESS LAYER                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │  Services   │  │   Models    │  │      DTOs           │  │
│  │ (Business   │  │ (Entities)  │  │ (Data Transfer)     │  │
│  │  Logic)     │  │             │  │                     │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────┬───────────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────────┐
│                 DATA ACCESS LAYER                           │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │     DAO     │  │DbConnector  │  │    Database         │  │
│  │(Data Access)│  │(Connection) │  │   (MySQL)           │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## 📁 Project Structure Explained

```
ServletMVCTemplate/
├── 📁 .mysql/                          # Database initialization scripts
│   └── glassfish_init/                 # GlassFish database setup
├── 📁 src/main/java/                   # Java source code
│   ├── 📁 Controllers/                 # 🎛️ Request handlers (MVC Controllers)
│   │   └── LandingController.java      # Landing page controller
│   ├── 📁 DAO/                        # 🗄️ Data Access Objects
│   │   └── LandingDAO.java            # Database operations
│   ├── 📁 DTO/                        # 📦 Data Transfer Objects
│   │   └── UserCredential.java        # User data transfer
│   ├── 📁 Middleware/                 # 🛡️ Request/Response middleware
│   │   └── AuthMiddleware.java        # Authentication middleware
│   ├── 📁 Models/                     # 📋 Data entities
│   │   └── Landing.java               # Landing model
│   ├── 📁 Services/                   # 🔧 Business logic layer
│   │   └── LandingService.java        # Business operations
│   ├── 📁 Utilities/                  # 🛠️ Helper classes
│   │   └── PasswordHash.java          # Password utilities
│   └── 📁 mvc/                        # 🏗️ MVC Framework core
│       ├── ControllerBase.java        # Base controller class
│       ├── DbConnector.java           # Database connection
│       ├── Result.java                # Response wrapper
│       └── Annotations/               # Custom annotations
├── 📁 src/main/webapp/                # Web application files
│   ├── 📁 Views/                      # 🎨 JSP view templates
│   │   ├── 📁 Shared/                 # Shared components
│   │   │   ├── Header.jsp             # Navigation header
│   │   │   └── Footer.jsp             # Page footer
│   │   ├── 📁 Landing/                # Landing pages
│   │   │   ├── index.jsp              # Home page
│   │   │   └── login.jsp              # Login page
│   │   └── 📁 Error/                  # Error pages
│   │       ├── 404.jsp                # Not found page
│   │       ├── 500.jsp                # Server error page
│   │       └── 401.jsp                # Unauthorized page
│   ├── 📁 Content/                    # 📸 Static assets
│   │   ├── css/                       # Stylesheets
│   │   ├── js/                        # JavaScript files
│   │   └── images/                    # Image assets
│   └── 📁 WEB-INF/                    # 🔒 Web configuration
│       ├── web.xml                    # Servlet configuration
│       └── classes/                   # Compiled classes
├── 📁 database/                       # 🗃️ Database scripts
│   └── schema.sql                     # Database schema
├── 📄 docker-compose.yml              # 🐳 Docker services
├── 📄 .env                           # 🔐 Environment variables
├── 📄 pom.xml                        # 📦 Maven dependencies
└── 📄 README.md                      # 📖 This file
```

## 🚀 Getting Started

### Prerequisites
- **Java 17+** installed
- **Maven 3.6+** installed
- **Docker & Docker Compose** installed
- **VS Code** with Java Extension Pack

### Step 1: Clone and Setup
```bash
# Clone the repository
git clone <your-repo-url>
cd ServletMVCTemplate

# Copy environment file
cp .env.example .env
```

### Step 2: Environment Configuration
Edit your `.env` file:
```env
# Database Configuration
MYSQL_DATABASE=servlet_mvc_template
MYSQL_ROOT_USER=root
MYSQL_ROOT_PASSWORD=root
MYSQL_PORT=3306

# Application Configuration
APP_CONTAINER_NAME=servlet_app
SERVER_CLASS_PATH=/opt/glassfish7/glassfish/domains/domain1/applications/web/WEB-INF/classes
```

### Step 3: Start Services with Docker
```bash
# Start all services (MySQL, phpMyAdmin, Redis, GlassFish)
docker-compose up -d

# View logs
docker-compose logs -f

# Check service status
docker-compose ps
```

## 🌐 Service Access Points

Once your services are running, you can access them at:

| Service | URL | Credentials | Purpose |
|---------|-----|-------------|---------|
| **Web Application** | http://localhost:8080/ServletMVCTemplate | admin/password | Main application |
| **phpMyAdmin** | http://localhost:8081 | root/root | Database management |
| **MySQL Server** | localhost:3306 | root/root | Direct database access |
| **GlassFish Admin** | http://localhost:4848 | admin/admin | Server administration |
| **Redis** | localhost:6379 | - | Cache/Session storage |

### 🔍 Service Details

#### **Web Application** (Port 8080)
- **URL**: `http://localhost:8080/ServletMVCTemplate`
- **Default Login**: username: `admin`, password: `password`
- **Features**: Landing page, authentication, user management

#### **phpMyAdmin** (Port 8081)
- **URL**: `http://localhost:8081`
- **Login**: Username: `root`, Password: `root`
- **Purpose**: Visual database management, query execution, schema design

#### **MySQL Server** (Port 3306)
- **Host**: `localhost`
- **Port**: `3306`
- **Database**: `servlet_mvc_template`
- **Connection String**: `jdbc:mysql://localhost:3306/servlet_mvc_template`

#### **GlassFish Admin Console** (Port 4848)
- **URL**: `http://localhost:4848`
- **Purpose**: Server configuration, application deployment, monitoring

## 💻 Running in VS Code

### Method 1: Using Docker (Recommended)
1. **Open VS Code** in project directory
2. **Install Extensions**:
   - Java Extension Pack
   - Docker Extension
   - Spring Boot Extension Pack

3. **Start Services**:
   ```bash
   # In VS Code terminal
   docker-compose up -d
   ```

4. **Build and Deploy**:
   ```bash
   # Build the project
   mvn clean compile

   # Create WAR file
   mvn clean package

   # Deploy to GlassFish (automatic with docker-compose)
   ```

### Method 2: Local Development
1. **Configure VS Code Launch Configuration**:
   Create `.vscode/launch.json`:
   ```json
   {
     "version": "0.2.0",
     "configurations": [
       {
         "type": "java",
         "name": "Launch Servlet App",
         "request": "launch",
         "mainClass": "mvc.ServletApp",
         "projectName": "ServletMVCTemplate",
         "args": "",
         "vmArgs": "-Dserver.port=8080"
       }
     ]
   }
   ```

2. **Configure Tasks** (`.vscode/tasks.json`):
   ```json
   {
     "version": "2.0.0",
     "tasks": [
       {
         "label": "maven-build",
         "type": "shell",
         "command": "mvn",
         "args": ["clean", "compile"],
         "group": "build"
       },
       {
         "label": "docker-up",
         "type": "shell",
         "command": "docker-compose",
         "args": ["up", "-d"],
         "group": "build"
       }
     ]
   }
   ```

3. **Run the Application**:
   - Press `Ctrl+Shift+P` → "Tasks: Run Task" → "docker-up"
   - Or press `F5` to run in debug mode

### Method 3: Manual Setup
```bash
# Start only database services
docker-compose up -d mysql phpmyadmin redis

# Build the project
mvn clean compile

# Run with embedded server (if configured)
mvn exec:java -Dexec.mainClass="mvc.ServletApp"
```

## 🔧 How the MVC Framework Works

### 1. **Request Flow**
```
Browser → GlassFish → Servlet → Controller → Service → DAO → Database
                                    ↓
Browser ← JSP View ← Controller ← Service ← DAO ← Database
```

### 2. **Controller Example**
```java
@Controller
public class LandingController extends ControllerBase {
    
    @HttpRequest(HttpMethod.GET)
    public Result index() throws Exception {
        // This handles GET /landing/index
        return page(); // Returns Views/Landing/index.jsp
    }
    
    @HttpRequest(HttpMethod.POST)
    public Result login(String username, String password) throws Exception {
        // This handles POST /landing/login
        if (authService.authenticate(username, password)) {
            return redirect("/dashboard");
        }
        return error("Invalid credentials");
    }
}
```

### 3. **Database Operations**
```java
public class LandingDAO {
    private DatabaseService db = new DatabaseService();
    
    public List<Landing> getAllLandings() {
        return db.selectAll("SELECT * FROM landing", Landing.class);
    }
    
    public Landing create(Landing landing) {
        String sql = "INSERT INTO landing (title, content) VALUES (?, ?)";
        Long id = db.insert(sql, landing.getTitle(), landing.getContent());
        landing.setId(id);
        return landing;
    }
}
```

### 4. **View Rendering**
```jsp
<%@ include file="../Shared/Header.jsp" %>

<div class="container mt-4">
    <h1>Welcome to <%= request.getAttribute("title") %></h1>
    
    <% if (session.getAttribute("user") != null) { %>
        <p>Hello, <%= session.getAttribute("username") %>!</p>
    <% } %>
</div>

<%@ include file="../Shared/Footer.jsp" %>
```

## 🗄️ Database Schema

The template includes a complete database schema:

```sql
-- Users and Authentication
CREATE TABLE Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_description VARCHAR(255) NOT NULL
);

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_birthdate DATE,
    user_info JSON,
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- Landing Content
CREATE TABLE Landing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    content TEXT,
    image_url VARCHAR(500),
    active BOOLEAN DEFAULT TRUE,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

## 🛠️ Development Workflow

### Adding a New Feature
1. **Create Model** (`src/main/java/Models/`):
   ```java
   public class Product {
       private Long id;
       private String name;
       private BigDecimal price;
       // getters, setters, constructors
   }
   ```

2. **Create DAO** (`src/main/java/DAO/`):
   ```java
   public class ProductDAO {
       public List<Product> findAll() { /* implementation */ }
       public Product save(Product product) { /* implementation */ }
   }
   ```

3. **Create Service** (`src/main/java/Services/`):
   ```java
   public class ProductService {
       private ProductDAO dao = new ProductDAO();
       
       public List<Product> getAllProducts() {
           return dao.findAll();
       }
   }
   ```

4. **Create Controller** (`src/main/java/Controllers/`):
   ```java
   public class ProductController extends ControllerBase {
       @HttpRequest(HttpMethod.GET)
       public Result index() throws Exception {
           List<Product> products = productService.getAllProducts();
           return page(products);
       }
   }
   ```

5. **Create View** (`src/main/webapp/Views/Product/index.jsp`):
   ```jsp
   <%@ include file="../Shared/Header.jsp" %>
   <!-- Your product listing HTML -->
   <%@ include file="../Shared/Footer.jsp" %>
   ```

### Testing Your Changes
```bash
# Rebuild and redeploy
mvn clean package
docker-compose restart servlet_app

# Or for quick testing
mvn clean compile
# Changes are auto-deployed in development mode
```

## 🐳 Docker Services Explained

### docker-compose.yml Structure
```yaml
services:
  mysql:              # Database server
    image: mysql:8.0
    ports: ["3306:3306"]
    
  phpmyadmin:         # Database management
    image: phpmyadmin/phpmyadmin
    ports: ["8081:80"]
    
  redis:              # Cache/Session storage
    image: redis:7-alpine
    ports: ["6379:6379"]
    
  glassfish:          # Application server
    build: .
    ports: ["8080:8080", "4848:4848"]
    depends_on: [mysql, redis]
```

### Managing Services
```bash
# Start all services
docker-compose up -d

# Start specific service
docker-compose up -d mysql

# View logs
docker-compose logs -f glassfish

# Restart service
docker-compose restart glassfish

# Stop all services
docker-compose down

# Remove volumes (reset database)
docker-compose down -v
```

## 🔒 Security Features

### Authentication Flow
1. User submits login form
2. `AuthMiddleware` validates credentials
3. Password is hashed and compared
4. Session is created with user data
5. Subsequent requests check session

### Security Implementations
- **Password Hashing**: PBKDF2 with SHA-256
- **SQL Injection Prevention**: Parameterized queries
- **XSS Protection**: Input sanitization
- **Session Management**: Secure session handling

## 📊 Monitoring and Logs

### Application Logs
```bash
# View application logs
docker-compose logs -f glassfish

# View database logs
docker-compose logs -f mysql

# View all logs
docker-compose logs -f
```

### GlassFish Monitoring
Access `http://localhost:4848` for:
- Server status
- Application deployments
- Connection pool monitoring
- JVM metrics

## 🚀 Production Deployment

### Building for Production
```bash
# Create production build
mvn clean package -Pprod

# The WAR file will be in target/ServletMVCTemplate.war
```

### Environment Variables for Production
```env
ENVIRONMENT=production
DB_HOST=your-production-db-host
DB_NAME=your-production-db
DB_USER=your-production-user
DB_PASSWORD=your-secure-password
REDIS_HOST=your-redis-host
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-feature`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📚 Additional Resources

- [Java Servlet Documentation](https://docs.oracle.com/javaee/7/tutorial/servlets.htm)
- [Bootstrap Documentation](https://getbootstrap.com/docs/5.3/getting-started/introduction/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [GlassFish Documentation](https://glassfish.org/documentation)

---

**Happy coding! 🎉**

*This template provides a solid foundation for building modern web applications with Java servlets. Follow the patterns and conventions outlined above for consistent and maintainable code.*