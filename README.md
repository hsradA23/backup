# Simple Backup and restore scripts
Simple scripts to save selected files in a tarball and extract them in their original location
### Usage
To save the bashrc and neovim folder make a text file with the following contents:
file.txt
```
.bashrc
.config/nvim
```

To copy these files in a tarball run `./bk.sh file.txt` The tarball will be in the current directory.

To put the files in their original locations run `./rst.sh name-of-file.tar.gz`
