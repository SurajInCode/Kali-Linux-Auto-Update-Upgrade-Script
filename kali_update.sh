#!/bin/bash

# Script to update and upgrade Kali Linux
# Usage: sudo ./kali_update.sh
# Script created by Surj Sah

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to display a message with a typing effect
function effect_text {
    local message="$1"
    local color="$2"
    echo -ne "$color"
    for (( i=0; i<${#message}; i++ )); do
        echo -n "${message:i:1}"
        sleep 0.04  # Adjust speed of display here
    done
    echo -e "${NC}"
}

# Display ASCII Art in Green
echo -e "${GREEN}
___.           _________                       ____
\_ |__ ___.__./   _____/__ ______________      |__|
 | __ <   |  |\_____  \|  |  \_  __ \__  \     |  |
 | \_\ \___  |/        \  |  /|  | \// __ \_   |  |
 |___  / ____/_______  /____/ |__|  (____  /\__|  |
     \/\/            \/                  \/\______|

${NC}"

# Inform the user about the upgrade process
effect_text "⚠️ By executing this script, your system will undergo a complete upgrade. Please ensure you have saved your important works." "$RED"

# Ask if the user wants to proceed
read -p "🤖 Would you like to proceed? (y/n): " user_choice
if [[ "$user_choice" != "y" && "$user_choice" != "Y" ]]; then
    effect_text "❌ Upgrade aborted by You. Exiting now." "$RED"
    exit 1
fi

# Ask if the user wants to save logs for debugging
read -p "🤖 Would you like to save a log file for debugging in case of an error? (y/n): " save_log_choice

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   effect_text "⚠️  This script must be run as root. Use 'sudo ./kali_update.sh'." "$RED"
   exit 1
fi

username=$(logname)
effect_text "👽 Greetings, Boss $username! Initiating system update sequence..." "$CYAN"

echo ""
effect_text "🚀 Starting the update and upgrade process..." "$BLUE"

# Initialize log file if user chose to save logs
if [[ "$save_log_choice" == "y" || "$save_log_choice" == "Y" ]]; then
    exec &> >(tee -a ~/update_log.txt) # Redirect all output to log file
fi

# Update the package list
effect_text "🔄 Updating the package list..." "$YELLOW"
apt update
if [[ $? -ne 0 ]]; then
    effect_text "❌ Failed to update the package list. Exiting." "$RED"
    exit 1
fi

# Upgrade installed packages
effect_text "⬆️ Upgrading installed packages..." "$YELLOW"
apt upgrade -y
if [[ $? -ne 0 ]]; then
    effect_text "❌ Failed to upgrade packages. Exiting." "$RED"
    exit 1
fi

# Full system upgrade
effect_text "🌌 Performing a full system upgrade..." "$YELLOW"
apt full-upgrade -y
if [[ $? -ne 0 ]]; then
    effect_text "❌ Failed to perform a full upgrade. Exiting." "$RED"
    exit 1
fi

# Clean up unnecessary files
effect_text "🧹 Cleaning up unnecessary files..." "$YELLOW"
apt autoremove -y
apt autoclean -y

effect_text "✅ Update and upgrade process completed successfully." "$GREEN"
effect_text "✨ Your system has been successfully updated, Boss $username." "$CYAN"

# Ask the user if they want to reboot
read -p "🤖 Would you like to reboot now, Boss? (y/n): " reboot_choice

if [[ "$reboot_choice" == "y" || "$reboot_choice" == "Y" ]]; then
    effect_text "🔄 Rebooting the system... Prepare for warp speed!" "$BLUE"
    reboot
else
    effect_text "⏳ Reboot skipped. Remember to reboot later if necessary, Boss." "$CYAN"
    exit 0
fi
