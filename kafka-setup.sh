#!/bin/bash

echo "Waiting for Kafka to be ready..."
cub kafka-ready -b kafka:9092 1 20

echo "Creating topics..."
kafka-topics.sh --bootstrap-server kafka:9092 --create --if-not-exists \
  --topic your-topic-name \
  --partitions 3 \
  --replication-factor 1

echo "Listing topics..."
kafka-topics.sh --bootstrap-server kafka:9092 --list
