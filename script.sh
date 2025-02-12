#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: cool <file.cl>"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="${INPUT_FILE%.cl}.s"

# Compile with coolc
/var/temp/cool/bin/coolc "$INPUT_FILE"
if [ $? -ne 0 ]; then
    echo "Error on compilation"
    exit 1
fi

# Run with spim
/var/temp/cool/bin/spim -file "$OUTPUT_FILE"
