# Setup Scripts for Linux
Install scripts for all the tools I need to get a usable system for my workflows right after installing Linux. 

This repository currently covers Ubuntu-derivated distributions, with some specifics for **elementary OS** and **Thinkpad laptops**.

## Quick Start
These scripts will ask for your password in systems with `sudo`, so please review the files before executing them.

After cloning the repository, you may still have to give the scripts the appropriate permissions to execute. You can do it recursively for your own user by executing the following in the terminal:

```
git clone https://github.com/gvisoc/linux-setup
cd linux-setup
find . -name "*.sh" -type f -exec chmod u+x {} \;
```

## Scripts
The goal of the following scripts are to be self contained and independent betwen each other. There is no issue for having scripts that install the same tools, if they were already installed they would be updated.

The following scripts are provided:
- `elementary/tweaks-setup.sh` -- this script is specific for **elementary OS**, and installs: 
    - Theming and tweaking options for elementary OS.
- `ubuntu/user-misc.sh` -- installs some personal utilities like:
    - Firefox,
    - Back in Time, 
    - `xclip` and `xsel`,
    - Notable (note taking app --see https://notable.md)
- `ubuntu/setup-onedrive.sh` -- installs a Microsoft OneDrive client for Linux:
    - Git,
    - Binary build tools,
    - Dlang compilers,
    - Dependencies for the **OneDrive Free Client** for Linux, 
    - builds **OneDrive Free Client** for Linux from [its Git Repository](https://github.com/abraunegg/onedrive.git).
- `ubuntu/java-tools.sh` -- installs the latest versions of: 
    - Git,
    - OpenJDK Java 11 (LTS version),
    - Maven,
    - Jetbrains IntelliJ IDEA,
    - Visual Studio Code,
- `ubuntu/python-tools.sh` -- sets up the following:
    - Git, 
    - Python 3*, Pip for Python 3, and security / keyring access modules for Python 3,
    - Jetbrains PyCharm,
    - updates pip, using pip for Python 3, for the current user,
    - venv (included nowadays for any Python 3.3+),
    - Visual Studio Code
- `ubuntu/thinkpad/setup-energy.sh`
    - basic energy management utilities for Lenovo Thinkpad under Ubuntu or derivates.
    - This is **specific for Thinkpad laptops** and comes without warranty (see [LICENSE](LICENSE)).
- `ubuntu/misc/get-package-ppa-list.sh` lists all the user-installed packages updatedt
heir PPA's, useful to update the scripts in this repository.

(*): Python 3 is installed via `apt -y install python3`. `python3` is a metapackage that will install the latest Python 3 available in your software sources. For LTS Ubuntu distributions, or forks from Ubuntu LTS like elementary OS, such version is 3.6.x, while the latest stable Python version may be 3.8.x or greater.



## Configuration files / snippets
The file `config/fstab` contains an example of mount line for a properly configured NFS share. This is a useful and simple setup for Back In Time when we don't have a proper SSH server (as in the Synology NAS with modern versions of DiskStation).

Note that the mount point (in the example, `/media/backup/`) has to belong to the users' group and have the appropriate permissions to be able to be mounted and written.

## Oh My Zsh
Aside from the existing scripts, consider installing [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh)
