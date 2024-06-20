#!/bin/bash

# Thresholds (adjust these as per your requirements)
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
PROCESS_THRESHOLD=500

# Function to check CPU usage
check_cpu() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        echo "High CPU usage detected: ${cpu_usage}%"
        # You can add alerting mechanisms here, e.g., send an email, log to a file, etc.
    fi
}

# Function to check memory usage
check_memory() {
    local memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc -l) )); then
        echo "High memory usage detected: ${memory_usage}%"
        # You can add alerting mechanisms here
    fi
}

# Function to check disk usage
check_disk() {
    local disk_usage=$(df -h --output=pcent / | grep -o '[0-9]*')
    if (( disk_usage >= DISK_THRESHOLD )); then
        echo "High disk usage detected: ${disk_usage}%"
        # You can add alerting mechanisms here
    fi
}

# Function to check number of running processes
check_processes() {
    local process_count=$(ps aux | wc -l)
    if (( process_count > PROCESS_THRESHOLD )); then
        echo "High number of processes detected: ${process_count}"
        # You can add alerting mechanisms here
    fi
}

# Main function to call all health checks
main() {
    check_cpu
    check_memory
    check_disk
    check_processes
}

# Execute the main function
main


