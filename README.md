## Commandant

It's not Commando-vm but it might be close..... one day

---

~~Consider this initial upload alpha quality. It works eventually but needs some more work to be complete~~

This tool is insipred by Commando VM. But acts more as a companion to an existing windows install rather than a full install by itself

#### Why make this?

Because Flare and Commando have failed to install so many times that i'm not sure whether I'm stupid or they are actually broken. Also this has allowed me to get acclimated with learning Powershell (My daily driver is Linux)

---

### System Requirements

- Windows 11 22H2 Pro or something that can install WLS2 GA from the MS store

- Administrator access

- Powershell - The one included in Windows will do fine, this script will install the latest one for you

- Preferably 8GB+ of RAM (tested with 8GB, 4GB should do according to taskmanager), but best not to thin provision your host.

- HDD/SSD space will be determined by how much you install, I havent tested but i'd expect 10-15GB to be enough to get started

- A MS Account that signs into the MS Store (having the account sign into apps but not the system works just fine)

- You need to install [App Installer](https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-au&gl=au&rtc=1) from MS Store before running this script

#### Notes:

This is my first powershell project, please open an issue if something doesnt work and i'll accomodate as best I can.

Thank you to [Hayden Barnes](https://boxofcables.dev) for the guide on custom WSL kernels, allowing QEMU to be used in a container
No moification is made to the WSL2 Kernel included that is not described in the guide included. I have included my build script from [my other repo](https://github.com/Deminarcis/WSL2-Kernel-KVM), the build included in this repo will be whatever is newest from Microsoft's sources.