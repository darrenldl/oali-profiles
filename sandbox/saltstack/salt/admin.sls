System monitoring:
  pkg.installed:
    - pkgs:
       - gtop
       - glances
       - nmon

Disk usage monitoring:
  pkg.installed:
    - pkgs:
      - ncdu
      - filelight

System info:
  pkg.installed:
    - pkgs:
      - hwdetect
      - lshw
      - hardinfo
      - screenfetch

File system tools:
  pkg.installed:
    - pkgs:
      - mtools
      - dosfstools
      - efibootmgr
      - nfs-utils

Task management:
  pkg.installed:
    - pkgs:
      - lsof
      - htop
      - xfce4-taskmanager

Mounting:
  pkg.installed:
    - pkgs:
      - udevil

NTP:
  pkg.installed:
    - pkgs:
      - ntp

Package management:
  pkg.installed:
    - pkgs:
      - pacman-contrib

Mirrorlist:
  pkg.installed:
    - pkgs:
      - reflector
