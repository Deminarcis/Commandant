## Commandant
---
### System Requirements

- Windows 11 25H2 Pro or something comparable
- You may need Administrator access for some features but 99% of the time you won't need it.

#### Notes:

This is my first powershell project, please open an issue if something doesn't work, and I'll accomodate as best I can.

Thank you to [Hayden Barnes](https://boxofcables.dev) for the guide on custom WSL kernels, allowing QEMU to be used in a container
No modification is made to the WSL2 Kernel included that is not described in the guide included. My build script can be found in [this repo](https://github.com/Deminarcis/WSL2-Kernel-KVM), the build included in this repo will be whatever is newest from Microsoft's sources based on the update of the other repo.
The custom kernel should no longer be needed as insmod and modprobe are now available in the WSL2 kernel. However this is still included and maintained for those who want to use it.

If installing this in a VM please use KVM/QEMU (Regular QEMU should be ok, Gnome Boxes and UTM should also work fine), Hyper-V or VMWare. Some features of the custom kernel offered in the installer will not work with Virtualbox as it does not properly support SLAT.
