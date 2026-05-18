<div align="center">

# Project Management System (NT132)
### DevOps CI/CD implementation for the NT132 Project at UIT

[![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.java.com/)
[![Maven](https://img.shields.io/badge/Maven-3.9-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)](https://maven.apache.org/)
[![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-D24939?style=for-the-badge&logo=jenkins&logoColor=white)](https://www.jenkins.io/)
[![Tomcat](https://img.shields.io/badge/Tomcat-9-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)](https://tomcat.apache.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-005C84?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

</div>

---

## Table of Contents
- [Overview](#overview)
- [Academic Context](#academic-context)
- [DevOps Scope](#devops-scope)
- [Pipeline Overview](#pipeline-overview)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Authors](#authors)

---

## Overview
**Project Management System (NT132)** is a cloned version of a Java Servlet and JSP backend project. The original project focused on backend development for a role-based internal project management application.

This repository was built for the **NT132** course at **UIT - University of Information Technology**. It focuses on the DevOps implementation around that application: packaging the backend as a WAR file, containerizing it with Docker, validating it through Jenkins, publishing Docker images, deploying it through an Ansible-based workflow, and connecting it with a monitoring system.

---

## Academic Context
This project is part of the NT132 coursework at UIT. The main objective is to demonstrate how an existing backend application can be adapted into a complete DevOps workflow.

The full course project is split across three repositories:

| Repository | Purpose |
|------------|---------|
| [`pms-nt132`](https://github.com/NT132-Q24-Group14/pms-nt132) | Application source code, Dockerfile, and Jenkins CI/CD pipeline. |
| [`ansible`](https://github.com/NT132-Q24-Group14/ansible) | Infrastructure automation and deployment playbooks used by the Jenkins pipeline. |
| [`monitoring`](https://github.com/NT132-Q24-Group14/monitoring) | Monitoring and observability setup for the deployed system. |

---

## DevOps Scope
This repository demonstrates:

*   **Maven build automation** for compiling, testing, and packaging the Java web application.
*   **WAR packaging** with the final artifact generated as `target/pms.war`.
*   **Docker containerization** using `tomcat:9-jdk21` as the runtime image.
*   **Jenkins CI/CD orchestration** for checkout, test, package, image build, image push, and deployment.
*   **Docker Hub publishing** with branch-aware and tag-aware image tags.
*   **Ansible deployment integration** using a separate infrastructure repository.
*   **Monitoring integration** using a separate monitoring repository.
*   **Environment-based configuration** for database connection settings.

---

## Pipeline Overview
The Jenkins pipeline is defined in `Jenkinsfile` and follows this flow:

| Stage | Purpose |
|-------|---------|
| Checkout | Pull the application source from SCM. |
| Build & Test | Run Maven inside `maven:3.9-eclipse-temurin-21`, execute tests, and package the WAR file. |
| Docker Build & Push | Build the Tomcat image from `Dockerfile` and push it to Docker Hub. |
| Tag Handling | Publish Git tag builds as both `latest` and the Git tag. |
| Branch Handling | Publish `main` as `stable`; publish other branches using a branch-based Docker tag. |
| Ansible Checkout | Pull the deployment automation from `NT132-Q24-Group14/ansible`. |
| Deploy | Run the Ansible playbook with database variables and Ansible Vault credentials. |

The generated Docker image copies `target/pms.war` into Tomcat as `ROOT.war`, so the containerized application is deployed automatically when Tomcat starts.

---

## Tech Stack
### Application
*   **Language**: Java 21
*   **Web**: Java Servlet API, JSP, JSTL
*   **Database**: MySQL 8.0
*   **Frontend**: Bootstrap 4, jQuery, JavaScript, Morris.js, DataTables

### DevOps
*   **Build Tool**: Maven
*   **Local App Runner**: Cargo Maven plugin with embedded Tomcat 9
*   **Container Runtime**: Docker
*   **CI/CD**: Jenkins Pipeline
*   **Image Registry**: Docker Hub
*   **Deployment Automation**: Ansible

---

## Getting Started
Use these commands to validate the application locally before running it through the CI/CD pipeline.

### Prerequisites
*   JDK: [Java Development Kit (JDK 21+)](https://www.oracle.com/java/technologies/downloads/)
*   Build Tool: [Apache Maven](https://maven.apache.org/download.cgi)
*   Database: [MySQL Server 8.0+](https://dev.mysql.com/downloads/installer/) or Docker

### Local Validation
1.  **Clone the repository**
    ```bash
    git clone https://github.com/NT132-Q24-Group14/pms-nt132.git
    cd pms-nt132
    ```

2.  **Start MySQL**
    ```bash
    docker run --name pms-mysql -e MYSQL_ROOT_PASSWORD=your_password -e MYSQL_DATABASE=pms -p 3306:3306 -d mysql:8.0
    ```

3.  **Export database variables**
    ```bash
    export pms_db_host=localhost:3306
    export pms_db_name=pms
    export pms_db_username=root
    export pms_db_password=your_password
    ```

4.  **Run tests**
    ```bash
    mvn clean test
    ```

5.  **Package the WAR**
    ```bash
    mvn clean package
    ```

6.  **Run locally with embedded Tomcat**
    ```bash
    mvn cargo:run
    ```

7.  **Open the app**
    *   URL: `http://localhost:8080/pms`

---

## Project Structure

```bash
pms-nt132/
|-- Jenkinsfile              # Jenkins CI/CD pipeline
|-- Dockerfile               # Tomcat 9 JDK 21 runtime image
|-- pom.xml                  # Maven build, WAR packaging, Cargo runner
|-- README.md                # Project documentation
`-- src
    |-- main
    |   |-- java/hdatuan
    |   |   |-- config       # MySQL connection setup
    |   |   |-- controller   # Servlet controllers
    |   |   |-- entity       # Domain entities
    |   |   |-- filter       # Authentication filters
    |   |   |-- repository   # JDBC data access
    |   |   `-- service      # Business logic
    |   |-- resources        # Application resources
    |   `-- webapp           # JSP views and frontend assets
    `-- test/java            # Unit tests
```

---

## Authors
This NT132 project was developed by a UIT student team:

| Member | Contribution |
|--------|--------------|
| **hdatuan** | Original backend developer and CI/CD implementer for this cloned project. |
| **Mothmon14682** | CI/CD implementer. |
| **Truo367** | Monitoring system implementer. |
