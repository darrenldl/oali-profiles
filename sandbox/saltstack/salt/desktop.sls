Desktop environment related:
  pkg.installed:
    - pkgs:
      - xorg
      - xorg-server-xwayland
      - termdown

Terminal emulators:
  pkg.installed:
    - pkgs:
      - alacritty

# Xfce4:
#   pkg.installed:
#     - pkgs:
#       - xfce4
#       - xfce4-goodies

# Lxqt:
#   pkg.installed:
#     - pkgs:
#       - lxqt

MATE:
  pkg.installed:
    - pkgs:
      - mate

Window manager related:
  pkg.installed:
    - pkgs:
      - wmctrl

File managers:
  pkg.installed:
    - pkgs:
      - nemo

Login manager:
  pkg.installed:
    - pkgs:
      - sddm

Audio server:
  pkg.installed:
    - pkgs:
      - pulseaudio
      - paprefs
      - pavucontrol-qt
