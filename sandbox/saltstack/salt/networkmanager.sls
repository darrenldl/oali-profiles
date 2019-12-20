Enable IPv6 privacy extensions:
  # Copied from Archwiki
  # URL : https://wiki.archlinux.org/index.php/IPv6#NetworkManager
  file.append:
    - name: {{ pillar['networkmanager']['config_path'] }}
    - text: |

        [connection]
        ipv6.ip6-privacy=2
