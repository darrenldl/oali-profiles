Make sure NetworkManager is enabled:
  service.enabled:
    - name : NetworkManager
    - require :
      - Network management

# Make sure sddm is enabled:
#   service.enabled:
#     - name : sddm
#     - require :
#       - Login manager

Make sure spice-vdagentd is enabled:
  service.enabled:
    - name : spice-vdagentd
    - require :
      - Spice guest packages
