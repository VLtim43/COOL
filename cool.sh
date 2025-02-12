#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILENAME="$1"
BASENAME="${FILENAME%.*}"

if [ -f "${BASENAME}.s" ]; then
    rm "${BASENAME}.s"
fi

# Compile with coolc
coolc "$FILENAME"
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# Run with spim
spim -file "${BASENAME}.s"
