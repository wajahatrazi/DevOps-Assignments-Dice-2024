# Build image from Python SDK
FROM python:3.9

# The image build will operate from the /myproject directory
WORKDIR /myproject

# Copy requirements.txt file first so we can take advantage
# of container build caching
COPY requirements.txt . 

# Use RUN commands to install python requirements
RUN pip3 install -r requirements.txt
# and additional apt packages 
RUN apt-get update \
    && apt-get install -qqy screen \
    && rm -rf /var/lib/apt/lists

# Copy the rest of the project code into the container
COPY . . 

# Define default command to run at container startup
CMD ["python", "hello.py"]
