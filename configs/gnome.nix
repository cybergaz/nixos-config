{
  system = { pkgs, lib, ... }: {
    services = {
      xserver = {
        enable = true;
        dpi = 96;
        desktopManager.gnome.enable = true;

        excludePackages = with pkgs; [
          xterm
        ];
      };
      
      gnome.core-utilities.enable = false;
      # gnome.core-os-services.enable = lib.mkForce false;
    };

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    environment.systemPackages = with pkgs.gnome; [
      gnome-tweaks
    ];
  };

  home = { lib, pkgs, ... }: {
    dconf = {
      enable = true;
      settings = let 
        inherit (lib.hm.gvariant) mkTuple mkUint32;
      in {
        "org/gnome/desktop/input-sources" = {
          per-window = false;
          sources = [ (mkTuple ["xkb" "us"]) (mkTuple ["xkb" "il"]) ];
          xkb-options = ["terminate:ctrl_alt_bksp" "caps:escape"];
        };
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "aztaskbar@aztaskbar.gitlab.com"
            "Hide_Activities@shay.shayel.org"
            "blur-my-shell@aunetx"
            "sound-output-device-chooser@kgshank.net"
            "gtktitlebar@velitasali.github.io"
            "clipboard-indicator@tudmotu.com"
            "windowIsReady_Remover@nunofarruca@gmail.com"
            "mprisindicatorbutton@JasonLG1979.github.io"
            "bluetooth-quick-connect@bjarosze.gmail.com"
          ];
        };
        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
          speed = -0.78;
        };
        "org/gnome/desktop/peripherals/touchpad" = {
          two-finger-scrolling-enabled = true;
        };
        "org/gnome/desktop/background" = {
          picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jpg";
          picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jpg";
          primary-color = "#3465a4";
        };
        "org/gnome/desktop/interface" = {
          # gtk-theme = "Adwaita-dark";
          color-scheme = "prefer-dark";
        };
        "apps/guake/general" = {
          gtk-prefer-dark-theme = true;
        };
        "apps/guake/style/background" = {
          transparency = 90;
        };
        "org/gnome/desktop/peripherals/keyboard" = {
          delay = mkUint32 226;
        };
      };
    };

    home.packages = with pkgs.gnomeExtensions; [
      gtk-title-bar
      app-icons-taskbar
      hide-activities-button
      blur-my-shell
      sound-output-device-chooser
      clipboard-indicator
      window-is-ready-remover
      mpris-indicator-button
      bluetooth-quick-connect
    ];
  };
}
