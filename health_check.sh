#!/bin/bash

# Perform HTTP request to the web app
response=$(curl -s -o /dev/null -w "%{http_code}" http://34.200.121.162/)

# Log the status with timestamp
echo "$(date +"%Y-%m-%d %H:%M:%S") - HTTP status code: $response" >> /home/ubuntu/SimpleFlaskApp/to/log/file.log
