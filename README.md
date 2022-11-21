## Commandant

It's not Commando-vm but it might be close..... one day

---

Consider this initial upload alpha quality. It works eventually but needs some more work to be complete

This tool is very much insipred by Commando, attempting to fill the void in my heart while Commando undergoes some major changes (will they ever release again? I'm not sure, their install scripts dont work out for me).

I wrote this tool for a job and the employer was nice enough to let me publically host this script. It is by no means complete or good, but I hope you find some use in it. Even if it's a quick way to provision windows 11 as an attack box. Feel free to fork or contribute.

#### Why make this?

Because Flare and Commando have failed to install so many times that i'm not sure whether i'm stupid or they are actually broken

---

### SysReq

- Windows 11 22H2 Pro or something similar

- Administrator access

- Powershell - The one included in Windows will do fine

- Preferably 8GB+ of RAM (tested with 8GB, 4GB should do accordin to taskmanager)

- HDD/SSD space will be determined by how much you install, I havent tested but i'd expect 10-15GB to be enough (probably way too much)

- A MS Account that signs into the MS Store (havin the account sign into apps but not the system works just fine)

#### Notes:

This is my first powershell project, please open an issue if something doesnt work and i'll accomodate as best I can.

This tool has not been thoroughly tested but should work anywhere you can get WSL2 and WSLg on Windows. **In theory** Windows 10 21H1 or newer should work.
