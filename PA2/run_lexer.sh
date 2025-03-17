#!/bin/sh

# Run gmake clean
gmake clean

# Build the lexer with custom CFLAGS
gmake CFLAGS="-g -Wall -Wno-unused -Wno-register -Wno-write-strings -I/var/tmp/cool/include/PA2" lexer

# Run the lexer with input file foo.cl
./lexer test.cl
