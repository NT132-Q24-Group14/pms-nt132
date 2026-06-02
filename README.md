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
- [Demo](#demo)
- [Project Repositories](#project-repositories)
- [Tech Stack](#tech-stack)
- [CI/CD Pipeline](#cicd-pipeline)
- [Deployment Strategy](#deployment-strategy)
- [Project Structure](#project-structure)
- [Authors](#authors)

---

## Overview
**Project Management System (NT132)** is a cloned Java Servlet and JSP web application. The original project focused on backend development for a role-based internal project management system.

This project was built for the **NT132** course at **UIT - University of Information Technology**. It demonstrates a CI/CD workflow around the application, including Maven build automation, Docker image publishing, Ansible deployment, Blue-Green Deployment, Zero-Downtime rollback and rollforward, and monitoring with Prometheus, Loki, and Grafana.

Original project: [pms](https://github.com/hdatuan/pms)

---

## Demo
Demo videos: [Google Drive Demo](https://drive.google.com/drive/folders/1JZ8IEu9yE_PF3mmEs4Q1oOkJnwZVmE-2?usp=drive_link)

---

## Project Repositories
The full project is organized across three repositories:

| Repository | Purpose |
|------------|---------|
| [`pms-nt132`](https://github.com/NT132-Q24-Group14/pms-nt132) | Java application source code, Dockerfile, and Jenkins CI/CD pipelines. |
| [`ansible`](https://github.com/NT132-Q24-Group14/ansible) | Ansible infrastructure automation and deployment playbooks used by Jenkins. |
| [`monitoring`](https://github.com/NT132-Q24-Group14/monitoring) | Monitoring and observability setup with Prometheus, Loki, and Grafana. |

---

## Tech Stack
### Application
*   **Backend**: Java 21, Java Servlet API, JSP, JSTL
*   **Database**: MySQL 8.0
*   **Frontend**: Bootstrap 4, jQuery, JavaScript

### CI/CD & Deployment
*   **Build & Package**: Maven, WAR packaging
*   **Runtime & Containerization**: Apache Tomcat 9, Docker
*   **Automation**: Jenkins Pipeline, Docker Hub, Ansible
*   **Release Strategy**: Blue-Green Deployment, rollback, rollforward

### Monitoring & Observability
*   **Metrics**: Prometheus
*   **Logs**: Loki
*   **Dashboards**: Grafana

---

## CI/CD Pipeline
The workflow is organized into one main delivery pipeline and two release operation pipelines:

| Pipeline | Main Responsibilities |
|----------|-----------------------|
| `Jenkinsfile` | Builds and tests the app, packages `target/pms.war`, builds and pushes Docker images, and deploys through Ansible. |
| `Jenkinsfile.rollback` | Verifies a target Docker image tag and rolls the app back through the Ansible rollback playbook. |
| `Jenkinsfile.rollforward` | Verifies a target Docker image tag and rolls the app forward through the Ansible rollforward playbook. |

The Docker image copies `target/pms.war` into Tomcat as `ROOT.war`, so the application is deployed automatically when Tomcat starts.

---

## Deployment Strategy
The deployment workflow uses **Blue-Green Deployment** to switch between prepared application versions in a controlled way.

The rollback and rollforward pipelines support **Zero-Downtime** release operations by moving the active deployment between existing image versions without rebuilding the application during the switch. Detailed infrastructure behavior is managed in the separate Ansible repository.

---

## Project Structure

```bash
pms-nt132/
|-- Jenkinsfile              # Main Jenkins CI/CD pipeline
|-- Jenkinsfile.rollback     # Rollback pipeline for switching to a previous image tag
|-- Jenkinsfile.rollforward  # Rollforward pipeline for switching to a selected image tag
|-- Dockerfile               # Tomcat 9 JDK 21 runtime image
|-- pom.xml                  # Maven build and WAR packaging configuration
|-- README.md                # Project documentation
`-- src/                     # Java Servlet/JSP application source
    |-- main/java            # Backend source code
    |-- main/resources       # Application resources and configuration examples
    |-- main/webapp          # JSP views and frontend assets
    `-- test/java            # Unit tests
```

---

## Authors

| Member | Contribution |
|--------|--------------|
| **hdatuan** | Original backend developer, CI/CD and monitoring implementer |
| **Mothmon14682** | CI/CD implementer |
| **Truo367** | Monitoring system implementer |
