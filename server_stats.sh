#!/bin/bash
echo "--- CPU Usage ---"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "Total CPU Usage: $cpu_usage"

echo -e "\n--- Memory Usage ---"
free -m | awk 'NR==2{printf "Used: %sMB | Free: %sMB | Usage: %.2f%%\n", $3, $4, $3*100/$2}'

echo -e "\n--- Disk Usage ---"
df -h / | awk 'NR==2{printf "Used: %s | Free: %s | Usage: %s\n", $3, $4, $5}'

echo -e "\n--- Top 5 Processes by CPU Usage ---"
ps -eo pcpu,pmem,comm --sort=-pcpu | head -n 6

echo -e "\n--- Top 5 Processes by Memory Usage ---"
ps -eo pcpu,pmem,comm --sort=-pmem | head -n 6
