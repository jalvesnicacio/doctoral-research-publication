
from diagrams import Cluster, Diagram, Node, Edge
from diagrams.onprem.queue import Kafka
from diagrams.onprem.network import Zookeeper
from diagrams.generic.compute import Rack
from diagrams.generic.storage import Storage
from diagrams.onprem.analytics import Hadoop
from diagrams.alibabacloud.storage import FileStorageHdfs as HDFS
from diagrams.custom import Custom
from diagrams.c4 import Person, Container, Database, System, SystemBoundary, Relationship


graph_attr = {"splines": "polyline",
              "compound": "true"}

with Diagram("Système d'ingestion des métriques", show=True, direction="LR", graph_attr=graph_attr):
    coordinator = Rack("coordinator")
    kafka_grp = SystemBoundary("Kafka")
    replicaSet = Cluster("Network: ReplicaSet")
    set1_grp = Cluster("Set 1")
    set2_grp = Cluster("Set 2")
    set3_grp = Cluster("Set 3")
    hdfs_grp = SystemBoundary("HDFS")

    #  Groupe kafka:
    with kafka_grp:
        kafka = Kafka("kafka")
        zookeeper = Zookeeper("zookeeper")

     # Replicaset network:
    with replicaSet:
        with Cluster("Set 1", direction="TB", graph_attr={"pencolor": "#034b94"}):
            clustermanager_1 = Rack("clustermanager_1")
            backend_1 = Rack("backend_1")

        with Cluster("Set 2"):
            clustermanager_2 = Rack("clustermanager_2")
            backend_2 = Rack("backend_2")

        with Cluster("Set 3"):
            clustermanager_3 = Rack("clustermanager_3")
            backend_3 = Rack("backend_3")

    with hdfs_grp:
        namenode = Custom("namenode", "./static/resources/cpu.png")
        datanode = HDFS("datanode")
        resourcemanager = Rack("resourcemanager")
        nodemanager = Rack("nodemanager1")
        historyserver = Rack("historyserver")

    blobstore = Storage("blobstore")

    coordinator >> Edge(label="depends_on") >> kafka
    kafka << clustermanager_1
    kafka << clustermanager_2
    kafka << clustermanager_3

    clustermanager_1 << backend_1
    clustermanager_2 << backend_2
    clustermanager_3 << backend_3

    clustermanager_1 >> datanode
    clustermanager_2 >> datanode
    clustermanager_3 >> datanode

    # backend_1 >> clustermanager_1

    backend_1 >> blobstore
    backend_2 >> blobstore
    backend_3 >> blobstore

    datanode << namenode
