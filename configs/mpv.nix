{
  home = { pkgs, ... }:
  {
    programs.mpv = {
      enable = true;
      enableFonts = true;
      config = {
        vo = "gpu";
        profile = "gpu-hq";
        hwdec = "auto";
        force-window = true;
        ytdl-format = "bestvideo+bestaudio";
        cache-default = 4000000;
        volume-max = 200;
        fs = true;
        screen = 0;
        save-position-on-quit = true;
        osc = false;
      };
      bindings = {
        UP = "add volume 2";
        DOWN = "add volume -2";
        WHEEL_UP = "add volume 2";
        WHEEL_DOWN = "add volume -2";
        "ctrl+pgup" = "playlist-next";
        "ctrl+pgdwn" = "playlist-prev"; 
      };
      scripts = with pkgs.mpvScripts; [
        modern-x-compact
        mpris
        autoload
      ];
    };
  };
}