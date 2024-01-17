FROM ubuntu:latest

#Setting up a working directory inside the container
WORKDIR /home/hello

#installing python3 and pip3 to execute the file
RUN apt-get update && apt-get install -y python3 python3-pip

#copying the python script to the container directory created above
COPY hello.py /home/hello/

#running the command
CMD ["python3", "hello.py"]
