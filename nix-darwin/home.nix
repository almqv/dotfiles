{ config, pkgs, ... }:

{
  home.username = "elal";
  home.homeDirectory = "/Users/elal";
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  # Packages to install
  home.packages = with pkgs; [
    alacritty
    neovim
    yabai
    skhd
  ];

  # Yabai configuration
  services.yabai = {
    enable = true;
    extraConfig = ''
      yabai -m config mouse_follows_focus off
      yabai -m config focus_follows_mouse autoraise
      yabai -m config window_placement second_child
      yabai -m config window_topmost on
      yabai -m config window_shadow off
      yabai -m config window_opacity off
      yabai -m config window_border off
    '';
  };

  # skhd configuration
  services.skhd = {
    enable = true;
    extraConfig = ''
      # Example skhd configuration
      alt - e : echo "Hello world"
    '';
  };

  # Alacritty configuration
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Menlo";
          size = 12.0;
        };
      };
      window = {
        padding = {
          x = 2;
          y = 2;
        };
        dynamic_padding = false;
      };
      dynamic_title = true;
      scrollback = 10000;
    };
  };

  # Neovim configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
    extraConfig = ''
      " Example Neovim configuration
      set number
      syntax on
    '';
  };
}
