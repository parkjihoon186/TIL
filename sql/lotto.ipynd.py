lotto.ipynd.py 
# URL URL -> 요청을 보낸다. -> 응답
https://www.google.com/search?q=naver



https://www.agoda.com/ko-kr/?site_id=1922887
&tag=f7739694-dbb7-41bd-aa27-be7c942ce354
&gad_source=1&gad_campaignid=21035050206&gbraid=0AAAAAD-GdVmjje62b6yVfqgUlt8lBhwGw&device=c&network=g
&adid=734266400825&rand=5809105302684493717
&expid=&adpos=&aud=kwd-6927948326&
gclid=CjwKCAjw7fzDBhA7EiwAOqJkhzMXrYAVS3vM3iW32jsFxon8DdzLL6rVgIFTsJ_-Zr4-tKMBBg2WqRoCiqcQAvD_BwE
&pslc=1
&ds=gSsLAoQwiSfZZ4bJ

import requests
URL ='https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1181'
res=request.get(url)
{
    "totSellamnt":3681782000,
    "returnValue":"success",
    "drwNoDate":"2002-12-07",
    "firstWinamnt":0,
    "drwtNo6":40,
    "drwtNo4":33,
    "firstPrzwnerCo":0,
    "drwtNo5":37,
    "bnusNo":16,
    "firstAccumamnt":863604600,
    "drwNo":1,
    "drwtNo2":23,
    "drwtNo3":29,
    "drwtNo1":10}


{
    "totSellamnt":113802682000,
    "returnValue":"success",
    "drwNoDate":"2025-07-19",
    "firstWinamnt":1593643500,
    "drwtNo6":41,
    "drwtNo4":20,
    "firstPrzwnerCo":17,
    "drwtNo5":33,
    "bnusNo":28,
    "firstAccumamnt":27091939500,
    "drwNo":1181,
    "drwtNo2":10,
    "drwtNo3":14,
    "drwtNo1":8
                }
#1.data 에서 real_numbers 를 뽑느다.
real_number= [
    data['drwtNO1'],
    data['drwtN02'],
    data['drwtN03'],
    # 더 좋은 방법없나..?
]
bonus = data['bnusNO']

#2. real_numbers + 보너스와 my_numbers를 비교하여 등수 확인
'''
1등 6개 같음
2등 5개가 같고, 나머지 한개가 보너스번호
3등 5개 같음
4등 4개 같음
5등 3개 같음
꽝
'''
# 3. 등수를 뽑아주는 함수를 만들어보자 