# LineageOS / AOSP Device Tree for Realme P3 5G (dongfeng)

[![Device](https://img.shields.io/badge/Device-Realme_P3_5G_(dongfeng)-2563EB?style=for-the-badge&logo=android&logoColor=white)](https://github.com/zacxyonly/android_device_realme_dongfeng)
[![SoC](https://img.shields.io/badge/SoC-Qualcomm_Snapdragon_6_Gen_4-EA580C?style=for-the-badge&logo=qualcomm&logoColor=white)](https://www.qualcomm.com/)
[![Kernel](https://img.shields.io/badge/Kernel-Linux_6.1_GKI_2.0-16A34A?style=for-the-badge&logo=linux&logoColor=white)](https://github.com/zacxyonly/zerobyte-kernel)
[![Recovery](https://img.shields.io/badge/Recovery-TWRP_%26_OrangeFox-F97316?style=for-the-badge&logo=git&logoColor=white)](https://github.com/zacxyonly/recovery_realme_RMX5079)
[![License](https://img.shields.io/badge/License-Apache_2.0-DC2626?style=for-the-badge)](LICENSE)

Official standard **LineageOS 21 (Android 14) / LineageOS 22 (Android 15)** device tree repository for **Realme P3 5G** (`RMX5079`, codename: `dongfeng` / platform: `volcano`).

---

## 📱 Device Specifications

| Attribute | Specification |
|:---|:---|
| **Device** | Realme P3 5G |
| **Model** | `RMX5079` |
| **Codename** | `dongfeng` |
| **Board Platform** | Qualcomm `volcano` (`SM6650`, 4nm) |
| **CPU Architecture** | ARM64-v8a (Cortex-A76 performance + Cortex-A55 efficiency) |
| **GPU** | Adreno GPU |
| **Display** | 1080 x 2400 (FHD+ AMOLED, 120Hz refresh rate) |
| **Kernel Version** | Linux 6.1 GKI 2.0 (`android14-6.1`) |
| **Storage Architecture** | Virtual A/B (VAB) with Dynamic Partitions (Super 9.1GB) |
| **Encryption Type** | File-Based Encryption v2 (FBE v2) + WrappedKey |
| **Stock OS** | Realme UI 5.0 / 6.0 (Android 14 / 15) |

---

## 🏗️ Building LineageOS from Source

### 1. Initialize Manifest & Sync
In your ROM build directory:

```bash
mkdir -p ~/lineage && cd ~/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 2. Clone Device Tree & Dependencies
Clone the device tree into `device/realme/dongfeng`:

```bash
git clone https://github.com/zacxyonly/android_device_realme_dongfeng.git device/realme/dongfeng
git clone https://github.com/zacxyonly/zerobyte-kernel.git kernel/realme/sm6650
```

### 3. Extract Proprietary Blobs
Connect your Realme P3 5G with ADB enabled, or extract from dumped stock firmware partitions:

```bash
cd device/realme/dongfeng
./extract-files.sh
```

### 4. Build the ROM
```bash
source build/envsetup.sh
lunch lineage_dongfeng-userdebug
mka bacon -j$(nproc --all)
```

---

## 🚀 Flashing Instructions (Post-UBL)

Once bootloader is unlocked via Realme Deep Testing:

```bash
# 1. Boot to bootloader
adb reboot bootloader

# 2. Flash recovery
fastboot flash recovery recovery.img

# 3. Boot recovery
fastboot reboot recovery

# 4. In OrangeFox / TWRP:
#    - Wipe Dalvik / ART Cache, Data, Metadata
#    - Flash lineage-21.0-xxxx-dongfeng.zip
#    - Reboot to System
```

---

## 🔗 Related Projects

- **Custom Recovery (TWRP / OrangeFox)**: [recovery_realme_RMX5079](https://github.com/zacxyonly/recovery_realme_RMX5079)
- **Custom Kernel (GKI 2.0 / KernelSU-Next)**: [zerobyte-kernel](https://github.com/zacxyonly/zerobyte-kernel)
