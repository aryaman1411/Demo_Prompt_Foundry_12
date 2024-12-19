1. Dockerfile:

```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.7-slim as build

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Use multi-stage builds
FROM build AS production

# Expose port 80 for the API
EXPOSE 80

# Run the command to start uWSGI
CMD ["uwsgi", "app.ini"]
```

This Dockerfile uses Python 3.7 as the base image, sets the working directory to /app, adds the current directory contents into the container at /app, and installs any necessary dependencies specified in a requirements.txt file. It then uses multi-stage builds to create a separate production image, and exposes port 80 for the API. The CMD instruction specifies the command to start uWSGI.

2. Containerization script:

```bash
#!/bin/bash

# Build the Docker image
docker build -t my-api .

# Run the Docker container
docker run -p 80:80 my-api
```

This script builds the Docker image using the Dockerfile in the current directory and tags it as "my-api". It then runs the Docker container, mapping port 80 in the container to port 80 on the host machine.