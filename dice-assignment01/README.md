# DevOps-Dice-2024

Assignment#1 - Docker - Jan 2024

*******************************************************************
# Part 01 - Docker file Creation, GitHub and Docker Hub Integration

1) Created a new account on docker hub
        
2) Pulled Ubuntu Image from the docker hub
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker pull ubuntu
        Using default tag: latest
        latest: Pulling from library/ubuntu
        29202e855b20: Pull complete 
        Digest: sha256:e6173d4dc55e76b87c4af8db8821b1feae4146dd47341e4d431118c7dd060a74
        Status: Downloaded newer image for ubuntu:latest
        docker.io/library/ubuntu:latest

3) Creating the docker file

4) Building a docker image

        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker build -t first-ubuntu:0.1 .
        [+] Building 0.1s (9/9) FINISHED                                                                                                                           docker:default
        => [internal] load build definition from Dockerfile                                                                                          
        => => transferring dockerfile: 
        => [internal] load .dockerignore                                                                                                            
        => => transferring context:2B                                                                                                                     
        => [internal] load metadata for docker.io/library/ubuntu:latest    
        => [1/4] FROM docker.io/library/ubuntu:latest                          
        => [internal] load build context
        => => transferring context: 29B 
        => CACHED [2/4] WORKDIR /home/hello 
        => CACHED [3/4] RUN apt-get update && apt-get install -y python3 python3-pip      
        => CACHED [4/4] COPY hello.py /home/hello/     
        => exporting to image 
        => => exporting layers
        => => writing image sha256:ea1f2049d1007d748e1d1d57fd9ffe049555795c7a2c71c53d83efc46342d42d 
        => => naming to docker.io/library/first-ubuntu:0.1        

5) Checking docker images
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker images
        REPOSITORY           TAG       IMAGE ID       CREATED              SIZE
        first-ubuntu         0.1       ea1f2049d100   About a minute ago   473MB
        ubuntu               latest    e34e831650c1   6 days ago           77.9MB
        redis                latest    bdff4838c172   8 days ago           138MB

6) Running Docker image
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker run first-ubuntu:0.1
        Assalamoallikum!

7) Creating the repository on the docker hub

8) Tagging the first-ubuntu:0.1 image with the repository name

        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker images
        REPOSITORY         TAG       IMAGE ID       CREATED          SIZE
        first-ubuntu       0.1       ea1f2049d100   20 minutes ago   473MB
        hub-first-ubuntu   0.1       ea1f2049d100   20 minutes ago   473MB
        ubuntu             latest    e34e831650c1   6 days ago       77.9MB
        redis              latest    bdff4838c172   8 days ago       138MB
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ 
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker tag first-ubuntu:0.1 wajahatrazi/hub-first-ubuntu:0.1
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ 

9) Pushing the image to the docker hub

        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker push wajahatrazi/hub-first-ubuntu:0.1
        The push refers to repository [docker.io/wajahatrazi/hub-first-ubuntu]
        1829c46e7626: Pushed 
        320ad192b2b6: Pushed 
        0ae4ce4e66a3: Pushed 
        8e87ff28f1b5: Pushed 
        0.1: digest: sha256:6d26a0f9d263ba770422fe3053597e9ea353c16c22078f4b5bf9e9ff0987b123 size: 1156
        wajahat@wajahat:~/Learning/DevOps-Dice-2024$ 

*******************************************************************
# Part02 - Docker Containers with Commands

1) **docker ps -a**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker ps -a
    CONTAINER ID   IMAGE              COMMAND              CREATED              STATUS                          PORTS     NAMES
    e2433d689e91   first-ubuntu:0.1   "python3 hello.py"   About a minute ago   Exited (0) About a minute ago             quizzical_kepler

2) **docker start**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker start e2433d689e91
    e2433d689e91

3) **docker rm**


4) **docker logs**

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker logs e2433d689e91
    Assalamoallikum!
    Assalamoallikum!

