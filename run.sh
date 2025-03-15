#!/bin/bash

g++ -std=c++14 -g -W -Wall -o out solve.cpp && cat test.txt \
  | ./out > rst && diff -c rst answer.txt
