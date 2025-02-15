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

  imports = [
    # Modules
    ./modules/skhd.nix
  ];

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
    discord
    gimp
    vscode
    gtkwave
    gephi

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

    # rust
    rustc
    rustup

    # js/ts/node/web
    nodejs_22
    nodePackages.pnpm

    # vhdl
    vhdl-ls

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

    # formatters
    shfmt
    nodePackages.prettier
    black
    clang-tools # clang-format
    nixpkgs-fmt
    stylish-haskell

    # DE/WM/Ricing
    # yabai # wm
    skhd  # key mngr
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

        # Super hacky and fucking stupid way of doing things - stuff
        # export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
        # export LDFLAGS="-L/opt/homebrew/opt/llvm/lib $LDFLAGS"
        # export CPPFLAGS="-I/opt/homebrew/opt/llvm/include $CPPFLAGS"
        # export DYLD_LIBRARY_PATH="/opt/homebrew/opt/llvm/lib:$DYLD_LIBRARY_PATH"

        # Nix
        if [ -e /etc/profile.d/nix.sh ]; then . /etc/profile.d/nix.sh; fi

        # TERM
        export TERM=xterm-xfree86
      '';
    };
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "xterm-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-s";
    keyMode = "vi";
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.cpu;
        extraConfig = ''
          set-option -g status-interval 1
          set-option -g status-right "#[fg=green,bg=default,bright]#{cpu_bg_color}#{cpu_percentage} "
        '';
      }
    ];
    extraConfig = ''
      set -g default-command "${pkgs.zsh}/bin/zsh"

      # Reload config with prefix + r
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      # Vim-like pane navigation
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Split panes using h and v
      unbind '"'
      unbind %
      bind å split-window -h
      bind ä split-window -v 

      # Status bar configuration
      set-option -g status on
      set-option -g status-justify centre
      set-option -g status-keys vi
      set-option -g status-position bottom
      set-option -g status-style fg=colour136,bg=colour235
      set-option -g status-left-length 20
      set-option -g status-left-style default
      set-option -g status-left "#[fg=green,bright]#(whoami)#[default]"
      set-option -g status-right-length 140
      set-option -g status-right-style default
      
      # Window status styling
      set-window-option -g window-status-style fg=colour244,bg=default
      set-window-option -g window-status-current-style fg=colour166,bg=default

      # Truecolor support
      set-option -sa terminal-overrides ",xterm*:Tc"
    '';
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
