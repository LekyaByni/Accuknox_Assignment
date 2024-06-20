
# System Monitor Script

This repository contains a script (`monitor_system.sh`) to monitor various system health parameters including CPU usage, memory usage, disk usage, and the status of specific processes.

## Getting Started

Follow these instructions to get the script up and running on your system.

### 1. Make the Script Executable

Before you can execute the script, you need to make it executable. In your terminal, navigate to the directory where you saved `monitor_system.sh` and run:

```bash
chmod +x monitor_system.sh
```


### 2. Execute the Script

Now, you can execute the script by running:

```bash
./monitor_system.sh
```

This will run the main function defined in the script, which in turn will call all the health check functions (`check_cpu`, `check_memory`, `check_disk`, and `check_processes`). If any thresholds are exceeded, the script will print alerts to the console accordingly.

### Notes

- **Privileges:** Make sure to run the script with appropriate privileges to access system information (typically as root or using `sudo`).
- **Customizing Thresholds:** Customize the thresholds (`CPU_THRESHOLD`, `MEMORY_THRESHOLD`, `DISK_THRESHOLD`, `PROCESS_THRESHOLD`) as per your specific monitoring requirements. These can be adjusted in the script to suit your needs.

## Script Details

### Health Check Functions

- **check_cpu:** Monitors CPU usage and alerts if the usage exceeds the defined threshold.
- **check_memory:** Monitors memory usage and alerts if the usage exceeds the defined threshold.
- **check_disk:** Monitors disk usage and alerts if the usage exceeds the defined threshold.
- **check_processes:** Monitors specific processes to ensure they are running and alerts if they are not.

### Customization

You can customize the script by editing the following variables to set your desired thresholds:

```bash
CPU_THRESHOLD=80     # CPU usage threshold in percentage
MEMORY_THRESHOLD=80  # Memory usage threshold in percentage
DISK_THRESHOLD=90    # Disk usage threshold in percentage
PROCESS_THRESHOLD=1  # Process count threshold
```
