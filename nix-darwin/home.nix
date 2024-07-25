{ config, pkgs, ... }:

{
  home.username = "elal";
  home.homeDirectory = "/Users/elal";
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    alacritty
    neovim
    zsh
    oh-my-zsh
    skhd
    yabai
  ];

  programs.alacritty = {
    enable = true;
    # Add any Alacritty-specific configurations here
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    # Add any Neovim-specific configurations here
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
    };
    # Add any other Zsh-specific configurations here
  };

  home.file.".config/skhd/skhdrc".text = ''
    # Add your skhd keybindings here
  '';

  home.file.".config/yabai/yabairc".text = ''
    # Add your yabai configuration here
  '';

  # Optionally, you can add Homebrew integration if needed
  # homebrew = {
  #   enable = true;
  #   onActivation.autoUpdate = true;
  #   onActivation.cleanup = "zap";
  #   brews = [];
  #   casks = [];
  # };
}
