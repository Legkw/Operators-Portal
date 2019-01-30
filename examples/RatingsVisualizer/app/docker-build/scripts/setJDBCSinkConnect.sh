#!/bin/bash


#export URL="kafka-connect-avor:28083"
export URL="$KAFKA_CONNECT_HOST:28083"
export MYSQL="$MYSQL_HOST"
export SR="$SCHEMA_REGISTRY_HOST_NAME:8081"



echo ""
echo "Adding JDBC SINK connector to $URL/connectors"

echo ""
echo ""



#curl -X POST -H "Content-Type: application/json" --data "{\"name\": \"cigo-jdbc-sink_RatingsVisualizer\", \"config\": {\"connector.class\":\"io.confluent.connect.jdbc.JdbcSinkConnector\", \"tasks.max\":\"1\", \"topics\":\"$SINK_TOPICS\", \"connection.url\":\"jdbc:mysql://$MYSQL_HOST:3306/connect_test?user=root&password=confluent\", \"key.converter\":\"io.confluent.connect.avro.AvroConverter\", \"key.converter.schema.registry.url\":\"http://schema-registry:8081\", \"value.converter\":\"io.confluent.connect.avro.AvroConverter\", \"value.converter.schema.registry.url\":\"http://schema-registry:8081\", \"insert.mode\":\"insert\", \"batch.size\":\"0\", \"auto.create\":\"true\", \"pk.mode\":\"none\", \"pk.fields\":\"none\" }}" $URL/connectors

curl -X POST -H "Content-Type: application/json" --data "{\"name\": \"cigo-jdbc-sink_RatingsVisualizer\", \"config\": {\"connector.class\":\"io.confluent.connect.jdbc.JdbcSinkConnector\", \"tasks.max\":\"1\", \"topics\":\"$SINK_TOPICS\", \"connection.url\":\"jdbc:mysql://$MYSQL_HOST:3306/connect_test?user=root&password=confluent\", \"key.converter\":\"io.confluent.connect.avro.AvroConverter\", \"key.converter.schema.registry.url\":\"http://$SR\", \"value.converter\":\"io.confluent.connect.avro.AvroConverter\", \"value.converter.schema.registry.url\":\"http://$SR\", \"insert.mode\":\"insert\", \"batch.size\":\"0\", \"auto.create\":\"true\", \"pk.mode\":\"record_value\", \"pk.fields\":\"id\" }}" $URL/connectors

echo ""
echo ""
