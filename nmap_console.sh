#!/bin/bash

LOG_DIR="$HOME/nmap_logs"
mkdir -p "$LOG_DIR"

# Function to display the header
display_header() {
    echo "==========================================="
    echo "        🛡️  INTERACTIVE NMAP CONSOLE  🛡️"
    echo "==========================================="
    echo "        Professional Network Scanning"
    echo "==========================================="
}

# Function to display the main menu
display_menu() {
    echo ""
    echo "📌 Select an Nmap Scan Type:"
    echo "-------------------------------------------"
    echo "1)  🔍 Quick Scan                  2)  🚀 Full Scan"
    echo "3)  🌍 Host Discovery              4)  🔎 Service Enumeration"
    echo "5)  🖥️ OS Detection                6)  🎯 Specific Port Scan"
    echo "7)  🔥 Aggressive Scan             8)  🏴️ Stealth Scan"
    echo "9)  🎭 Firewall Evasion            10) ⏳ Slow Comprehensive Scan"
    echo "11) ⚡ Fast Scan                    12) 🔬 Scan for Vulnerabilities"
    echo "13) 🛡️ Scan with Custom Scripts    14) 🌐 Scan IPv6 Targets"
    echo "-------------------------------------------"
    echo "📂 Log Management:"
    echo "15) 📝 View Logs                   16) 🔍 Search Logs"
    echo "17) 📚 View Specific Log            18) ❌ Delete Logs"
    echo "19) 🚀 Exit"
    echo "-------------------------------------------"
    echo
    read -p "Enter your choice: " choice
}

# Function to log executed commands with timestamps
log_command() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    log_file="$LOG_DIR/nmap_$(date "+%Y%m%d_%H%M%S").log"
    
    echo -e "\n-------------------------------------------" | tee -a "$log_file"
    echo "🕒 [$timestamp] Running Command: $1" | tee -a "$log_file"
    echo "-------------------------------------------" | tee -a "$log_file"
    
    eval "$1" | tee -a "$log_file"
    
    echo -e "\n✅ Command Executed Successfully! Log saved to: $log_file"
}

# Function to display logs
view_logs() {
    if [ -z "$(ls -A $LOG_DIR)" ]; then
        echo "❌ No logs available."
    else
        echo
        echo "📝 Available Logs:"
        echo
        ls -lh "$LOG_DIR"
        echo
    fi
}

# Function to search logs using regex
search_logs() {
    if [ -z "$(ls -A $LOG_DIR)" ]; then
        echo
        echo "❌ No logs available to search."
        echo
    else
        echo
        read -p "Enter regex pattern to search for: " pattern
        echo
        grep -Ri --color=always "$pattern" "$LOG_DIR" || echo "❌ No matches found."
        echo
    fi
}

# Function to view a specific log
view_specific_log() {
    if [ -z "$(ls -A $LOG_DIR)" ]; then
        echo
        echo "❌ No logs available to view."
        echo
    else
        view_logs
        read -p "Enter the exact log filename: " log_name
        if [ -f "$LOG_DIR/$log_name" ]; then
            echo
            echo "LOG STARTS BELOW THIS LINE"
            echo "----------------------------------------------------------------"
            cat "$LOG_DIR/$log_name"
            echo "----------------------------------------------------------------"
            echo "LOG ENDED ABOVE THIS LINE\n"
            echo
        else
            echo
            echo "❌ Log file not found."
        fi
    fi
}

# Function to delete logs
delete_logs() {
    if [ -z "$(ls -A $LOG_DIR)" ]; then
        echo
        echo "❌ No logs to delete."
        echo
    else
        echo
        echo "❌ Deleting all logs in $LOG_DIR..."
        rm -rf "$LOG_DIR"/*
        echo
        echo "✅ All logs deleted."
        echo
    fi
}

while true; do
    display_header
    display_menu

    case $choice in
        1) 
           echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -T4 -F $target" ;;
        2) 
           echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -p- -T4 $target" ;;
        3) 
           echo
           read -p "Enter network range (e.g., 192.168.1.0/24): " network; log_command "nmap -sn $network" ;;
        4) 
           echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -sV $target" ;;
        5) 
		   echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -O $target" ;;
        6) 
           echo
           read -p "Enter target IP/hostname: " target; read -p "Enter specific port (e.g., 80,443): " port; log_command "nmap -p $port $target" ;;
        7) 
           echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -A $target" ;;
        8) 
           echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -sS $target" ;;
        9) 
           echo
           read -p "Enter target IP/hostname: " target; log_command "nmap -f $target" ;;
        10) 
            echo
            read -p "Enter target IP/hostname: " target; log_command "nmap -p- -T2 --scan-delay 100ms $target" ;;
        11) 
            echo
            read -p "Enter target IP/hostname: " target; log_command "nmap -T5 --min-rate 10000 $target" ;;
        12) 
            echo
            read -p "Enter target IP/hostname: " target; log_command "nmap --script vuln $target" ;;
        13) 
            echo
            read -p "Enter target IP/hostname: " target; log_command "nmap --script=default $target" ;;
        14) 
            echo
            read -p "Enter IPv6 target: " target; log_command "nmap -6 $target" ;;
        15) view_logs ;;
        16) search_logs ;;
        17) view_specific_log ;;
        18) delete_logs ;;
        19) 
            echo
            echo "🚀 Exiting Nmap Console. Happy Scanning! 🛡️"; exit 0 ;;
        *) 
            echo
            echo "❌ Invalid Choice! Please try again." ;;
    esac
    read -p "Press Enter to continue..."
done
