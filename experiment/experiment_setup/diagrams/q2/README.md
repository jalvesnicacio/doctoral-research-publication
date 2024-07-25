# Justifications for Decisions in the Docker Compose File

The Docker Compose file was designed to accurately represent the architecture of the MetricsDB system as identified in the original diagram. We opted for a modular approach, dividing services into groups and clusters to facilitate scalability and maintenance.
In this document, we present the reasons behind the decisions made during the elaboration of the Docker Compose file for the MetricsDB system, used in our research.

## Elements of the MetricsDB System

The main elements of the MetricsDB system, as identified in the original diagram, were as follows:

- Coordinator
- Kafka
- Blobstore
- HDFS
- Three replica sets, each containing:
  - Backend server
  - Cluster manager

## Use of Official Kafka and HDFS Repositories

For the Kafka and HDFS components, we chose to use the official repositories available on Docker Hub (https://hub.docker.com). This ensures the reliability and consistency of the configurations used, as well as facilitating system maintenance and scalability.

- Kafka: We used the official repository from Confluent Inc. (https://hub.docker.com/r/confluentinc/cp-kafka) to configure the Kafka service, ensuring that the parameters are aligned with best practices and recommended configurations.
- HDFS: We based the HDFS configuration on the containers provided by the Apache Hadoop project (https://hub.docker.com/r/apache/hadoop), which offers a reliable and optimized implementation of the Hadoop Distributed File System.

## Other Elements

As these are software components owned by Twitter and, therefore, we do not have access to them, we simulated these elements by using Dockerfile files where NodeJs API images were instantiated to simulate the component.
