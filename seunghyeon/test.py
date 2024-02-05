import requests
import sys,re
from bs4 import BeautifulSoup
url_arr=[]
title_arr=[]
for a in range(3):
    value = a*10
    url = 'https://www.yu.ac.kr/main/intro/yu-news.do?mode=list&article.offset='+str(value)

    response = requests.get(url)

    soup = BeautifulSoup(response.text, 'html.parser') 

    title = soup.select('div.b-title-box > a') #각 타이틀 가져오기


    for t in title:
        title_arr.append(t.get_text()[1:-1]) #타이틀 저장
        href=t.attrs['href'] #href태그 내용 가져오기
        url_arr.append('https://www.yu.ac.kr/main/intro/yu-news.do'+str(href)) #크롤링한 주소 완전하게 만들어주기
    
    #print(cell_line)

print(url_arr[0])

url = url_arr[0] #첫번째 영대소식의 주소
print(title_arr)

response = requests.get(url)
soup = BeautifulSoup(response.text,'html.parser')
content = soup.select('div.b-content-box>div.fr-view') #내용 가져오기

print(str(content)[1:-1]) #내용 확인 (대괄호가 포함되기 때문에 제거하기 위해 [1:-1] 추가함)
orig_stdout = sys.stdout #현재 출력 저장하기
f=open('seunghyeon/content.md','w',encoding='UTF-8') #파일 열기
sys.stdout=f #출력 파일로 바꾸기
print(str(content)[1:-1]) #파일에 출력
f.close()
f=open('seunghyeon/title.txt','w',encoding='UTF-8')
sys.stdout=f
print(title_arr)
f.close()
f=open('seunghyeon/url.txt','w',encoding='UTF-8')
sys.stdout=f
print(url_arr)
sys.stdout=orig_stdout #출력 원래대로 돌리기
f.close() #파일 닫기