{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "elal";
  home.homeDirectory = "/Users/elal";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # Programs
    slack
    zathura
    irssi
    spotify
    gimp
    vscode
    gephi
    presenterm

    # Utils 
    coreutils # *happy rms noises*
    stow
    curl
    wget
    ffmpeg
    gnupg
    jq
    # tmux
    htop
    ripgrep
    sshfs
    libqalculate
    imagemagick
    figlet
    tree

    # Deps needed to build stuff
    or-tools
    gnumake
    cmake
    swig4
    boost
    libtorch-bin
    texliveMedium

    # fucking stupid compat workarounds
    qemu
    libvirt
    virt-manager

    # compiler stuff
    llvm
    libllvm

    # Simulators
    # ngspice

    # Cringe
    pfetch
    neofetch

    # Tools 
    nmap
    dig
    verilator

    # Development stuff
    gh
    docker

    # c/c++
    # gcc
    clang

    # haskell
    ghc
    haskell-language-server
    haskellPackages.cabal-install
    haskellPackages.stack

    # nix
    nixd
    nixfmt-rfc-style

    # rust
    rustc
    rustup

    # js/ts/node/web
    nodejs_22
    nodePackages.pnpm

    # chip dev
    vhdl-ls # vhdl
    verible # SV
    # gtkwave
    surfer

    # golang
    go 

    # lua <3 (divine intellect)
    lua

    # ruby
    ruby

    # julia
    julia-bin
    # julia_19-bin # compat 

    # py
    python3
    python312Packages.pip

    # Scala
    # metals  # handled by coursier
    scalafmt
    sbt
    coursier
    jdk
    scala-cli
    bloop

    # formatters
    shfmt
    nodePackages.prettier
    black
    clang-tools # clang-format
    nixpkgs-fmt
    stylish-haskell

    # DE/WM/Ricing
    # yabai # wm
    # skhd  # key mngr
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
    LIBTORCH = "${pkgs.libtorch-bin}/lib";
  };

  # Link apps to ~/Applications/Nix
  home.activation = {
    linkApps = lib.hm.dag.entryAfter [ "checkLinkTargets" ] ''
      mkdir -p ~/Applications/Nix
      for app in ~/.nix-profile/Applications/*.app; do
        ln -sf "$app" ~/Applications/Nix/
      done
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    userName = "Elias Almqvist";
    userEmail = "elalmqvist@gmail.com";
    lfs.enable = true;
    ignores = [
      ".dir-locals.el"
      ".envrc"
      ".DS_Store"
    ];
    signing.signByDefault = true;
    signing.key = "E31A99CE3E75A158";
    extraConfig = {
      commit.gpgsign = true;
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      dev = "cd $HOME/Projects/almtech/exa/";
      xcopy = "pbcopy";
      xpaste = "pbpaste";
      ccd = "echo $PWD | xcopy";
      cr = "cd $(git rev-parse --show-toplevel)";
      nd = "nix develop -c $SHELL";
      ls = "ls --color";
      tmux = "tmux -2";
      py = "python";
      drs = "darwin-rebuild switch --flake $HOME/.dotfiles/nix-darwin";
    };
    oh-my-zsh = {
      enable = true;
      theme = "half-life";
      plugins = [ "git" "macos" ];
      extraConfig = ''
        # Homebrew
        export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

        # Scripts path 
        export PATH="$HOME/.scripts:$PATH"

        # User bin 
        export PATH="$HOME/.local/bin:$PATH"

        # GHCup
        export PATH="$PATH:$HOME/.ghcup/bin"

        # CS (Scala)
        export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

        # Nix
        if [ -e /etc/profile.d/nix.sh ]; then . /etc/profile.d/nix.sh; fi

        # TERM
        export TERM=xterm-xfree86

        # Source .env file for environment variables
        if [ -f "$HOME/.env" ]; then
          source "$HOME/.env"
        fi
      '';
    };
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "xterm-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "s"; 
    keyMode = "vi";
    historyLimit = 5000;

    extraConfig = ''
      set -g default-command "${pkgs.zsh}/bin/zsh"

      # Start window numbering at 1
      set -g base-index 1

      # Reload config with prefix + r
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Custom prefix bindings
      bind-key ö last-window
      bind-key e send-prefix

      # Vim-like pane navigation
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Split panes using Swedish keys
      unbind '"'
      unbind %
      bind å split-window -h
      bind ä split-window -v

      # Status bar configuration (overwritten)
      set-option -g status on
      set-option -g status-position bottom
      set-option -g status-bg colour234
      set-option -g status-fg colour137
      set-option -g status-left ""
      set-option -g status-right "#[fg=colour233,bg=colour241,bold] %Y-%m-%d #[fg=colour233,bg=colour245,bold] %H:%M:%S "
      set-option -g status-right-length 50
      set-option -g status-left-length 20

      # Window status styling (overwritten)
      set-window-option -g window-status-current-format " #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F "
      set-window-option -g window-status-format " #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F "

      # Truecolor support
      set-option -sa terminal-overrides ",xterm*:Tc"
    '';
  };

  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = false;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
    };
    extraConfig = ''
      syntax on
      set background=dark
      colorscheme slate

      set mouse=a
      set autoindent
      set smartcase
      set smartindent
      set ignorecase
      set hlsearch
      set wrap
    '';
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = false;
    defaultEditor = true;
  };
}