5) **docker inspect**
    ***Images***

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker inspect first-ubuntu:0.1 
    [
        {
            "Id": "sha256:ea1f2049d1007d748e1d1d57fd9ffe049555795c7a2c71c53d83efc46342d42d",
            "RepoTags": [
                "first-ubuntu:0.1",
                "wajahatrazi/hub-first-ubuntu:0.1"
            ],
            "RepoDigests": [
                "wajahatrazi/hub-first-ubuntu@sha256:6d26a0f9d263ba770422fe3053597e9ea353c16c22078f4b5bf9e9ff0987b123"
            ],
            "Parent": "",
            "Comment": "buildkit.dockerfile.v0",
            "Created": "2024-01-18T01:20:51.557924317+05:00",
            "Container": "",
            .
            .
            .
            .
        }
    ]
    
    ***Containers***
    

6) **docker exec** (Not running in the interactive mode)
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker exec -it e2433d689e91 /bin/bash
    Error response from daemon: Container e2433d689e9198489e98a28911e6604217264527ec567dcbb3e1a83f6b4d17f9 is not running

8) **docker cp**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker cp /home/wajahat/Learning/DevOps-Dice-2024/dice-assignment01/cpcmdtest.txt e2433d689e91:/home
    Successfully copied 1.54kB to e2433d689e91:/home

9) **docker top**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker start e2433d689e91
    e2433d689e91
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker ps -a
    CONTAINER ID   IMAGE              COMMAND              CREATED          STATUS                     PORTS     NAMES
    e2433d689e91   first-ubuntu:0.1   "python3 hello.py"   29 minutes ago   Exited (0) 3 seconds ago             quizzical_kepler
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ 
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ 
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker top e2433d689e91
    Error response from daemon: container e2433d689e9198489e98a28911e6604217264527ec567dcbb3e1a83f6b4d17f9 is not running
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ 

10) **docker rename**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker rename e2433d689e91 renamed-container-for-assignment01
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker ps -a
    CONTAINER ID   IMAGE              COMMAND              CREATED          STATUS                          PORTS     NAMES
    e2433d689e91   first-ubuntu:0.1   "python3 hello.py"   31 minutes ago   Exited (0) About a minute ago             renamed-container-for-assignment01

11) **docker attach**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker start renamed-container-for-assignment01
    renamed-container-for-assignment01
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker attach renamed-container-for-assignment01
    You cannot attach to a stopped container, start it first

12) **docker restart**
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker restart e2433d689e91
    e2433d689e91

# Part 03 - Docker Volumes

1) 

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker pull nginx


wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker volume create my_volume
my_volume
wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ 



Creating the container while setting the port, making it interactive and confirming it by opening the localhost on browser
wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker run -it -p 8080:80 --name c1-nginx -v my_volume:/usr/share/nginx/html nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2024/01/18 20:23:36 [notice] 1#1: using the "epoll" event method
2024/01/18 20:23:36 [notice] 1#1: nginx/1.25.3
2024/01/18 20:23:36 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2024/01/18 20:23:36 [notice] 1#1: OS: Linux 6.5.0-14-generic
2024/01/18 20:23:36 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2024/01/18 20:23:36 [notice] 1#1: start worker processes
2024/01/18 20:23:36 [notice] 1#1: start worker process 29
2024/01/18 20:23:36 [notice] 1#1: start worker process 30
2024/01/18 20:23:36 [notice] 1#1: start worker process 31
2024/01/18 20:23:36 [notice] 1#1: start worker process 32
172.17.0.1 - - [18/Jan/2024:20:23:55 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" "-"
2024/01/18 20:23:55 [error] 31#31: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 172.17.0.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost:8080", referrer: "http://localhost:8080/"
172.17.0.1 - - [18/Jan/2024:20:23:55 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost:8080/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" "-"


^C2024/01/18 20:26:32 [notice] 32#32: signal 2 (SIGINT) received, exiting
2024/01/18 20:26:32 [notice] 32#32: exiting
2024/01/18 20:26:32 [notice] 1#1: signal 2 (SIGINT) received, exiting
2024/01/18 20:26:32 [notice] 30#30: signal 2 (SIGINT) received, exiting
2024/01/18 20:26:32 [notice] 32#32: exit



wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ touch index.html
wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ gedit index.html 
gedit: symbol lookup error: /snap/core20/current/lib/x86_64-linux-gnu/libpthread.so.0: undefined symbol: __libc_pthread_init, version GLIBC_PRIVATE
wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ 
wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker cp index.html c1-nginx:/usr/share/nginx/html/
Successfully copied 2.05kB to c1-nginx:/usr/share/nginx/html/
wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ 


wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment01$ docker start 729d28c157d0
729d28c157d0


2) httpd


