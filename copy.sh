#!/bin/bash

current_dir=$(dirname "$0")
solve_cpp="${current_dir}/solve.cpp"

cat $solve_cpp | pbcopy

