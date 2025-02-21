# detectOSo

A simple Bash script to check if an IP address is online and determine its operating system based on the TTL value.

## 🚀 Features
- Checks if a given IP address is **reachable**.
- Determines the **likely OS** (Linux, Windows, or Unknown) based on the TTL value.
- Provides **colored output** for better readability.
- Handles **invalid input formats** and missing arguments gracefully.
- Includes **Ctrl+C handling** to exit cleanly.

---

## 📌 Usage
### **Basic Command**
```bash
./detectOSo.sh <IP-Address>
```

### **Example**
```bash
./detectOSo.sh 192.168.1.1
```

---

## 🎨 Output Example

### ✅ **Host is Up (Linux)**
```bash
[+] 192.168.1.1 - UP
[+] TTL: 64 - Linux/Unix
```

### ✅ **Host is Up (Windows)**
```bash
[+] 10.0.0.5 - UP
[+] TTL: 128 - Microsoft Windows
```

### ❌ **Host is Down**
```bash
[!] 192.168.1.250 - DOWN or Blocking ICMP Probes
```

---

## 🔧 How It Works
1. **Sends a single ICMP ping (`ping -c 1`)** to the specified IP.
2. **Extracts the TTL value** from the response.
3. **Classifies the OS** based on TTL values:
   - **0-64** → **Linux/Unix**
   - **65-128** → **Microsoft Windows**
   - **129+** → **Unknown OS**
4. **Handles errors** (invalid input, no response, etc.).
5. **Prints results in color-coded format**.

---

## ⚠️ Requirements
- **Linux/macOS** (or a system with Bash & `ping` command).
- `figlet` and `lolcat` (for banner display):
  ```bash
  sudo apt install figlet lolcat  # Debian-based
  sudo pacman -S figlet lolcat    # Arch-based
  brew install figlet lolcat      # macOS
  ```

---

## 🆘 Help Panel
If you forget how to use the script, just run:
```bash
./detectOSo.sh
```
It will show:
```
[!] Usage: ./detectOSo.sh <IP-Address>
[!] Example: ./detectOSo.sh 192.168.1.1
[+] Description: This script checks if an IP is up and determines OS based on TTL.
```

---

## 🛠️ Customization
- Modify the **TTL detection logic** if you want finer OS categorization.
- Change **color variables** to fit your terminal theme.
- Add more **error handling** if needed.

---

## 📜 License
This script is open-source. Feel free to modify and distribute it!

---

## 🧑‍💻 Author
**Samuel Laveau (aka Ne4rby)**  
🔗 [GitHub](https://github.com/ne4rby)
