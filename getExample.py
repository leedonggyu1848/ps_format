import sys
import requests
from bs4 import BeautifulSoup

if len(sys.argv) != 2:
    print('Usage: python getExample.py [문제번호]')
    sys.exit(1)
if not sys.argv[1].isdigit():
    print('ERR: 문제 번호는 숫자로 입력해주세요.')
    sys.exit(1)

problem = sys.argv[1]

user_agent = {"user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36"}
url = "https://www.acmicpc.net/problem/"

try:
    res = requests.get(url+problem, headers=user_agent)
    bs = BeautifulSoup(res.text, "html.parser")
    example = bs.find_all('pre', {'class':'sampledata'})
    input_data_list = example[0::2]
    output_data_list = example[1::2]
except Exception as e:
    print('ERR: 문제를 찾을 수 없습니다. 문제번호: ', problem)
    print(f"    cause=> {e}")
    sys.exit(1)

def cleaning(s):
    rst = s.replace('\r\n', '\n').replace('\r', '\n').rstrip()
    if rst[-1] != '\n':
        rst += '\n'
    return rst

try :
    with open("answer.txt", 'w') as answer:
        with open("test.txt", 'w') as test:
            test.write(str(len(input_data_list)) + '\n')
            for input_data, output_data in zip(input_data_list, output_data_list):
                input_text = cleaning(input_data.text)
                output_text = cleaning(output_data.text)

                test.write(str(input_text.count('\n')) + '\n')
                test.write(input_text)
                answer.write(output_text)
except Exception as e:
    print('ERR: 파일을 생성할 수 없습니다.')
    print(f"    cause=> {e}")
    sys.exit(1)
