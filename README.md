## Commandant


---

### System Requirements

- Windows 11 24H2 Pro or something comparable

- You may need Administrator access - use of UAC is kept to a minimum

#### Notes:

This is my first powershell project, please open an issue if something doesn't work, and I'll accomodate as best I can.

Thank you to [Hayden Barnes](https://boxofcables.dev) for the guide on custom WSL kernels, allowing QEMU to be used in a container
No modification is made to the WSL2 Kernel included that is not described in the guide included. My build script can be found in [this repo](https://github.com/Deminarcis/WSL2-Kernel-KVM), the build included in this repo will be whatever is newest from Microsoft's sources based on the update of the other repo.

If installing this in a VM please use KVM/QEMU (Regular QEMU should be ok, Gnome Boxes and UTM should also work fine), Hyper-V or VMWare. Some features of the custom kernel offered in the installer will not work with Virtualbox as it does not properly support SLAT at time of writing.
