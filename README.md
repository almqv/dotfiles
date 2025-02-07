![Preview](preview.png)

## Stuff I use
 - **OS**: [Arch Linux](https://archlinux.org/)
 - **Kernel**: [lqx](https://liquorix.net/) *(standard linux as fallback)*
 - **WM**: [LeftWM](https://leftwm.org/)
 - **Terminal**: [Alacritty](https://github.com/alacritty/alacritty)
 - **Editor**: [Emacs](https://www.gnu.org/software/emacs/) or [nvim](https://neovim.io/)
 - **Compositor**: [picom](https://github.com/yshui/picom)
 - **Bar**: [eww](https://github.com/elkowar/eww)
 - **Launcher**: [rofi](https://github.com/davatorium/rofi)

## Installing dotfiles
`git clone git.wych.dev/repos/dotfiles.git && cd dotfiles`

Then use [stow](https://www.gnu.org/software/stow/) to create symlinks for each *dotfile*: `$ stow (stow options) (package)`
	
	-S, --stow 	: Install
	-D, --delete	: Uninstall
	Read more in the manual page for stow.
	$ man stow

**i.e.** `$ stow -S vim`

------------

## Darwin Configuration (nix-darwin + home-manager)
I use [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager). I suggest you do too. `stow` is fine until it isn't. 

If you want to try out my nix config, then you can do this:
```sh
darwin-rebuild switch --flake ~/.dotfiles/nix-darwin#exa
```
or 
```sh
darwin-rebuild switch --flake github:almqv/dotfiles/nix-darwin#exa
```

Be sure that your hostname is `exa` and your username is `elal`.

I suggest you change the above to **your** hostname and **your** username.
