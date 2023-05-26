# succulent-container
## Configuration
In the root directory, create a file named `configuration.yml` and define the following:
```yml
data:
  - name: # Measure name
```

## Installation
Execute the following command to build the container:
```bash
docker build -t succulent-container .
```

Alternatively, you can use `docker-compose`:
```bash
docker compose build
```

## Usage
Execute the following command to run the container:
```bash
docker run -p 8080:8080 succulent-container .
```

Alternatively, you can use `docker-compose`:
```bash
docker compose up
```