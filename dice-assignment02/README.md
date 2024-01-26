
# Assignment 02

**Docker Networks**

Reference - docker networking: youtube.com/watch?v=bKFMS5C4CG0&ab_channel=NetworkChuck

1) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network ls
    NETWORK ID     NAME      DRIVER    SCOPE
    f16af642e1e2   bridge    bridge    local
    183c02c374ff   host      host      local
    fdb7192c9da4   none      null      local

2) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network create my_network 
    74cf6cfa55533d572a34af46a45a60d8785d7ff038f837f9563d6d7317ee33ec

3) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd --name nginx_container --network my_network -p 8080:80 nginx
    6150b1f96083a410aa02f8d611056af5adbe138c340587e563cacb20ae3d9b1e


4) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd --name httpd_container --network my_network -p 8081:80 httpd
    d8bfebad8bfcf5442c73f20421057e16573198d21662be86d0c221557dc90daf


5) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network inspect my_network 
    [
        {
            "Name": "my_network",
            "Id": "74cf6cfa55533d572a34af46a45a60d8785d7ff038f837f9563d6d7317ee33ec",
            "Created": "2024-01-26T23:39:20.094589283+05:00",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": {},
                "Config": [
                    {
                        "Subnet": "172.20.0.0/16",
                        "Gateway": "172.20.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Ingress": false,
            "ConfigFrom": {
                "Network": ""
            },
            "ConfigOnly": false,
            "Containers": {
                "6150b1f96083a410aa02f8d611056af5adbe138c340587e563cacb20ae3d9b1e": {
                    "Name": "nginx_container",
                    "EndpointID": "5eb145ae9d2734b39177c77a26c92363bceaf3bfefee6884ffcb542de7da7a9b",
                    "MacAddress": "02:42:ac:14:00:02",
                    "IPv4Address": "172.20.0.2/16",
                    "IPv6Address": ""
                },
                "d8bfebad8bfcf5442c73f20421057e16573198d21662be86d0c221557dc90daf": {
                    "Name": "httpd_container",
                    "EndpointID": "ba13c09dc35421d7a860e55cfbaa0844d8a33ccc4cb8484f6702b09cf83c9b17",
                    "MacAddress": "02:42:ac:14:00:03",
                    "IPv4Address": "172.20.0.3/16",
                    "IPv6Address": ""
                }
            },
            "Options": {},
            "Labels": {}
        }
    ]

6) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker stop nginx_container 
    nginx_container

7) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker rm nginx_container 
    nginx_container

8) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd -p 8082:80 --name nginx_container02 --network my_network nginx
    4af751a8ee798bfdcf191d59119fe55d72313bf4fca5cf455609b6c13237cb32

9) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker container ls
    CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                                   NAMES
    4af751a8ee79   nginx     "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8082->80/tcp, :::8082->80/tcp   nginx_container02

    d8bfebad8bfc   httpd     "httpd-foreground"       7 minutes ago        Up 7 minutes        0.0.0.0:8081->80/tcp, :::8081->80/tcp   httpd_container


10) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker stop nginx_container02 httpd_container 
    nginx_container02
    httpd_container

11) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker rm nginx_container02 httpd_container 
    nginx_container02
    httpd_container

12) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network rm my_network 
    my_network

13) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network ls
    NETWORK ID     NAME      DRIVER    SCOPE
    f16af642e1e2   bridge    bridge    local
    183c02c374ff   host      host      local
    fdb7192c9da4   none      null      local



*******************************************
**Docker Compose**


1) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker build -t hello-app -f Dockerfile.web .

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker build -t redis-app -f Dockerfile.db .

2) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker images
    REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
    hello-app    latest    00d638b0a8a5   6 minutes ago   491MB
    ubuntu       latest    e34e831650c1   2 weeks ago     77.9MB
    redis-app    latest    c69197e471d9   2 weeks ago     138MB
    redis        latest    bdff4838c172   2 weeks ago     138MB
    python       latest    e7177b0afd0e   5 weeks ago     1.02GB
    alpine       latest    f8c20f8bbcb6   7 weeks ago     7.38MB
    nginx        latest    a8758716bb6a   3 months ago    187MB
    httpd        latest    92fa43a2ff60   3 months ago    167MB


3) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd -p 8080:8080 --name redis-container redis-app
    100eb5ce609a6bc49c74b2b5e1949c340fee09664b595bdd299ae4ede6279e8c

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd --name hello-container -p 8081:8080 hello-app
    672d221dc3fbe56694bde87fb968170cfd43ded38fc088b93739bb88c66d7a82


4) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker ps
    CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS          PORTS                                       NAMES
    45c847efd180   redis-app   "docker-entrypoint.s…"   10 seconds ago   Up 9 seconds    6379/tcp                                    redis-container
    29c614debf31   hello-app   "python3 hello.py"       35 seconds ago   Up 34 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   hello-container

5) 

    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker compose up
    [+] Running 2/2
    ✔ Container dice-assignment02-db-1   Running                                                                                                              0.0s 
    ✔ Container dice-assignment02-web-1  Recreated                                                                                                            0.1s 
    Attaching to db-1, web-1
    Error response from daemon: driver failed programming external connectivity on endpoint dice-assignment02-web-1 (ece7440f41a8d9b8d150a846e415ac27594e8d558986ee6763a8ed5315409b66): Bind for 0.0.0.0:8080 failed: port is already allocated
    wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker compose up
    [+] Running 2/0
    ✔ Container dice-assignment02-db-1   Running                                                                                                              0.0s 
    ✔ Container dice-assignment02-web-1  Recreated                                                                                                            0.1s 
    Attaching to db-1, web-1
    web-1  | INFO:     Started server process [1]
    web-1  | INFO:     Waiting for application startup.
    web-1  | INFO:     Application startup complete.
    web-1  | INFO:     Uvicorn running on http://0.0.0.0:8080 (Press CTRL+C to quit)
    web-1  | INFO:     172.21.0.1:49164 - "GET / HTTP/1.1" 200 OK
    web-1  | INFO:     172.21.0.1:49164 - "GET /favicon.ico HTTP/1.1" 404 Not Found

