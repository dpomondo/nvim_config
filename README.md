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
How and where we get our neovim:
```
# download the latest nightly:
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

# extract 
#   -x  ##  extract
#   -z  ##  use gzip to decompress
#   -v  ##  be verbose!
#   -f  ##  next argument is the file to extract
#   -C  ##  the location for the extraction
            note: default tar behavior is to overwrite files at the location
sudo tar -C /opt -xzvf nvim-linux64.tar.gz

```
