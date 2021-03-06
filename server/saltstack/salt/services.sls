Make sure fcron is enabled:
  service.enabled:
    - name : fcron
    - require :
      - Cron

Make sure vnStat is enabled:
  service.enabled:
    - name : vnstat
    - require :
      - Network statistics

Make sure sshd is enabled:
  service.enabled:
    - name : sshd
    - require :
      - SSH

Make sure dhcpcd is enabled:
  service.enabled:
    - name : dhcpcd
