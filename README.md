## System Goal

Use components that by default provide a dark theme, with low idle RAM usage and minimal configuration — avoiding both excessive tweaking and unnecessary bloat.

## System Philosophy

* Lightweight setup
* Very low idle RAM usage
* Minimal configuration overhead
* No unnecessary bloat

## Device Specs

Model: Chromebook
RAM: 4 GB
Storage: 32 GB eMMC
CPU: Intel Celeron N4000
GPU: Intel UHD 600

## Arch Install Steps

* Filesystem: f2fs
* Unified Kernel Image: Disabled
* Swap: zram enabled
* Profile: xorg
* Greeter: ly
* Graphics: Intel drivers
* Bluetooth: Enabled
* Audio: PipeWire
* Kernel: linux-lts
* Time Sync (NTP): Enabled

## Desktop Setup

Window Manager: openbox
Panel / Taskbar: tint2
Greeter: ly

## Taskbar Requirements

* Simple taskbar with:

  * Volume & Brightness controls (hover + scroll to adjust)
  * Icon-based status indicators
  * CPU usage
  * GPU usage
  * RAM usage
  * CPU temperature
  * Wi-Fi connectivity
  * Bluetooth status
  * Date & time

## Planned Applications

* Discord
* Firefox
* VS Code
