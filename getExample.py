import requests
from bs4 import BeautifulSoup

user_agent = {"user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36"}
url = "https://www.acmicpc.net/problem/"

ploblem = input('문제 번호: ')

res = requests.get(url+ploblem, headers=user_agent)
bs = BeautifulSoup(res.text, "html.parser");
example = bs.find_all('pre', {'class':'sampledata'})
input_data_list = example[0::2]
output_data_list = example[1::2]

with open("answer.txt", 'w') as answer:
    with open("test.txt", 'w') as test:
        test.write(str(len(input_data_list)) + '/')
        for input_data, output_data in zip(input_data_list, output_data_list):
            answer.write(output_data.text)
            test.write(input_data.text)

