#!/bin/sh

gmake clean

# Build the lexer with custom CFLAGS
gmake CFLAGS="-g -Wall -Wno-unused -Wno-register -Wno-write-strings -I/var/tmp/cool/include/PA2" lexer

./lexer test.cl
