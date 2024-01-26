
# Assignment 02 - Docker Networks & Docker Compose

Reference - docker networking: youtube.com/watch?v=bKFMS5C4CG0&ab_channel=NetworkChuck

1) Command No. 


wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
f16af642e1e2   bridge    bridge    local
183c02c374ff   host      host      local
fdb7192c9da4   none      null      local

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker network create my_network 
74cf6cfa55533d572a34af46a45a60d8785d7ff038f837f9563d6d7317ee33ec

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd --name nginx_container --network my_network -p 8080:80 nginx
6150b1f96083a410aa02f8d611056af5adbe138c340587e563cacb20ae3d9b1e

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd --name httpd_container --network my_network -p 8081:80 httpd
d8bfebad8bfcf5442c73f20421057e16573198d21662be86d0c221557dc90daf

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


wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker stop nginx_container 
nginx_container

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker rm nginx_container 
nginx_container

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker run -itd -p 8082:80 --name nginx_container02 --network my_network nginx
4af751a8ee798bfdcf191d59119fe55d72313bf4fca5cf455609b6c13237cb32

wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker container ls
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                                   NAMES
4af751a8ee79   nginx     "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8082->80/tcp, :::8082->80/tcp   nginx_container02

d8bfebad8bfc   httpd     "httpd-foreground"       7 minutes ago        Up 7 minutes        0.0.0.0:8081->80/tcp, :::8081->80/tcp   httpd_container



wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker stop nginx_container02 httpd_container 
nginx_container02
httpd_container


wajahat@wajahat:~/Learning/DevOps-Dice-2024/dice-assignment02$ docker rm nginx_container02 httpd_container 
nginx_container02
httpd_container

