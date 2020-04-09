# Initial Computer Setup
## Scripts
The following scripts are provided:
- `elementary/setup.sh` this script is specific for **elementary OS**, and installs some 
    - Theming and tweaking options for elementary OS, 
    - basic energy management utilities for Lenovo Thinkpad, 
    - Firefox,
    - Back in Time, 
    - `xclip` and `xsel`.
- `tools-ubuntu/setup-onedrive.sh` installs:
    - Git,
    - Binary build tools,
    - Dlang compilers,
    - Dependencies for the **OneDrive Free Client** for Linux, 
    - builds **OneDrive Free Client** for Linux from [its Git Repository](https://github.com/abraunegg/onedrive.git).
- `tools-ubuntu/java-tools.sh` installs the latest versions of: 
    - Java, Maven, Git ,
    - IntelliJ IDEA,
    - Visual Studio Code,
- `tools-ubuntu/python-rools.sh` sets up the following:
    - Git, Python3, Pip for Python3, and security / keyring access modules,
    - PyCharm,
    - updates pip using pip for Python 3, for the current user,
    - venv is included nowadays (Python 3.3+),
    - Visual Studio Code

The goal of the tools scripts are to be self contained and independent betwen each other. There is no issue for having scripts that install the same tools, if they were already installed they would be updated.

## Misc
The script `misc-tools/get-package-ppa-list.sh` lists all the user-installed packages updatedt
heir PPA's, useful to update the scripts in this repo.

## Configuration files / snippets
The file `config/fstab` contains an example of mount line for a properly configured NFS share. This is a useful and simple setup for Back In Time when we don't have a proper SSH server (as in the Synology NAS with modern versions of DiskStation).

Note that the mount point (in the example, `/media/timemachine-gabriel/`) has to belong to the user's group and have the appropriate permissions to be able to be mounted.

## Oh My Zsh
Aside from the existing scripts, don't forget installing Oh-My-Zsh!
```
sudo apt -y install curl git zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```