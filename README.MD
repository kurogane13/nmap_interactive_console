# Nmap-Interactive-Console

### Nmap Network Scanning utility

Program developed by Gustavo Wydler Azuaga - 2025-02-06  
--------------------------------------------------------------------------------------------

## Description

The **Nmap Interactive Console** is a command-line interface (CLI) tool designed to simplify Nmap network scanning. This interactive script allows users to perform various types of scans, manage logs, and analyze network security with ease.

--------------------------------------------------------------------------------------------

## Requirements

- **Nmap must be installed** on your system.
  - Install Nmap if not installed:
    ```bash
    sudo apt install nmap   # Debian-based systems
    sudo snap install nmap  # Snap package
    sudo yum install nmap   # RHEL-based systems
    brew install nmap       # macOS
    ```
- Bash shell environment

--------------------------------------------------------------------------------------------

## How to Run the Program

1. Clone or download the script:
    ```bash
    git clone https://github.com/kurogane13/nmap_interactive_console.git
    cd nmap-interactive_console
    ```
2. Grant execution permissions:
    ```bash
    sudo chmod +x nmap_console.sh
    ```
3. Run the program:
    ```bash
    ./nmap_console.sh
    ```

--------------------------------------------------------------------------------------------

## Some of the features

- **Quick and Full Scans**
- **Service Enumeration & OS Detection**
- **Firewall Evasion & Stealth Scans**
- **Aggressive & Slow Comprehensive Scans**
- **Custom Script Execution**
- **IPv6 Target Scanning**
- **Log Management (View, Search, Delete Logs)**

--------------------------------------------------------------------------------------------

## Log Management

Logs are stored in the `$HOME/nmap_logs/` directory. The script provides options to:

- **View available logs**
- **Search logs using regex**
- **View specific log content**
- **Delete all logs**

--------------------------------------------------------------------------------------------

## Customization

You can modify the script to include additional Nmap options or alter its behavior by editing `nmap_console.sh`.

--------------------------------------------------------------------------------------------
