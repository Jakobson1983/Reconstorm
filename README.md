# RECONSTORM 🔍⚡

**All-in-One Reconnaissance Script for Pentesters & Bug Bounty Hunters**  
Automates web & network reconnaissance in one command using Bash.

![License](https://img.shields.io/badge/license-MIT-green) ![Status](https://img.shields.io/badge/status-active-brightgreen) ![Made with](https://img.shields.io/badge/made%20with-Bash-blue)

---

## 📌 Features
- **One command, full recon** – no need to run tools one by one
- Combines:
  - [Nmap](https://nmap.org/) – service & version detection
  - [WhatWeb](https://github.com/urbanadventurer/WhatWeb) – technology fingerprinting
  - [Nikto](https://cirt.net/Nikto2) – web vulnerability scanning
  - [Gobuster](https://github.com/OJ/gobuster) – directory brute-forcing
  - [SSLScan](https://github.com/rbsec/sslscan) – SSL/TLS configuration scanning
  - [Feroxbuster](https://github.com/epi052/feroxbuster) – recursive content discovery
- Saves all results in one organized folder

---

## 🚀 Installation

Clone this repository:

```bash
git clone https://github.com/Jacobson1983/RECONSTORM.git
cd RECONSTORM
chmod +x recon.sh

Make sure required tools are installed:

sudo apt install nmap whatweb nikto gobuster sslscan feroxbuster

⚡ Usage
Basic usage:

./recon.sh <target>
Example:

./recon.sh 10.10.10.10
Results will be saved in:

php-template

reconstorm_results_<target>/

📂 Example Output Structure

reconstorm_results_10.10.10.10/
├── nmap.txt
├── whatweb.txt
├── nikto.txt
├── sslscan.txt
├── gobuster-http.txt
└── feroxbuster.txt

⚠️ Disclaimer
This tool is for educational purposes only.
Do not use it against systems without explicit authorization.

