{
  home = { pkgs, ... }: {
    home.packages = [
      (pkgs.patchDesktop pkgs.alacritty "Alacritty" "^Exec=alacritty" "Exec=env WINIT_X11_SCALE_FACTOR=1 alacritty")
    ];

    programs.alacritty = {
      enable = true;
      
      settings = {
        window = {
      	  opacity = 0.8;
          padding = {
            x = 10;
            y = 10;
          };
        };
   
        key_bindings = [{
          key = "F11";
          action = "ToggleFullscreen";
        }];

        selection.save_to_clipboard = true;
        
        font = {
          size = 13;
          family = "FiraCode Nerd Font Mono";
          normal = {
            style = "Regular";
          };
          bold = {
            style = "Bold";
          };
          scale_with_dpi = true;
        };

        colors = {
          primary = {
            background = "0x333333";
            # foreground = "0x839496";
          };
          normal = {
            black = "0x29414f";
            red = "0xec5f67";
            green = "0x99c794";
            yellow = "0xfac863";
            blue = "0x6699cc";
            magenta = "0xc594c5";
            cyan = "0x5fb3b3";
            white = "0x65737e";
          };
          bright = {
            black = "0x405860";
            red = "0xec5f67";
            green = "0x99c794";
            yellow = "0xfac863";
            blue = "0x6699cc";
            magenta = "0xc594c5";
            cyan = "0x5fb3b3";
            white = "0xadb5c0";
          };
        };
      };
    };
  };
}
