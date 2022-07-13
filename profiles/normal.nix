let
  mkHome = import ../utils/mk-home.nix;
  username = "flafydev";
in
mkHome username {
  system = { config, lib, pkgs, ... }: {
    imports = [
      ../system-configs/home-printer.nix
      ../system-configs/gnome-xserver.nix
    ];

    time.timeZone = "Israel";

    programs = {
      adb.enable = true;
      kdeconnect.enable = true;
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
    };

    services.xserver.libinput = {
      enable = true;
      mouse = {
        accelSpeed = "-0.78";
        accelProfile = "flat";
      };
    };

    fonts.fonts = with pkgs; [
      # segoe-ui
    ];

    environment.systemPackages = with pkgs; [
      nano
      wget
      firefox
      parted
      gparted
      btop
      git
      neofetch
      unzip
      gh
      gnome.gnome-tweaks
      gnome.dconf-editor
      xclip
      fish
      guake
      python3
    ];
  };

  home =
  ({ config, lib, pkgs, ... }: {
    imports = [
      ../nixpkgs.nix
      ../home-configs/git.nix
      ../home-configs/gnome.nix 
      ../home-configs/mpv.nix
      ../home-configs/vscode.nix
    ];

    home.packages = with pkgs; [
      libreoffice
      syncplay
      qbittorrent
      discord 
      krita
      polymc
      element-desktop
      gimp
      libsForQt5.kdenlive
      libstrangle
      yt-dlp
      termusic
    ];

    home.stateVersion = "21.11";
  });
}