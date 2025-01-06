# Fix Error while powering on: This host supports AMD-V, but AMD-V is disabled.

## 1. Ensure AMD-V (SVM) is enabled in the BIOS/UEFI
1. **Restart your computer** and enter the BIOS/UEFI setup. (Typically by pressing **F2**, **F10**, **Del**, or a similar key during boot—check your motherboard’s manual.)
2. Look for a setting related to virtualization support. It may be labeled:
   - **AMD-V**  
   - **SVM Mode**  
   - **Secure Virtual Machine**  
   - **Virtualization Technology**
3. **Enable** the setting if it is disabled.
4. **Save** your changes and **exit** the BIOS/UEFI.

> **Tip**: Some systems have multiple virtualization-related options. Make sure they are *all* set to “Enabled” if there’s more than one.

---

## 2. Fully power-cycle your system
1. After enabling AMD-V in BIOS, **shut down** your computer (not just a restart) to ensure all changes take effect.
2. **Wait a few seconds**, then power the system back on.

This full “power cycle” is sometimes necessary for virtualization settings to be recognized, especially if you just enabled them in BIOS.

---

## 3. Update system BIOS/firmware (if needed)
If you have an older BIOS version or suspect a firmware bug:
1. Visit your motherboard or system manufacturer’s website.
2. Check for a **BIOS update** that mentions improvements or fixes for virtualization or CPU features.
3. **Update** to the latest version (follow the manufacturer’s instructions carefully).

---

## 4. Check for Hyper-V or other conflicts in Windows (if using Windows host)
Sometimes, Microsoft Hyper-V (or other virtualization features) can interfere with VMware accessing AMD-V. On Windows 10 or 11, you may need to disable conflicting components:

1. **Disable Hyper-V** (if installed):
   - Go to **Control Panel** > **Programs** > **Turn Windows features on or off**  
   - **Uncheck** “Hyper-V” (both “Hyper-V Management Tools” and “Hyper-V Platform”)  
   - Click **OK** and **restart**.

2. **Disable additional virtualization features**:
   - In the same “Turn Windows features on or off” dialog:
     - **Uncheck** “Virtual Machine Platform”  
     - **Uncheck** “Windows Hypervisor Platform”  
   - Click **OK** and **restart**.

3. **Disable Memory Integrity (Core Isolation)** if applicable:
   - Open **Windows Security** > **Device Security** > **Core isolation details**  
   - Toggle **Memory Integrity** off if it’s on.  
   - **Restart** your system.

---

## 5. Confirm your CPU actually supports AMD-V
Most modern AMD CPUs have AMD-V (SVM). However, if your CPU is quite old, double-check that it supports hardware virtualization:
1. **Check your CPU’s model** (e.g., via **Task Manager** > **Performance** tab or CPU-Z).
2. Look up your CPU specifications on the manufacturer’s site to confirm **AMD-V** or **SVM** support.

---

## 6. Retest in VMware Player
1. Launch **VMware Player** again.
2. Try powering on the virtual machine.

If AMD-V is now enabled and there are no other conflicts, the VM should start without the previous error.

---

### Summary of the Key Steps
1. **Enable AMD-V (SVM) in BIOS/UEFI** and power-cycle.  
2. **Disable Hyper-V** and any other conflicting virtualization features in Windows.  
3. **Update BIOS** if out of date.  
4. **Check** that your CPU supports AMD-V.  

Following the above steps typically resolves the "AMD-V is disabled" error and allows VMware Player to run your virtual machines successfully.