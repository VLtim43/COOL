#!/bin/sh

# Run gmake clean
gmake clean

# Build the lexer
gmake lexer

# Run the lexer with input file foo.cl
./lexer foo.cl
