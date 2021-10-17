{ config, pkgs, ... }:

let
  nigpkgsRev = "nixpkgs-unstable";
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nigpkgsRev}.tar.gz") { };

  imports = [
    ./zsh.nix
    ./neovim.nix
    ./vscode.nix
  ];

in
{
  inherit imports;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "idursun";
  home.homeDirectory = "/home/idursun";
  home.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userEmail = "ibrahim@dursun.cc";
    userName = "ibrahim dursun";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.htop.enable = true;
  programs.jq.enable = true;
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "b";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = dracula;
        extraConfig = ''
          set -g @dracula-show-fahrenheit false
          set -g @dracula-show-weather false
          set -g @dracula-show-battery false
          set -g @dracula-show-powerline true
          set -g @dracula-show-left-icon smiley
        '';
      }
    ];
    extraConfig = ''
      set -g mouse on
    '';

  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 8;
    };
  };

  programs.i3status-rust = {
    enable = true;
    bars.bottom = {
      blocks = [
        {
          block = "battery";
          format = "{percentage} {time}";
        }
        {
          block = "sound";
          step_width = 3;
        }
        {
          block = "cpu";
          interval = 1;
          format = "{barchart} {utilization} {frequency}";
        }
        {
          block = "memory";
          display_type = "memory";
          format_mem = "{mem_used_percents}";
          format_swap = "{swap_used_percents}";
        }
        {
          block = "time";
        }
      ];
      icons = "awesome5";
      theme = "solarized-dark";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
