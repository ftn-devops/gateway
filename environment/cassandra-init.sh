#!/usr/bin/env bash

until printf "" 2>>/dev/null >>/dev/tcp/cassandra/9042; do 
    sleep 5;
    echo "Waiting for cassandra...";
done

echo "Creating keyspace and table..."
cqlsh cassandra -u cassandra -p cassandra -e "CREATE KEYSPACE IF NOT EXISTS logs WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};"
cqlsh cassandra -u cassandra -p cassandra -e "DROP TABLE IF EXISTS logs.logs;CREATE TABLE IF NOT EXISTS logs.logs (component_id text, time_of_log timestamp, log_text text, PRIMARY KEY ((component_id),time_of_log));"
echo "===============Created Logs table================";
cqlsh cassandra -u cassandra -p cassandra -e "select * from logs.logs;"
cqlsh cassandra -u cassandra -p cassandra -e "
INSERT INTO logs.logs (component_id, time_of_log, log_text) VALUES ('user', '2024-08-15 12:30:00', 'Log entry 1');
INSERT INTO logs.logs (component_id, time_of_log, log_text) VALUES ('user', '2024-08-15 13:00:00', 'Log entry 2');
INSERT INTO logs.logs (component_id, time_of_log, log_text) VALUES ('accomodation', '2024-08-15 13:30:00', 'Log entry 3');
INSERT INTO logs.logs (component_id, time_of_log, log_text) VALUES ('accomodation', '2024-08-15 14:00:00', 'Log entry 4');
INSERT INTO logs.logs (component_id, time_of_log, log_text) VALUES ('accomodation', '2024-08-15 14:30:00', 'Log entry 5');"
echo "==================Added test Data===============";
cqlsh cassandra -u cassandra -p cassandra -e "select * from logs.logs;"
echo "=============Init Script is DONE================";