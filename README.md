# <div align="center">📡 Live-Host-Discoverer - Real-Time Network Monitoring Tool</div>

<div align="center">
  <img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Bash">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux">
  <img src="https://img.shields.io/badge/Security-ED1C24?style=for-the-badge&logo=security&logoColor=white" alt="Security">
  <img src="https://img.shields.io/badge/Nmap-0E83CD?style=for-the-badge&logo=nmap&logoColor=white" alt="Nmap">
</div>

**Live Host Discoverer** is a lightweight and powerful Bash-based tool that detects live hosts on a local network, notifies you instantly about newly connected or disconnected devices via Telegram, and keeps a log of all network activity. Ideal for system admins, home network users, and cybersecurity learners.

## <div align="left">✨ Features

  - Detects all live devices on your subnet using arp-scan
  - Sends instant Telegram alerts for:
  - New devices connecting to the network
  - Known devices going offline
  - Maintains a log file for historical tracking
  - Stores known devices in a local file
  - DNS reverse lookup for hostname info
  - Cron-job compatible for background monitoring

## <div align="left">🚀 Installation

If you prefer to install dependencies manually:

```bash
# Clone the repository
git clone https://github.com/kithminaprasad/Live_Host_Discoverer.git
cd Live_Host_Discoverer

# Install required packages
sudo apt install arp-scan curl

# Make scripts executable
chmod +x scanner.sh

# Configure the Script
Edit the INTERFACE, SUBNET, and Telegram BOT_TOKEN and CHAT_ID in the script:
nano scanner.sh
```

📩 Telegram Integration
Create a Telegram bot:
 - Message @BotFather
 - Create a new bot and get the token
 - Get your chat ID via @userinfobot
 - Paste both into this script

```
# Run Live Host Discoverer

Manual scan:
sudo ./scanner.sh

Run every 1 minutes via cron:
crontab -e
* * * * * /path/to/scanner.sh
```

## 🖥️ Screenshots

![Screenshot (380)](https://github.com/user-attachments/assets/bcc5a5e2-7d7a-40f4-8780-834c27f1b7c6)

![Screenshot (381)](https://github.com/user-attachments/assets/5105324f-0861-4adc-8d65-d12948ea9ddc)

![Screenshot (382)](https://github.com/user-attachments/assets/8b9ab4c2-21ec-4e8a-b86a-b79ef26db733)

![Screenshot (384)](https://github.com/user-attachments/assets/5be0dfc6-b7c5-4d45-93b9-f3a9280577fe)

![Screenshot (383)](https://github.com/user-attachments/assets/b378fcbb-58c5-4847-9be0-49b49089aecd)


https://github.com/user-attachments/assets/4604a30a-adcf-42f5-8e95-42b9eca760eb



## <div align="left">📁 File Structure</div>

```
Live_Host_Discoverer/
├── scanner.sh           # Main scanner script
├── known_devices.txt    # List of previously discovered devices
├── netwatch.log         # Log file storing scan results
└── cron.log             # Log file for scheduled (cron) scan activities
```

## <div align="left">🔧 Dependencies</div>

| Dependency                                             | Purpose                                                                         |
| ------------------------------------------------------ | ------------------------------------------------------------------------------- |
| **`arp-scan`**                                         | Scans the local network to find live devices via ARP requests                   |
| **`curl`**                                             | Sends alerts to Telegram using the Bot API                                      |
| **`nmap`** *(optional)*                                | Perform detailed port scans or OS detection if integrated later                 |
| **`traceroute`** *(optional)*                          | Analyze network path (useful for advanced debugging)                            |
| **`figlet`**, **`lolcat`**, **`toilet`**               | Adds aesthetic banners and colorful output for better readability in terminal   |

## <div align="left">⚠️ Ethical Usage Warning</div>

NetScan Pro is designed for legitimate network administration, security assessment, and educational purposes. Always:

- **Obtain proper authorization** before scanning any network
- **Respect privacy** and data protection regulations
- **Use responsibly** and follow local laws regarding network scanning

Unauthorized scanning of networks may be illegal and unethical.

## <div align="left">🤝 Contributing</div>

Contributions to NetScan Pro are welcome! If you'd like to help improve this tool:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

<div align="left">
  <h4>Made with ❤️ for the security community. Stay Secure. Stay Informed. Happy Scanning!</h4>
</div>
