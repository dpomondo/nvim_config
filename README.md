```
./
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── after/
│   ├── config/
│   │   ├── keymaps.lua
│   │   ├── lazy_bootstrap.lua
│   │   ├── lazy_plugins.lua
│   │   └── options.lua
│   └── plugins/
│       ├── colors.lua
│       ├── lualine.lua
│       ├── nvim-lspconfig.lua
│       ├── nvim-treesitter.lua
│       ├── telescope.lua
│       └── which-keys.lua
└── README.md
```
## How and where we get our neovim:
Much of this has been stolen from install recipes found at:
    [https://github.com/nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
... and modified.
For `zshell` add this to your `zshrc` or else the comments act weird:
```
setopt interactivecomments
```


```
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

# nvim must corrupt ALL the vi instances!
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/nvim 500
sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/nvim 500
sudo update-alternatives --install /usr/bin/nvim nvim /usr/local/bin/nvim 500
```
