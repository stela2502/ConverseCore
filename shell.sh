#!/bin/bash

# Variables
SANDBOX_DIR="ConverseCore"
SCRIPT=$(readlink -f $0)
SANDBOX_PATH=`dirname $SCRIPT`

# Check if the sandbox directory exists
if [ ! -d "${SANDBOX_PATH}/${SANDBOX_DIR}" ]; then
    echo "Error: Sandbox directory ${SANDBOX_DIR} not found in ${SANDBOX_PATH}."
    exit 1
fi

# Open a shell in the sandbox
echo "Entering sandbox ${SANDBOX_DIR}..."
#sudo apptainer shell   -B ~/.ollama:/app/ollama --writable "${SANDBOX_PATH}/${SANDBOX_DIR}"
#sudo apptainer shell -B /mnt/data1 -B /mnt/data2 --writable "${SANDBOX_PATH}/${SANDBOX_DIR}"

sudo apptainer shell -B /mnt/data1 -B /mnt/data2 -B ~/.ollama:/app/ollama --writable "${SANDBOX_PATH}/${SANDBOX_DIR}"

