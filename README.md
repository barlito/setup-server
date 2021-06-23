
# Barlito Setup Server
## _The most advanced tool to setup your local or remote machine, no_

The setup server project aim to deploy tools that you needs to run your dev or prod Docker applications.

The project use ansible to install and setup tools.

You can chose what to install and configure.

The project install basics packages like vim or htop, using APT, you can add or remove every package you want.

It install also Docker and turn on swarm mode and on top of that, it install the [Traefik](https://doc.traefik.io/traefik/) reverse proxy with docker swarm provider enabled by default.

# Prerequisites

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Make    | `apt install make`
- sshpass | `apt install sshpass`

# Install

## Install ansible dependencies :

    make requirements

## Generate a .env

    make env

Will generate a pre-filled .env

## Fill ansible hosts file

Project use the `hosts` file at the project root, fill it with your server credentials, ansible will use it to access it.

# .env configuration

## You can check those .env examples it can help you :

[.env](doc/env.md)  
[.env-letencrypt](doc/env-letsencrypt.md)

Generated .env contains four variables blocks :
- Hosts
- Basic packages
- Docker
- Traefik

### Hosts
The host block allow you to choose what to deploy on which servers you've setup in `hosts` file.

### Basic packages
Simply the list of packages you want to install.

### Docker
Carrefull of the `docker_advertise_addr`, you could let it empty but may need to fill it if Docker swarm could not be enable ( ansible will break and you will have an error when Docker install is almost finished ).
The variable refer to the externally reachable address advertised to other nodes.  
Refer to the [doc](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_swarm_module.html#parameter-advertise_addr)  
You can ommit it if you're sure that the ansible module will detect yours automatically.

### Traefik

Refer to this [repository doc](https://github.com/barlito/ansible.traefik.swarm)


# Notes


If you want to run it localy, you'll need to disable ssh host key checking for ansible, just add this line in your .env file : 

    ansible_ssh_extra_args: '-o StrictHostKeyChecking=no'
	
And you'll need to declare your server like this :  

    127.0.0.1 ansible_connection=local
