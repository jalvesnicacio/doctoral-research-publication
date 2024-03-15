
from diagrams import Cluster, Diagram
from diagrams.aws.compute import ECS
from diagrams.onprem.queue import Kafka
from diagrams.onprem.network import Zookeeper


with Diagram("Système d'ingestion des métriques", show=False):
    coordinator = ECS("coordinator")

    # Groupe kafka:
    with Cluster("Kafka"):
        kafka_group = [
            Kafka("kafka"),
            Zookeeper("zookeeper")
        ]
