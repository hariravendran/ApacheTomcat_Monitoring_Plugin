#!/bin/bash

# Configuration
LOG_FILE="/path/to/tomcat_monitor.log"
EMAIL="your_email@example.com"
CPU_THRESHOLD=80 # CPU usage threshold in percentage
MEM_THRESHOLD=80 # Memory usage threshold in percentage

# Function to send email notification
send_email() {
    local subject="$1"
    local message="$2"
    echo "$message" | mail -s "$subject" "$EMAIL"
}

# Check if Tomcat is running
if pgrep -f "catalina" > /dev/null; then
    # Get CPU and memory usage
    CPU_USAGE=$(ps -o %cpu= -p $(pgrep -f "catalina"))
    MEM_USAGE=$(ps -o %mem= -p $(pgrep -f "catalina"))

    # Log the status with resource usage
    echo "$(date): Tomcat is running. CPU Usage: ${CPU_USAGE}%, Memory Usage: ${MEM_USAGE}%" >> "$LOG_FILE"

    # Check if resource usage exceeds thresholds
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        send_email "High CPU Usage Alert" "Tomcat CPU usage is at ${CPU_USAGE}%."
    fi

    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        send_email "High Memory Usage Alert" "Tomcat memory usage is at ${MEM_USAGE}%."
    fi
else
    echo "$(date): Tomcat is NOT running!" >> "$LOG_FILE"
    send_email "Tomcat Status Alert" "Tomcat is NOT running on $(hostname)!"
fi
