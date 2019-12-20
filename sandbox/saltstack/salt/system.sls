Vanilla kernel:
  pkg.installed:
    - pkgs:
      - linux
      - linux-headers

Optimisations:
  pkg.installed:
    - pkgs:
      - irqbalance

Reduce the timeout of systemd stop job:
  file.append:
    - name: {{ pillar['systemd']['config_path'] }}
    - text: |
        
        DefaultTimeoutStartSec=10s
        DefaultTimeoutStopSec=10s

