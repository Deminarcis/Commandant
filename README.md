## Commandant

It's not Commando-vm but it might be close..... one day

---

Consider this initial upload alpha quality. It works eventually but needs some more work to be complete

This tool is very much insipred by Commando, attempting to fill the void in my heart while Commando undergoes some major changes (will they ever release again? I'm not sure, their install scripts dont work out for me).

I wrote this tool for a job and the employer was nice enough to let me publically host this script. It is by no means complete or good, but I hope you find some use in it. Even if it's a quick way to provision windows 11 as an attack box. Feel free to fork or contribute.

#### Why make this?

Because Flare and Commando have failed to install so many times that i'm not sure whether I'm stupid or they are actually broken

---

### SysReq

- Windows 10/11 22H2 Pro or something that can install WLS2 GA from the store or web

- Administrator access

- Powershell - The one included in Windows will do fine

- Preferably 8GB+ of RAM (tested with 8GB, 4GB should do accordin to taskmanager)

- HDD/SSD space will be determined by how much you install, I havent tested but i'd expect 10-15GB to be enough (probably way too much)

- A MS Account that signs into the MS Store (havin the account sign into apps but not the system works just fine)

- You need to install [App Installer](https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1?hl=en-au&gl=au&rtc=1) from MSStore before running this script

#### Notes:

This is my first powershell project, please open an issue if something doesnt work and i'll accomodate as best I can.

Thank you to [Hayden Barnes](https://boxofcables.dev) for the guide on custom WSL kernels, allowing QEMU to be used in a container
No moification is made to the WSL2 Kernel included that is not described in the guide included.