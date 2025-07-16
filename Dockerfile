# java Build Stage
FROM eclipse-temurin:17-jdk-jammy AS build

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# ✅ Debug: List directory to confirm mvnw exists
RUN ls -l /app

# Build war file
RUN --mount=type=cache,target=/root/.m2 chmod +x ./mvnw && ./mvnw -f pom.xml clean package


# Deployment Stage
FROM ghcr.io/eclipse-ee4j/glassfish

# ✅ Install CA certs to fix Stripe SSL in runtime
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates ca-certificates-java && \
    update-ca-certificates -f && \
    rm -rf /var/lib/apt/lists/*

# Copy WAR to autodeploy
COPY --from=build /app/target/*.war /opt/glassfish7/glassfish/domains/domain1/autodeploy/web.war