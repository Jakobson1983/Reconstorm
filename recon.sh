#!/bin/bash

# RECONSTORM v1.0 - All-in-One Reconnaissance Script
# Author: @Jakobson1983
# Usage: ./recon.sh <target>

# ---------------------
# CONFIG
# ---------------------
TARGET=$1
OUTDIR="reconstorm_results_$TARGET"
WORDLIST="/usr/share/wordlists/dirb/common.txt"

# ---------------------
# Check dependencies
# ---------------------
for tool in nmap whatweb nikto gobuster sslscan feroxbuster; do
    if ! command -v $tool &> /dev/null; then
        echo "[!] Tool not found: $tool"
        exit 1
    fi
done

# ---------------------
# Input validation
# ---------------------
if [ -z "$TARGET" ]; then
    echo "Usage: $0 <IP or domain>"
    exit 1
fi

mkdir -p "$OUTDIR"
echo "[*] Starting reconnaissance on $TARGET"

# ---------------------
# Nmap Scan
# ---------------------
echo "[*] Running Nmap..."
nmap -sC -sV -oN "$OUTDIR/nmap.txt" "$TARGET"

# ---------------------
# WhatWeb
# ---------------------
echo "[*] Running WhatWeb..."
whatweb "$TARGET" > "$OUTDIR/whatweb.txt"

# ---------------------
# Nikto
# ---------------------
echo "[*] Running Nikto..."
nikto -h "$TARGET" > "$OUTDIR/nikto.txt"

# ---------------------
# SSLScan (if port 443 open)
# ---------------------
echo "[*] Running SSLScan on port 443..."
sslscan "$TARGET":443 > "$OUTDIR/sslscan.txt"

# ---------------------
# Gobuster (HTTP)
# ---------------------
echo "[*] Running Gobuster (HTTP)..."
gobuster dir -u http://$TARGET -w "$WORDLIST" -o "$OUTDIR/gobuster-http.txt"

# ---------------------
# Feroxbuster (recursive)
# ---------------------
echo "[*] Running Feroxbuster..."
feroxbuster -u http://$TARGET -w "$WORDLIST" -o "$OUTDIR/feroxbuster.txt"

# ---------------------
echo "[*] Recon complete. Results saved in $OUTDIR/"
