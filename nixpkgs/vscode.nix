{ configs, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      matklad.rust-analyzer
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "phoenix";
        publisher = "phoenixframework";
        version = "0.1.0";
        sha256 = "da850fd39b149cf90f426304c3c4d92180164ed40b561a9a0c61215c90e3576b";
      }
      {
        name = "elixir-ls";
        publisher = "JakeBecker";
        version = "0.8.1";
        sha256 = "2f5e5ffd484ac74438c0dc4f3dda6617384ca07b96dbb684a44411fdc3317ea2";
      }
      {
        name = "vscode-tailwindcss";
        publisher = "bradlc";
        version = "0.7.1";
        sha256 = "0b3dc244e49dedfec90a3d5027a64549660d29451ccb6bbee206179923177719";
      }
    ];

    userSettings = {
      "workbench.colorTheme" = "Dracula";
      "editor.fontFamily" = "Jetbrains Mono, Fira Code Retina, Consolas, 'Courier New', monospace";
      "editor.formatOnSave" = true;
      "editor.lineNumbers" = "relative";
      "vim.highlightedyank.enable" = true;
      "vim.hlsearch" = true;
      "vim.incsearch" = true;
      "vim.ignorecase" = true;
      "vim.sneak" = false;
      "vim.useCtrlKeys" = true;
      "vim.useSystemClipboard" = false;
      "vim.leader" = "<space>";
      "vim.handleKeys" = {
        "<C-d>" = false;
        "<C-w>" = false;
      };
      "vim.normalModeKeyBindings" = [
        {
          "before" = [ "K" ];
          "commands" = [ "editor.action.showHover" ];
        }
        {
          "before" = [ "<leader>" "f" ];
          "commands" = [ "workbench.action.quickOpen" ];
        }
        {
          "before" = [ "<leader>" "s" ];
          "commands" = [ "workbench.action.gotoSymbol" ];
        }
      ];
    };

    keybindings = [
    ];
  };
}

