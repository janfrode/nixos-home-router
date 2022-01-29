with import <nixpkgs> {};

vim_configurable.customize {
    # Specifies the vim binary name.
    # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
    # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
    # https://www.mpscholten.de/nixos/2016/04/11/setting-up-vim-on-nixos.html
    name = "vi";
    vimrcConfig.customRC = ''
        set mouse=
        syntax enable
    '';
}
