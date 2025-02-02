#!/usr/bin/env python3

import sys
import subprocess
import shutil
import os

def hyprland_save(enable: bool):
    if enable:
        subprocess.check_output(["hyprctl", "keyword", "decoration:blur", "0"])
        subprocess.check_output(["hyprctl", "keyword", "animations:enabled", "0"])
    else:
        subprocess.check_output(["hyprctl", "reload", "config-only"])

def xorg_save(enable: bool):
    if enable:
        subprocess.check_output(["systemctl", "stop", "picom", "--user"])
    else:
        subprocess.check_output(["systemctl", "start", "picom", "--user"])

# def save(enable: bool):
#     subprocess.check_output(["eww", "update", f"notBatterySaving={str(not enable).lower()}"])
#     if shutil.which("picom"):
#         xorg_save(enable)
#     elif shutil.which("hyprctl"):
#         hyprland_save(enable)

def save(enable: bool):
    subprocess.check_output(["eww", "update", f"notBatterySaving={str(not enable).lower()}"])
    match os.environ.get('DESKTOP_SESSION', None):
        case None:
            hyprland_save(enable)
        case _:
            xorg_save(enable)

save(sys.argv[1].lower() == "true")

