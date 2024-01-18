# DevOps-Dice-2024

Assignment#1 - Docker - Jan 2024

# Part 01 - Docker file Creation, GitHub and Docker Hub Integration

Steps:
1) # Created a new account on docker hub
    
2) # Pulled Ubuntu Image from the docker hub
    wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker pull ubuntu
    Using default tag: latest
    latest: Pulling from library/ubuntu
    29202e855b20: Pull complete 
    Digest: sha256:e6173d4dc55e76b87c4af8db8821b1feae4146dd47341e4d431118c7dd060a74
    Status: Downloaded newer image for ubuntu:latest
    docker.io/library/ubuntu:latest

3) # Creating the docker file

4) # Building a docker image

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

5) # Checking docker images
 wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker images
REPOSITORY           TAG       IMAGE ID       CREATED              SIZE
first-ubuntu         0.1       ea1f2049d100   About a minute ago   473MB
ubuntu               latest    e34e831650c1   6 days ago           77.9MB
redis                latest    bdff4838c172   8 days ago           138MB

6) # Running Docker image
wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker run first-ubuntu:0.1
Assalamoallikum!


7) # Creating the repository on the docker hub


8) # Tagging the first-ubuntu:0.1 image with the repository name
wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED          SIZE
first-ubuntu       0.1       ea1f2049d100   20 minutes ago   473MB
hub-first-ubuntu   0.1       ea1f2049d100   20 minutes ago   473MB
ubuntu             latest    e34e831650c1   6 days ago       77.9MB
redis              latest    bdff4838c172   8 days ago       138MB
wajahat@wajahat:~/Learning/DevOps-Dice-2024$ 
wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker tag first-ubuntu:0.1 wajahatrazi/hub-first-ubuntu:0.1
wajahat@wajahat:~/Learning/DevOps-Dice-2024$ 

9) # pushing the image to the docker hub

wajahat@wajahat:~/Learning/DevOps-Dice-2024$ docker push wajahatrazi/hub-first-ubuntu:0.1
The push refers to repository [docker.io/wajahatrazi/hub-first-ubuntu]
1829c46e7626: Pushed 
320ad192b2b6: Pushed 
0ae4ce4e66a3: Pushed 
8e87ff28f1b5: Pushed 
0.1: digest: sha256:6d26a0f9d263ba770422fe3053597e9ea353c16c22078f4b5bf9e9ff0987b123 size: 1156
wajahat@wajahat:~/Learning/DevOps-Dice-2024$ 

