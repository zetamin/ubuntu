# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid user interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and tools, assuming Python3 and pip for this example
RUN apt-get update && \
    apt-get install -y python3 python3-pip git

# Clone the iris-web repository
RUN git clone https://github.com/dfir-iris/iris-web.git /dfir-iris && \
    cd /dfir-iris && \
    git checkout v2.3.7 && \  # Check out the latest non-beta tagged version
    cp .env.model .env && \    # Copy the environment file
    pip3 install -r requirements.txt

# Set the working directory to where dfir-iris is installed
WORKDIR /dfir-iris

# Expose the port the IRIS web application runs on
EXPOSE 8000

# Run IRIS web application
CMD ["python3", "iris.py"]
