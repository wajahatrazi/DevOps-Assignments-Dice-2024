# Assignment04: Kubernetes

**Section 01: Minikube Installation**
---
- Utilized Docker as the driver for installing minikube
- OS: Ubuntu 22.04

References:

    https://minikube.sigs.k8s.io/docs/start/
    google.com


Installing the debian package:

    wajahat@wajahat:~/.../dice-assignment04$ sudo dpkg -i minikube_latest_amd64.deb

    (Reading database ... 243257 files and directories currently installed.)
    Preparing to unpack minikube_latest_amd64.deb ...
    Unpacking minikube (1.32.0-0) over (1.32.0-0) ...
    Setting up minikube (1.32.0-0) ...


Note: After installation there was problem with minikube start command. The docker default was not working fine, as can be seen below:

    wajahat@wajahat:~/.../dice-assignment04$ minikube status

    W0216 10:09:16.564183   43915 main.go:291] Unable to resolve the current Docker CLI context "default": context "default": context not found: open /home/wajahat/.docker/contexts/meta/37a8eec1ce19687d132fe29051dca629d164e2c4958ba141d5f4133a33f0688f/meta.json: no such file or directory
    minikube
    type: Control Plane
    host: Running
    kubelet: Running
    apiserver: Running
    kubeconfig: Configured



I googled the issue and executed the following command to fix the context

    wajahat@wajahat:~/.../dice-assignment04$ docker context ls
    NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT                                    KUBERNETES ENDPOINT   ORCHESTRATOR
    default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                                              
    desktop-linux       moby                Docker Desktop                            unix:///home/wajahat/.docker/desktop/docker.sock        

    wajahat@wajahat:~/.../dice-assignment04$ docker context use default



Even after changing the default context, minikube was not running. 
Following steps were executed to resolve the issue: 

Stopping minikube

    wajahat@wajahat:~/.../dice-assignment04$ minikube stop

    ✋  Stopping node "minikube"  ...
    🛑  1 node stopped.

Deleting minikube

    wajahat@wajahat:~/.../dice-assignment04$ minikube delete

    🔥  Deleting "minikube" in docker ...
    🔥  Deleting container "minikube" ...
    🔥  Removing /home/wajahat/.minikube/machines/minikube ...
    💀  Removed all traces of the "minikube" cluster.

Againing starting the service

    wajahat@wajahat:~/.../dice-assignment04$ minikube start

    😄  minikube v1.32.0 on Ubuntu 22.04
    ✨  Automatically selected the docker driver. Other choices: kvm2, qemu2, ssh
    📌  Using Docker driver with root privileges
    👍  Starting control plane node minikube in cluster minikube
    🚜  Pulling base image ...
    🔥  Creating docker container (CPUs=2, Memory=3900MB) ...
    🐳  Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
        ▪ Generating certificates and keys ...
        ▪ Booting up control plane ...
        ▪ Configuring RBAC rules ...
    🔗  Configuring bridge CNI (Container Networking Interface) ...
    🔎  Verifying Kubernetes components...
        ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    🌟  Enabled addons: storage-provisioner, default-storageclass
    🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

Running "docker ps" command:

    wajahat@wajahat:~/.../dice-assignment04$ docker ps

    CONTAINER ID   IMAGE                                 COMMAND                  CREATED         STATUS         PORTS                                                                                                                                  NAMES
    8a609bf17f75   gcr.io/k8s-minikube/kicbase:v0.0.42   "/usr/local/bin/entr…"   4 minutes ago   Up 4 minutes   127.0.0.1:32782->22/tcp, 127.0.0.1:32781->2376/tcp, 127.0.0.1:32780->5000/tcp, 127.0.0.1:32779->8443/tcp, 127.0.0.1:32778->32443/tcp   minikube

Checking status

    wajahat@wajahat:~/.../dice-assignment04$ minikube status

    minikube
    type: Control Plane
    host: Running
    kubelet: Running
    apiserver: Running
    kubeconfig: Configured

Version

    wajahat@wajahat:~/.../dice-assignment04$ minikube version

    minikube version: v1.32.0
    commit: 8220a6eb95f0a4d75f7f2d7b14cef975f050512d


