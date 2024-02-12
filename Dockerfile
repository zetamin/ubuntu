# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid user interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and tools, assuming Python3 and pip for this example
RUN apt-get update && \
    apt-get install -y python3 python3-pip git

# Clone the dfir-iris repository (adjust the URL to the repository's actual location)
# Alternatively, use pip or another package manager to install dfir-iris if it's available as a package
RUN git clone https://github.com/your/dfir-iris-repo.git /dfir-iris && \
    cd /dfir-iris && \
    pip3 install -r requirements.txt  # Assuming there's a requirements.txt

# Set the working directory to where dfir-iris is installed
WORKDIR /dfir-iris

# Run dfir-iris (adjust the command according to how dfir-iris is executed)
CMD ["python3", "iris.py"]
