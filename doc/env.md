# .env example
    
    ### > Hosts | Ansible hosts for each playbooks if you deploy on many servers ###
    packages_hosts: all
    docker_hosts: all
    traefik_hosts: all
    ### < Hosts ###
    
    ### > Install Basic Utils | Apt ansible module is used ###
    install_basic_packages: yes                 # [yes | no] - Enable or disable basic packages installation
    basic_packages:                             # YAML list - Feel free to add or remove packages
    - aptitude
    - vim
    - htop
    - ctop
    - bmon
    ### < Install basic packages ###
    
    ### > Install Docker | Docker swarm will be enabled ###
    install_docker: yes                         # [yes | no] - Enable or disable Docker installation
    docker_advertise_addr: "192.168.1.0"
    ### < Install Docker ###
    
    ### > Traefik Reverse Proxy ###
    install_traefik: yes
    traefik_self_signed_certs_common_name: "*.domain"
    traefik_stack_name: "traefik"
    traefik_network: "traefik_proxy"
    traefik_qs_https: yes
    traefik_image: "traefik:2.4"
    traefik_ports:
    - '80:80'
    - '443:443'
    - '8080:8080'
      traefik_confkey_api:
      dashboard: true
      traefik_qs_log_level: "DEBUG"
      traefik_labels: {
      "traefik.http.routers.traefik.rule=Host(`traefik.domain`)",
      "traefik.http.routers.traefik.service=api@internal",
      "traefik.http.services.traefik.loadbalancer.server.port=8080"
      }
    ### < Traefik Reverse Proxy ###
