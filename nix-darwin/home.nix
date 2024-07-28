{ config, pkgs, ... }:

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

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  imports = [
    # Modules
    ./modules/yabai.nix
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

    # Utils 
    stow
    curl
    wget
    ffmpeg
    gnupg
    jq
    tmux
    htop
    ripgrep
    sshfs

    # Cringe
    pfetch
    neofetch

    # Tools 
    nmap
    dig

    # Development stuff
    gh

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

    # golang
    go 

    # lua <3 (divine intellect)
    lua

    # ruby
    ruby

    # julia
    julia_19-bin # compat 

    # py
    python3
    python312Packages.pip

    # formatters
    shfmt
    nodePackages.prettier
    black
    clang-tools # clang-format
    nixpkgs-fmt
    stylish-haskell

    # DE/WM/Ricing
    yabai # wm
    skhd  # key mngr

    # Fonts 
    nerdfonts
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.

    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/elal/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
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
    };
    initExtra = ''
      # Function to check if we're in a nix-shell
      in_nix_shell() {
        if [ -n "$IN_NIX_SHELL" ]; then
          echo "(devenv) "
        fi
      }
      
      # Set the prompt
      setopt PROMPT_SUBST
      export PS1='$(in_nix_shell)$(PS1)'
    '';
    oh-my-zsh = {
      enable = true;
      theme = "half-life";
      plugins = [ "git" "macos" ];
      extraConfig = ''
        # Homebrew
        export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

        # Scripts path 
        export PATH="$HOME/.scripts:$PATH"

        # Nix
        if [ -e /etc/profile.d/nix.sh ]; then . /etc/profile.d/nix.sh; fi

        # TERM
        export TERM=xterm-xfree86
      '';
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Hack Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Hack Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Hack Nerd Font";
          style = "Italic";
        };
        size = 12;
      };
      window = {
        padding = {
          x = 8;
          y = 8;
        };
      };
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
