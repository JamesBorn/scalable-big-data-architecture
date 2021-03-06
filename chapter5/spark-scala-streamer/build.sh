#!/bin/bash

echo 'Setting JAVA_HOME to Java7'
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home/

echo 'Package sources'
mvn clean scala:compile package

echo 'Running Spark'
spark-submit --class org.apress.examples.chapter4.KafkaStreamer \
	--master local[2] \
	target/spark-scala-streamer-1.0.0-jar-with-dependencies.jar \
	192.168.59.103:9092,192.168.59.103:9093 clickstream
