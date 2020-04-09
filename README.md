# Initial Computer Setup
## Scripts
The following scripts are provided:
    - `elementary/setup.sh` this script installs some 
        - Theming and tweaking options for elementaryOS, 
        - basic energy management utilities for Lenovo Thinkpad, 
        - Firefox,
        - Back in Time.
    - `tools-ubuntu/setup-onedrive.sh` installs the onedrive client for Linux, that has to be configured later
    - `tools-ubuntu/dev-tools.sh` installs the latest versions of: 
        - basic binary building tools, 
        - Java, Maven, Git 
        - IntelliJ IDEA 
        - Visual Studio Code
        - PyCharm
## Misc
The script `misc-tools/get-package-ppa-list.sh` lists all the user-installed packages and their PPA's, useful to update the scripts in this repo.
## Configuration files / snippets
The file `config/fstab` contains an example of mount line for a properly configured NFS share.

Note that the mount point (in the example, `/media/timemachine-gabriel/`) has to belong to the user's group and have the appropriate permissions to be able to be mounted.

## Oh My Zsh
Aside from the existing scripts, don't forget installing Oh-My-Zsh!
```
sudo apt -y install curl git zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
