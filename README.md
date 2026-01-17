# Nobara Logo Plymouth Theme

![Nobara Logo Plymouth Preview](preview.png)

A clean and modern **Plymouth boot splash theme**, specifically designed for **Nobara Linux** and **Fedora**.

---

## ⚠️ WARNING

This theme and its installer are intended for **Nobara Linux and Fedora distributions ONLY**!  
Using it on other distributions is **not supported**.

---

## 🎨 Credits

This project is a **rebranded and modified version** of the original macOS Plymouth theme.

- **Original Script Logic:** Lozano Juan Pablo  
- **Nobara Adaptation:** hunorthman

---

## 📦 Installation

### Option A: Automatic Installation (Recommended)

1. Open a terminal in the theme directory
2. Make the script executable and run it:

    ```bash
    sudo chmod +x install.sh
    sudo ./install.sh
    ```

---

### Option B: Manual Installation

1. Copy the theme directory to the Plymouth themes folder:

    ```bash
    sudo cp -r nobara-logo /usr/share/plymouth/themes/
    ```

2. Set the theme as default and rebuild the initramfs:

    ```bash
    sudo plymouth-set-default-theme -R nobara-logo
    ```

3. If the logo does not appear, force a dracut rebuild:

    ```bash
    sudo dracut -f
    ```

---

## 🔧 Changes in This Version

- Replaced all macOS branding with **Nobara Linux** logos
- Optimized for **1920x1080 resolution**
- Renamed all internal references for a clean install
- Added an automated installation script for Fedora/Nobara

---

## 🔗 Links

- **KDE Store:**  
  https://store.kde.org/p/2342409
