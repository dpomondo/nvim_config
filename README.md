```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── after/
│   ├── config/
│   │   ├── colors.lua
│   │   ├── keymaps.lua
│   │   ├── lazy_bootstrap.lua
│   │   ├── lazy_plugins.lua
│   │   └── options.lua
│   └── plugins/
│       └── lualine.lua
└── README.md
```
### How and where we get our neovim:
```
# stolen from install recipies found at:
#   https://github.com/nvim-lua/kickstart.nvim and modified
# ... and modified

# download the latest nightly:
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
```
### Give neovim a new home:
```
# the following may be required, depending on whether there is a previous install or not
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64

# extract 
#   -x  ##  extract
#   -z  ##  use gzip to decompress
#   -v  ##  be verbose!
#   -f  ##  next argument is the file to extract
#   -C  ##  the location for the extraction
#           note: default tar behavior is to overwrite files at the location
sudo tar -C /opt -xzvf nvim-linux64.tar.gz
```
### Make neovim accessible:
```
# place it in the $PATH by linking it to /usr/local/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
