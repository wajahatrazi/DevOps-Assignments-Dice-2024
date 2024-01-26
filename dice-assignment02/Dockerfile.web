FROM ubuntu:latest

WORKDIR /helloproject

COPY . /helloproject

RUN apt-get update && apt-get install -y python3 python3-pip && pip3 install fastapi uvicorn 

EXPOSE 8080

CMD ["python3", "hello.py"]