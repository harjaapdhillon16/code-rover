#!/bin/bash

# Set the OPENAI_KEY environment variable
export OPENAI_KEY=sk-YOUR-OPENAI-API-KEY-HERE

# Clone the AutoCodeRover repository
git clone https://github.com/nus-apr/auto-code-rover /opt/auto-code-rover

# Navigate to the AutoCodeRover directory
cd /opt/auto-code-rover

# Activate the conda environment
conda activate auto-code-rover

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --task-id)
        TASK_ID="$2"
        shift
        shift
        ;;
        --clone-link)
        CLONE_LINK="$2"
        shift
        shift
        ;;
        --commit-hash)
        COMMIT_HASH="$2"
        shift
        shift
        ;;
        --issue-link)
        ISSUE_LINK="$2"
        shift
        shift
        ;;
        *)
        shift
        ;;
    esac
done

# Run AutoCodeRover command
PYTHONPATH=. python app/main.py github-issue \
    --output-dir output \
    --setup-dir setup \
    --model gpt-4-0125-preview \
    --model-temperature 0.2 \
    --task-id "$TASK_ID" \
    --clone-link "$CLONE_LINK" \
    --commit-hash "$COMMIT_HASH" \
    --issue-link "$ISSUE_LINK" \
    --repo "$1" \
    --issue-title "$2" \
    --issue-body "$3"
