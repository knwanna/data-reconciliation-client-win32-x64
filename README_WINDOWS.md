
# Data Reconciliation Client (Windows)

A **Windows desktop application** built with Electron.js for data reconciliation.  
This guide is focused on Windows users who want to either **run the app directly** or **build it from source**.

---

## 📦 Download & Run (Windows)

### Option 1: Run Portable EXE
1. Go to [Releases](https://github.com/knwanna/data-reconciliation-client-win32-x64/releases).
2. Download **`DataReconciliationClient.exe`** (portable version).
3. Double-click → App runs instantly (no install required).

### Option 2: Install via Setup
1. Download **`DataReconciliationClient Setup.exe`** from [Releases](https://github.com/knwanna/data-reconciliation-client-win32-x64/releases).
2. Run the installer.
3. Find **Data Reconciliation Client** in your Start Menu.

---

## 🛠️ Build from Source (Windows)

### Requirements
- [Node.js LTS](https://nodejs.org/) (≥ 18.x)
- npm (comes with Node.js)
- [Git](https://git-scm.com/)

### Clone & Install
```powershell
git clone https://github.com/knwanna/data-reconciliation-client-win32-x64.git
cd data-reconciliation-client-win32-x64
npm install
```

### Run in Development
```powershell
npm start
```

### Build Executable
```powershell
npm run dist
```

- Output will be inside the `dist/` folder:
  - Portable app: `dist/win-unpacked/DataReconciliationClient.exe`
  - Installer: `dist/DataReconciliationClient Setup.exe`

---

## 🔧 Reducing Build Size (Already Applied)

This app is packaged with **electron-builder** using:
- `asar` archive compression
- `npm prune --production`
- Windows distribution optimization

Final build size: ~60–80 MB.

---

## 🤝 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss.

---

## 📄 License
MIT
