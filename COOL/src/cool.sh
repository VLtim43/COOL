#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILENAME="$1"
BASENAME="${FILENAME%.*}"

# Remove existing .s file if it exists
if [ -f "${BASENAME}.s" ]; then
    rm "${BASENAME}.s"
fi

# Ensure cleanup on script exit
cleanup() {
    if [ -f "${BASENAME}.s" ]; then
        rm "${BASENAME}.s"
        # echo "[ Deleted ${BASENAME}.s ]"
    fi
}
trap cleanup EXIT

# Compile with coolc
coolc "$FILENAME atoi.cl"
if [ $? -ne 0 ]; then
    echo "[ Compilation failed :( ]"
    exit 1
fi

# Run with spim
spim -file "${BASENAME}.s"
