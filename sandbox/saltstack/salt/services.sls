Make sure NetworkManager is enabled:
  service.enabled:
    - name : NetworkManager
    - require :
      - Network management

Make sure sddm is enabled:
  service.enabled:
    - name : sddm
    - require :
      - Login manager

