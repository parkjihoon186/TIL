🧠 파이썬 문법 정리 + 응용 예제 코드 (Markdown)
✅ 1. replace() 함수
기능: 문자열에서 특정 문자를 다른 문자로 교체

문법:

python
복사
편집
문자열.replace("바꿀문자", "새문자")
예시:

python
복사
편집
s = "전치100주"
print(s.replace("전치", "").replace("주", ""))  # 출력: '100'
✅ 2. str() 함수
기능: 숫자를 문자열로 변환

문법:

python
복사
편집
str(숫자)
예시:

python
복사
편집
num = 581
s = str(num)
print(s[0], s[1], s[2])  # 출력: 5 8 1
✅ 3. while 반복문
기능: 조건이 참일 때 반복 수행

문법:

python
복사
편집
while 조건:
    실행할_코드
✅ 4. pass 키워드
기능: "아무것도 하지 않고" 그냥 넘김 (자리 채우기용)

문법:

python
복사
편집
if 조건:
    pass  # 아직 구현 안 함
✅ 5. continue & break
키워드	설명
continue	반복문 안에서 다음 반복으로 건너뜀
break	반복문 강제 종료

✅ 6. f-string (문자열 안에 변수/표현식 넣기)
문법:

python
복사
편집
name = "지훈"
print(f"{name} 안녕!")
✅ 7. int() 함수
기능: 문자열을 숫자로 변환

문법:

python
복사
편집
int("100")  # 100
✍️ 너가 응용해서 짠 코드 (마크다운 형식)
🧩 부상 주수에 따른 멘트 출력
python
복사
편집
num = '전치100주'
week = int(num.replace('전치', '').replace('주', ''))

if week >= 4:
    result = '망할 근육 녹겠다!!'
elif week >= 3:
    result = '아 쉬자'
else:
    result = '조금만 더 힘내자'

print(result)
🔁 숫자 각 자릿수 while로 출력
python
복사
편집
num = 581
num_str = str(num)

i = 0
while i < len(num_str):
    print(num_str[i])  # 각 자리 출력
    i += 1
🧮 자리수 합 while로 구하기
python
복사
편집
num = 581
num_str = str(num)

i = 0
total = 0
while i < len(num_str):
    total += int(num_str[i])
    i += 1

print("합계:", total)
👤 나이 리스트에서 성인만 출력 (continue 사용)
python
복사
편집
ages = [17, 21, 15, 33, 19, 25]

for age in ages:
    if age < 20:
        continue  # 미성년자 스킵
    print(f"{age}살은 성인입니다")
🔄 pass 단독 사용 (while문)
python
복사
편집
while True:
    pass  # 무한히 아무것도 안 함 (멈추려면 Ctrl+C)
✅ 마무리 요약
문법	핵심 기능	자주 쓰는 상황
replace()	문자 바꾸기	문자열 전처리
str()	숫자 → 문자열	자리수 꺼낼 때
int()	문자열 → 숫자	계산하려고
while	반복	조건 반복
pass	비워둘 때	함수, 조건, 반복문 설계 중
continue	다음 반복으로 건너뜀	필터링할 때
break	반복문 종료	무한루프 탈출
f-string	문자열 안에 변수 넣기	출력문 만들 때