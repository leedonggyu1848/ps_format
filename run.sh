#!/bin/bash

current_dir=$(dirname "$0")

g++ -std=c++14 -g -W -Wall -o out solve.cpp
if [ $? -ne 0 ]; then
  exit 1
fi

# 파일 초기화
echo -n > rst

iterations=$(head -n 1 ${current_dir}/test.txt)
cur=2
end=0
lines=0

for i in $(seq 1 $iterations); do
  lines=$(sed -n "${cur}p" ${current_dir}/test.txt)
  cur=$( expr $cur + 1 )
  end=$( expr $cur + $lines - 1 )
  sed -n "${cur},${end}p" ${current_dir}/test.txt \
    | ${current_dir}/out \
    | sed 's/[[:space:]]*$//' \
    >> ${current_dir}/rst
  if [ -n "$(tail -n 1 ${current_dir}/rst)" ]; then
    printf "\n" >> ${current_dir}/rst
  fi
  cur=$( expr $cur + $lines )
done

if [ $? -ne 0 ]; then
  exit 1
fi

diff -c ${current_dir}/rst ${current_dir}/answer.txt
