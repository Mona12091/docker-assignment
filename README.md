# docker-assignment

## Clone the repository
```bash
git clone https://github.com/Mona12091/docker-assignment.git
cd docker-assignment
```

## Start the application 
Run Command to Build image: DOCKER_BUILDKIT=1 docker build -t docker-app .
Create network: docker network create docker-app-network
Create volume: docker volume create postgres-data

Run database container: docker run -d --name db --network docker-app-network \
-e POSTGRES_USER=user \
-e POSTGRES_PASSWORD=app \
-e POSTGRES_DB=postgres \
-v postgres-data:/var/lib/postgresql/data \
postgres:16

Run Application: docker run -d --name docker-ass-app --network docker-app-network -p 8080:8080 docker-app

## Application API
```bash
curl http://localhost:8082/test
curl -X POST http://localhost:8082/user \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John"
  }'
curl http://localhost:8082/users
