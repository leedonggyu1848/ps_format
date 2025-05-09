#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <문제 번호>"
    exit 1
fi

MODULES=("requests" "bs4")

for module in "${MODULES[@]}"; do
    python3 -c "import $module" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "python에 '$module'이(가) 설치되어 있지 않습니다."
        read -p "'$module'을(를) 설치하시겠습니까? (y/n): " choice
        if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
          echo "$module 설치 중..."
          pip3 install "$module"
        else
          echo "'$module'을(를) 설치하지 않아 종료됩니다."
          exit 1
        fi
    fi
done

python3 getExample.py $1

if [ $? -ne 0 ]; then
	exit 1
fi

cp template.cpp solve.cpp
echo 'import sys
input = sys.stdin.readline
'> solve.py

