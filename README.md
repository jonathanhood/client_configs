# Configuration

This repository contains some configuration useful for both my mac and linux machines. The most important 
is my vim setup - which I never could get consistent between machines before making this repo.

To setup a new machine:

```bash
git clone https://github.com/jonathanhood/config.git
cd config
./pull_submodules.sh
./setup_system.sh
./install_software.sh
```

# Setting up GPG for Yubikey (Ubuntu 18.04)

First, make sure gpg is installed along with daemons needed for reading the yubikey as a smart card.

```
sudo apt install curl gnupg2 pcscd scdaemon
curl https://raw.githubusercontent.com/jonathanhood/config/master/7E4353E8981E46F94F197EA84FC4626078273D72.public.key | gpg --import
```

Now, edit `~/.gnupg/gpg-agent.conf" to contain the following contents:

```
default-cache-ttl 600
max-cache-ttl 7200
enable-ssh-support
```

Reload the gpg agent manually:

```
gpg-connect-agent reloadagent /bye
```

And add the following content to `~/.bashrc`:

```
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
```

