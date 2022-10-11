{
  home = { ... }: {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          term = "foot";
          font = "FiraCode Nerd Font Mono:size=11";
          dpi-aware = "no";
          pad="10x10";
        };

        mouse = {
          hide-when-typing = "yes";
        };

        colors = {
          alpha = 0.3;
          background = "0x00000F";

          regular0 = "29414f";
          regular1 = "0xec5f67";
          regular2 = "0x99c794";
          regular3 = "0xfac863";
          regular4 = "0x6699cc";
          regular5 = "0xc594c5";
          regular6 = "0x5fb3b3";
          regular7 = "0x65737e";

          bright0 = "0x405860";
          bright1 = "0xec5f67";
          bright2 = "0x99c794";
          bright3 = "0xfac863";
          bright4 = "0x6699cc";
          bright5 = "0xc594c5";
          bright6 = "0x5fb3b3";
          bright7 = "0xadb5c0";
        };
      };
    };
  };
}

