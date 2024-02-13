# Use Alpine Linux as the base image due to its small size
FROM alpine:latest

# Install bash for our hello world script (Alpine uses 'sh' by default)
RUN apk add --no-cache bash

# Create a directory for our application
WORKDIR /app

# Create a hello world script
RUN echo '#!/bin/bash' > hello.sh \
    && echo 'echo "Hello, World!"' >> hello.sh \
    && chmod +x hello.sh

# Run the script when the container starts
CMD ["./hello.sh"]
