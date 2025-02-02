let
  mkHome = import ../utils/mk-home.nix;
  username = "flafydev";
in
mkHome username {
  configs = cfgs: with cfgs; [
    direnv
    git
    mpv
    nix
    printer-4500
    # vscode
    zsh
    mouse-g502-xserver
    neovim
    # i3
    bspwm
    alacritty
    picom
    keyboard-xserver
    betterdiscord
    ( eww { wayland = false; } )
    rofi
    bitwarden
    gtk
    qt
    utility-gui
    utility-scripts
    utility-cli
    ( firefox { wayland = false; }) 
    chromium
    ssh
    # neofetch
    # kitty
    # sway
    foot
  ];

  system = { pkgs, ... }: {
    time.timeZone = "Israel";

    programs = {
      adb.enable = true;
      kdeconnect.enable = true;
    };

    # services.xserver.libinput = {
    #   enable = true;
    #   touchpad = {
    #     tapping = true;
    #   };
    # };
    services.upower.enable = true;
    # services.tlp.enable = true;
    # Notify on low battery
    # systemd.user.services.batsignal = {
    #   Install.WantedBy = [ "graphical-session.target" ];
    #   Unit = {
    #     Description = "Battery status daemon";
    #     PartOf = [ "graphical-session.target" ];
    #   };
    #   Service = {
    #     Type = "simple";
    #     ExecStart = "${pkgs.batsignal}/bin/batsignal";
    #   };
    # };

    fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
  };

  home = ({ pkgs, lib, inputs, ... }: {
    home.packages = with pkgs; [
      polymc
      element-desktop
      libnotify
      # (patchDesktop pkgs.mpv-unwrapped "mpv" "^Exec=mpv" "Exec=nvidia-offload mpv")
      libva-utils 
    ];

    home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  });
}

