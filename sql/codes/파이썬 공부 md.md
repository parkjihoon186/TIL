

# 파이썬 기초 강의 정리 (3~19강)

---

## 3. 자료형 (Data Types)

- 기본 자료형: `int`, `float`, `str`, `bool`
- 예시:

```python
a = 10          # int
b = 3.14        # float
c = "hello"     # str
d = True        # bool
4. 변수 (Variables)
값을 저장하는 공간

변수명은 문자, 숫자, 밑줄(_) 조합 (숫자로 시작하면 안 됨)

python
복사
편집
x = 5
name = "지훈"
5. 변수 이름 (Variable Naming)
변수명 규칙:

영문, 숫자, 밑줄 사용 가능

숫자로 시작 불가

예약어 사용 불가 (if, for, while 등)

권장 스타일: 소문자와 밑줄 (snake_case)

6. 형 변환 (Type Conversion)
타입 변환 함수: int(), float(), str(), bool()

python
복사
편집
num_str = "123"
num_int = int(num_str)    # 문자열 -> 정수

f = 3.14
i = int(f)                # 실수 -> 정수 (소수점 버림)

b = bool(0)               # False
7. 연산자 (Operators)
산술: +, -, *, /, //(몫), %(나머지), **(거듭제곱)

비교: ==, !=, <, >, <=, >=

논리: and, or, not

python
복사
편집
a = 5 + 3 * 2    # 11
b = 10 // 3      # 3
c = (a > b) and (b < 5)  # True
8. 불리안 (Boolean)
True 또는 False

조건문, 논리 연산에서 사용

python
복사
편집
is_adult = True
print(type(is_adult))   # <class 'bool'>
9. 주석 (Comments)
코드 설명용

한 줄 주석: #

여러 줄 주석: ''' ... ''' 또는 """ ... """

python
복사
편집
# 이것은 주석입니다
print("Hello")  # 출력문
10. 인덱스와 슬라이싱 (Indexing & Slicing)
인덱스: 0부터 시작, 음수는 뒤에서부터 세기

python
복사
편집
text = "python"
print(text[0])    # 'p'
print(text[-1])   # 'n'
슬라이싱: [start:end] (end는 포함하지 않음)

python
복사
편집
print(text[1:4])  # 'yth'
print(text[:3])   # 'pyt'
print(text[3:])   # 'hon'
11. 문자열 처리 (String Handling)
문자열은 불변(immutable)

문자열 연결: +, 반복: *

python
복사
편집
a = "hello"
b = "world"
print(a + " " + b)   # hello world
print(a * 3)         # hellohellohello
12. 문자열 메소드 1 (String Methods 1)
.lower(), .upper(), .strip(), .split()

python
복사
편집
s = "  Hello World  "
print(s.lower())         # hello world
print(s.upper())         # HELLO WORLD
print(s.strip())         # "Hello World"
print(s.split())         # ['Hello', 'World']
13. 문자열 메소드 2 (String Methods 2)
.find(), .replace(), .startswith(), .endswith()

python
복사
편집
s = "apple banana apple"
print(s.find("banana"))       # 6 (첫 위치)
print(s.replace("apple", "kiwi"))  # kiwi banana kiwi
print(s.startswith("app"))    # True
print(s.endswith("ple"))      # True
14. 문자열 포맷 (String Formatting)
.format() 메서드 사용

python
복사
편집
name = "지훈"
age = 25
print("이름: {}, 나이: {}".format(name, age))
print("이름: {name}, 나이: {age}".format(name=name, age=age))
print(f"이름: {name}, 나이: {age}")   # f-string (파이썬 3.6 이상)
15. 탈출 문자 (Escape Characters)
특수 문자 삽입 시 사용

문자	의미
\n	줄바꿈
\t	탭 (띄어쓰기)
\\	백슬래시
\'	작은 따옴표

python
복사
편집
print("안녕하세요\n파이썬입니다")
print("탭\t예제")
16. 리스트 1 (List 1)
여러 값 담는 가변 자료형

대괄호 [] 사용

python
복사
편집
lst = [1, 2, 3, 4]
print(lst[0])     # 1
lst.append(5)     # 값 추가
print(lst)        # [1, 2, 3, 4, 5]
17. 리스트 2 (List 2)
슬라이싱 가능

삭제: del, remove()

python
복사
편집
lst = [10, 20, 30, 40, 50]
print(lst[1:4])   # [20, 30, 40]
del lst[2]        # 인덱스 2 삭제
lst.remove(40)    # 값 40 삭제
print(lst)        # [10, 20, 50]
18. 튜플 1 (Tuple 1)
리스트와 비슷하지만 불변(immutable)

소괄호 () 사용

python
복사
편집
t = (1, 2, 3)
print(t[0])     # 1
19. 튜플 2 (Tuple 2)
튜플 언패킹 가능

python
복사
편집
t = ('apple', 'banana', 'orange')
a, b, c = t
print(a)  # apple
print(b)  # banana
print(c)  # orange
* 사용해 가변 언패킹 가능

python
복사
편집
fruits = ('apple', 'banana', 'orange', 'grape')
first, *rest = fruits
print(first)   # apple
print(rest)    # ['banana', 'orange', 'grape']