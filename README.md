## Commandant



---

~~Consider this initial upload alpha quality. It works eventually but needs some more work to be complete~~

This tool is inspired by Commando VM. But acts more as a companion to an existing OS install rather than a full installation by itself

#### Why make this?

Boredom mostly. As a hacker who uses multiple Operating Systems I wanted something simple that would meet my needs, but also be flexible and available

---

### System Requirements

- Windows 11 22H2 Pro (or something that can install WLS2 GA from the MS store) Or macOS 13 (tested on an intel Mac)

- Administrator access

- Powershell or zsh

- Preferably 8GB+ of RAM (tested with 8GB, 4GB should do according to the task manager), but best not to thin provision your host.

- HDD/SSD space will be determined by how much you install, I haven't tested, although I would expect 10-15GB to be enough to get started

- An account that signs into the MS Store if you are on Windows (having the account signed in to apps but not the system works just fine). You need to install [App Installer](https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-au&gl=au&rtc=1) from MS Store before running this script

#### Notes:

This is my first powershell project, please open an issue if something doesn't work, and I'll accomodate as best I can.

Thank you to [Hayden Barnes](https://boxofcables.dev) for the guide on custom WSL kernels, allowing QEMU to be used in a container
No modification is made to the WSL2 Kernel included that is not described in the guide included. I have included my build script from [my other repo](https://github.com/Deminarcis/WSL2-Kernel-KVM), the build included in this repo will be whatever is newest from Microsoft's sources.

If installing this in a VM please use KVM/QEMU (Regular QEMU should be ok, Gnome Boxes and UTM should also work fine), Hyper-V or VMWare. This will not work in VirtualBox 7 at time of writing. You will also need nesting/SLAT enabled to use this script.
It will install fine but the containers will not load if the hypervisor does not support nesting or SLAT