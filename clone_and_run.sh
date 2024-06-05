#!/bin/bash

# Clone the repository containing the Dockerfile and dependencies
git clone https://github.com/nus-apr/auto-code-rover tmp_dockerfiles

# Navigate into the cloned directory
cd tmp_dockerfiles

# Build the Docker image
docker build -f Dockerfile -t my_custom_image .

# Run the Docker container in detached mode
docker run -d -e OPENAI_KEY="${OPENAI_KEY:-OPENAI_API_KEY}" -p 3000:3000 -p 5000:5000 my_custom_image
conda init
conda activate auto-code-rover

# # Parse command-line arguments
# while [[ $# -gt 0 ]]; do
#     key="$1"
#     case $key in
#         --task-id)
#         TASK_ID="$2"
#         shift
#         shift
#         ;;
#         --clone-link)
#         CLONE_LINK="$2"
#         shift
#         shift
#         ;;
#         --commit-hash)
#         COMMIT_HASH="$2"
#         shift
#         shift
#         ;;
#         --issue-link)
#         ISSUE_LINK="$2"
#         shift
#         shift
#         ;;
#         *)
#         shift
#         ;;
#     esac
# done

# # Run AutoCodeRover command
# PYTHONPATH=. python app/main.py github-issue \
#     --output-dir output \
#     --setup-dir setup \
#     --model gpt-4-0125-preview \
#     --model-temperature 0.2 \
#     --task-id "$TASK_ID" \
#     --clone-link "$CLONE_LINK" \
#     --commit-hash "$COMMIT_HASH" \
#     --issue-link "$ISSUE_LINK" \
