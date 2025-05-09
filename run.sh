#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <사용할 언어>"
    exit 1
fi

if [ ! $1 == 'cpp' ] && [ ! $1 == 'py' ]; then
  echo "Not supported, Supported languages are [cpp, py]"
  exit 1
fi

current_dir=$(dirname "$0")
test_file="${current_dir}/test.txt"
answer_file="${current_dir}/answer.txt"
rst_file="${current_dir}/rst.txt"
if [ $1 == 'cpp' ]; then
  solve_file="${current_dir}/solve.cpp"
  out_file="${current_dir}/out"
elif [ $1 == 'py' ]; then
  solve_file="${current_dir}/solve.py"
  out_file="python3 ${solve_file}"
fi

if [ $1 == "cpp" ]; then
  g++ -std=c++14 -g -W -Wall -o $out_file $solve_file
elif [ $1 == "py" ]; then
  source "${current_dir}/clean/bin/activate"
fi

if [ $? -ne 0 ]; then
  exit 1
fi

# 파일 초기화
echo -n > $rst_file

iterations=$(head -n 1 $test_file)
cur=2
end=0
lines=0

for i in $(seq 1 $iterations); do
  lines=$(sed -n "${cur}p" $test_file)
  cur=$( expr $cur + 1 )
  end=$( expr $cur + $lines - 1 )
  sed -n "${cur},${end}p" $test_file \
    | $out_file \
    | sed -e 's/[[:space:]]*$//' \
    >> $rst_file

  tail -c 1 $rst_file \
  | grep -q '^$' || echo >> $rst_file
  cur=$( expr $cur + $lines )
done

if [ $? -ne 0 ]; then
  exit 1
fi

diff -c $rst_file $answer_file

if [ $? -eq 0 ]; then
  echo "모든 테스트 케이스들을 통과했습니다!"
  cat ${solve_file} | pbcopy
else
  echo "통과하지 못한 테스트 케이스가 존재합니다.."
fi

if [ $1 == "py" ]; then
  deactivate
fi
