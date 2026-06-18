# docker-assignment

## Clone the repository
```bash
git clone https://github.com/Mona12091/docker-assignment.git
cd docker-assignment
```

## Start the application using Docker Compose
```bash
docker compose up -d --build
docker compose ps
```

## Application API
```bash
curl http://localhost:8082/test
curl -X POST http://localhost:8082/user \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John"
  }'
curl http://localhost:8082/users
