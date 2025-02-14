# Kali Linux Update Script
![Bash Badge](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Kali Linux Badge](https://img.shields.io/badge/OS-Kali%20Linux-557C94?style=for-the-badge&logo=kali-linux&logoColor=white)
![License Badge](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)

An interactive Bash script for automating the update and upgrade process in Kali Linux with a user-friendly interface and visual feedback.

## 🚀 Features
- Interactive Interface with typing effect and colorful text
- System Checks to ensure root privileges
- Logging System for debugging purposes
- Progress Feedback with colored status messages
- Safety Prompts before major operations
- Automatic Cleanup of unnecessary packages
- Optional System Reboot after completion
- Error Handling for critical operations

## 🛠️ Technical Details

### Requirements
- Kali Linux Operating System
- Root privileges (sudo access)
- Bash shell

### Functionality
- Updates package repositories
- Performs system upgrade
- Executes full system upgrade
- Removes unnecessary packages
- Cleans package cache
- Optional system reboot

## 💻 Usage
```bash
wget https://github.com/SurajInCode/Kali-Linux-Auto-Update-Upgrade-Script.git
chmod +x kali_update.sh
sudo ./kali_update.sh
```

## 🎨 Visual Elements
- Custom ASCII art banner
- Colored text output
- Progress indicators
- Interactive prompts
- Emoji-based status indicators

## ⚙️ Script Components

### Color Coding
- 🔴 **Red** - Warnings and errors
  - Example: "⚠️ This script must be run as root"
- 🟢 **Green** - Success messages
  - Example: "✅ Update and upgrade process completed successfully"
- 🟡 **Yellow** - Processing status
  - Example: "🔄 Updating the package list..."
- 🔵 **Blue** - Information
  - Example: "🚀 Starting the update and upgrade process..."
- 🐋 **Cyan** - User interactions
  - Example: "👽 Greetings, Boss! Initiating system update sequence..."
- ⚪ **No Color** - Reset to default terminal color

### Functions
```bash
effect_text() {
    # Creates typing effect for messages
    # Parameters:
    #   $1: message to display
    #   $2: color to use
}
```

### Error Handling
```bash
if [[ $? -ne 0 ]]; then
    effect_text "❌ Error message" "$RED"
    exit 1
fi
```

## 📝 Logging
```bash
# Log file location
~/update_log.txt

# Log redirection
exec &> >(tee -a ~/update_log.txt)
```

## ⚠️ Important Notes
- Always backup important data before running system updates
- The script requires root privileges
- Some updates may require a system reboot
- Log files are created only if selected during execution

## 👥 Author
Created by Surj Sah

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🔍 Error Codes
- Exit Code 1: Script not run as root
- Exit Code 1: Package list update failure
- Exit Code 1: Package upgrade failure
- Exit Code 1: Full system upgrade failure

## 📚 Changelog

### Version 1.0.0
- Initial release with the following features:
  - Basic update and upgrade functionality
  - Interactive interface with typing effect
  - Colorful text output and ASCII art
  - Root privilege checking
  - Optional logging system
  - Error handling for critical operations
  - Package cleanup functionality
  - Optional system reboot
  - User-friendly prompts and confirmations

### Future Planned Features
- Progress bar for long operations
- Backup functionality before updates
- Custom update configurations
- Network connection verification
- Update scheduling options
- System health check before updates
