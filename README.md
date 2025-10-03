## Device Specs

Model: Chromebook
RAM: 4 GB
Storage: 32 GB eMMC
CPU: Intel Celeron N4000
GPU: Intel UHD 600## System Goal

Use components that by default provide a dark theme, with low idle RAM usage and minimal configuration — avoiding both excessive tweaking and unnecessary bloat.

## System Philosophy

- Lightweight setup
- Very low idle RAM usage
- Minimal configuration overhead
- No unnecessary bloat
- be able to replicate this by just having a simple repo with some configs and a script that when i run it, it will basically clone my system

## Desktop Setup

Window Manager: openbox
Panel / Taskbar: tint2
Greeter: ly

## Taskbar Requirements

- Simple taskbar with:

  - Volume & Brightness controls (hover + scroll to adjust)
  - Icon-based status indicators
  - CPU usage
  - GPU usage
  - RAM usage
  - CPU temperature
  - Wi-Fi connectivity
  - Bluetooth status
  - Date & time

## Applications

- Discord
- Firefox
- VS Code (Microsoft)
- scrot

## Arch Install Steps

### Get arch iso
```bash
wget https://mirror.rackspace.com/archlinux/iso/latest/archlinux-x86_64.iso
```

flash to usb using balenaetcher, and when booted to live usb run arch install after connecting to internet using iwctl (use help after running iwctl incase forgor)

- Filesystem: f2fs
- Unified Kernel Image: Disabled
- Swap: zram enabled
- Profile: xorg
- Greeter: ly
- Graphics: Intel drivers
- Bluetooth: Enabled
- Audio: PipeWire
- Kernel: linux-lts
- Time Sync (NTP): Enabled

## Command after archinstall

```bash
sudo pacman -Syu base-devel git
```

### Clone repo

```bash
git clone https://github.com/ibrahimahtsham/arch-openbox.git
```
