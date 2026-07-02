# =========================
# Stage 1: Build the application
# =========================

# Use Maven with Eclipse Temurin JDK 21 to build the project
FROM maven:3.9-eclipse-temurin-21 AS build

# Set the working directory in the container
WORKDIR /app

# Copy dependency configuration
COPY pom.xml .

# Cache Maven dependencies
RUN --mount=type=cache,target=/root/.m2 \
    mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Build the application and skip tests
RUN --mount=type=cache,target=/root/.m2 \
    mvn clean package -DskipTests

# =========================
# Stage 2: Create runtime image
# =========================

# Use Java 21 base image
FROM eclipse-temurin:21-jre

# Set the working directory in the container
WORKDIR /app

# create non-root user
RUN useradd -m appuser

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# switch to non-root user
USER appuser

# Application port inside the container
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]