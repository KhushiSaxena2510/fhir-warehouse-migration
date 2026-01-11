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

# FHIR Warehouse Migration Project

This repository implements a FHIR-based healthcare data warehouse that demonstrates the transition from legacy, flat healthcare data into a validated, stateful, and semantically consistent FHIR ecosystem. The project is designed as a layered architecture comprising infrastructure provisioning, governance rulebooks, and a data translation engine.

---

## 1. Infrastructure Layer (Containerized FHIR Server)

The infrastructure layer provisions a HAPI FHIR server using Docker Compose. Containerization was chosen to eliminate dependency inconsistencies across development environments and to ensure reproducible deployments across different machines.

Port mapping is explicitly defined to expose the FHIR server running inside the container to the host system. Persistent volumes are configured to ensure that FHIR resources remain stateful across container restarts, enabling realistic warehouse behavior rather than ephemeral testing.

---

## 2. Rulebook Layer (FHIR Profiling and Governance)

The Rulebook layer represents the governance backbone of the warehouse. Instead of relying on permissive base FHIR resources, local constraints were authored using FHIR Shorthand (FSH) to enforce mandatory demographic and clinical elements.

Patient and Observation profiles ensure that critical attributes such as identifiers, names, clinical codes, timestamps, and subject references are always present. A ConceptMap was introduced to eliminate fragile “magic string” logic by formally translating legacy gender values into standardized FHIR administrative gender codes using terminology services.

This separation of governance rules from application code improves clinical safety, auditability, and long-term maintainability.

---

## 3. Translator Layer (Legacy CSV to FHIR Transactions)

The Translator layer operationalizes the warehouse by converting legacy CSV records into FHIR Transaction Bundles using Python. Rather than creating resources individually, Patient and Observation resources are packaged into a single atomic transaction.

UUID-based internal references are used to link Observations to their corresponding Patients within the same bundle. This guarantees referential integrity and prevents the creation of orphaned clinical data, ensuring all-or-nothing ingestion semantics.

---

## 4. Architectural Outcome

By combining containerized infrastructure, declarative governance via FHIR profiling, and atomic transaction-based ingestion, this project demonstrates the paradigm shift from static healthcare data modeling to resilient, interoperable system architecture.

The resulting warehouse is not merely a data store, but a validated clinical system capable of enforcing semantic consistency, transactional safety, and long-term extensibility.
