#!/bin/bash

# Clone the repository containing the Dockerfile and dependencies
git clone https://github.com/nus-apr/auto-code-rover tmp_dockerfiles

# Navigate into the cloned directory
cd tmp_dockerfiles

# Build the Docker image
docker build -f Dockerfile -t my_custom_image .

# Clean up: Remove the cloned directory
cd ..
rm -rf tmp_dockerfiles

# Run the Docker container
docker run -it -e OPENAI_KEY="${OPENAI_KEY:-OPENAI_API_KEY}" -p 3000:3000 -p 5000:5000 my_custom_image
