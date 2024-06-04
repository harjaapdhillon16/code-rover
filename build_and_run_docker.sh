#!/bin/bash

# Build the Docker image
docker build -f Dockerfile -t acr .

# Run the Docker container
docker run -it -e OPENAI_KEY="${OPENAI_KEY:-OPENAI_API_KEY}" -p 3000:3000 -p 5000:5000 acr
