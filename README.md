# fhir-warehouse-migration
FHIR-based healthcare data warehouse using Docker, FSH, and Python
---

## Infrastructure – Containerized HAPI FHIR Server

The FHIR warehouse is instantiated using a Dockerized HAPI FHIR server to ensure a consistent and reproducible runtime environment across different development machines.

### Docker Compose Usage
Docker Compose is used to define and manage the HAPI FHIR server as a containerized service. This approach eliminates dependency conflicts (“dependency hell”) by packaging the application, runtime, and configuration into a single, portable environment.

### Port Mapping (Container ↔ Host Bridging)

The following port mapping is configured in the docker-compose file:

8080:8080

- The right-hand port (8080) represents the port exposed inside the Docker container.
- The left-hand port (8080) represents the port on the host machine.
- This mapping allows the HAPI FHIR server running inside the container to be accessed via:

http://localhost:8080

Port mapping bridges the isolated Docker container network to the host machine, enabling RESTful access to FHIR endpoints from browsers, Postman, and Python-based ETL scripts.

### Data Persistence

A named Docker volume is attached to the container to persist FHIR resources across container restarts. This ensures that the system behaves as a stateful healthcare data warehouse rather than a stateless API.
