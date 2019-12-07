System monitoring:
  pkg.installed:
    - pkgs:
#      - conky
       - gtop
       - glances

At:
  pkg.installed:
    - pkgs:
      - at

Cron:
  pkg.installed:
    - pkgs:
      - fcron

Disk usage monitoring:
  pkg.installed:
    - pkgs:
      - ncdu

CPU limiting:
  pkg.installed:
    - pkgs:
      - cpulimit

System info:
  pkg.installed:
    - pkgs:
      - hwdetect
      - lshw

Log cleaning:
  pkg.installed:
    - pkgs:
      - logrotate # should already be installed since it is in base group, but leaving it here anyway

Disk management:
  pkg.installed:
    - pkgs:
      - smartmontools
      - hddtemp
      - hdparm
      - sdparm

File system tools:
  pkg.installed:
    - pkgs:
      - mtools
      - dosfstools
      - efibootmgr
      - nfs-utils

Secure boot (EFI):
  pkg.installed:
    - pkgs:
      - efitools

Task management:
  pkg.installed:
    - pkgs:
      - lsof
      - htop

Mounting:
  pkg.installed:
    - pkgs:
      - udevil

NTP:
  pkg.installed:
    - pkgs:
      - ntp

File backup:
  pkg.installed:
    - pkgs:
      - borg

File synchronisation:
  pkg.installed:
    - pkgs:
      - unison

Cloud file access:
  pkg.installed:
    - pkgs:
      - rclone

Partitioning:
  pkg.installed:
    - pkgs:
      - parted

Screen sessions:
  pkg.installed:
    - pkgs:
      - screen
      - tmux
