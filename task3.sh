#!/bin/bash

# Define log file
file="./auth.log"

# Create test log file under root /
echo "Creating test log file at $file"
touch $file

# Give rwxrwxrwx permissions (777)
chmod 777 $file

# Add sample log entries
echo "Adding sample log entries..."
cat <<EOF > $file
Jan 10 12:22:01 server sshd[1234]: Failed password for invalid user admin from 192.168.1.10 port 50512 ssh2
Jan 10 12:22:03 server sshd[1236]: Failed password for root from 192.168.1.11 port 50514 ssh2
Jan 10 12:22:05 server sshd[1238]: Accepted password for validuser from 192.168.1.12 port 50516 ssh2
Jan 10 12:23:01 server sshd[1240]: Failed password for invalid user test from 192.168.1.13 port 50520 ssh2
EOF

# Count exact occurrences of "Failed password"
echo ""
echo "Counting brute-force attempts..."
count=$(grep -w "Failed password" "$file" | wc -l)

# Display result
echo "Number of Failed SSH Password Attempts: $count"
