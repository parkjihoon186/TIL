<<<<<<< HEAD
# 🐙 GitHub에 마크다운(.md) 파일 업로드하는 방법 정리

---

## ✅ 방법 1: Git 명령어로 업로드하기 (터미널 사용)

### 🔧 1. Git 초기 설정 (최초 1회만)

### bash를 쓴다 
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"

### 프로젝트 폴더 만들기 

2. 프로젝트 폴더 만들기 & 파일 준비
mkdir my-summary
cd my-summary
예: 정리.md 파일을 여기에 넣는다

 3. GitHub에서 저장소 만들기

GitHub 접속: https://github.com

오른쪽 상단 ➕ 클릭 → New repository

저장소 이름 입력 (예: markdown-summary)

README 체크 해제 → Create repository 클릭

생성된 URL 복사
예: https://github.com/yourname/markdown-summary.git

### 깃허브 명령어 입력 
git init
git remote add origin https://github.com/yourname/markdown-summary.git
git add .
git commit -m "깃허브에 올리는법"
git branch -M main
git push -u origin main

자주쓰는 깃허브 명령어 
| 명령어                           | 설명           |
| ----------------------------- | ------------ |
| `git init`                    | Git 저장소 초기화  |
| `git add .`                   | 모든 파일 추가     |
| `git commit -m "메시지"`         | 커밋 저장        |
| `git remote add origin [URL]` | GitHub 주소 등록 |
| `git push -u origin main`     | GitHub로 업로드  |


=======
# 🐙 GitHub에 마크다운(.md) 파일 업로드하는 방법 정리

---

## ✅ 방법 1: Git 명령어로 업로드하기 (터미널 사용)

### 🔧 1. Git 초기 설정 (최초 1회만)

### bash를 쓴다 
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"

### 프로젝트 폴더 만들기 

2. 프로젝트 폴더 만들기 & 파일 준비
mkdir my-summary
cd my-summary
예: 정리.md 파일을 여기에 넣는다

 3. GitHub에서 저장소 만들기

GitHub 접속: https://github.com

오른쪽 상단 ➕ 클릭 → New repository

저장소 이름 입력 (예: markdown-summary)

README 체크 해제 → Create repository 클릭

생성된 URL 복사
예: https://github.com/yourname/markdown-summary.git

### 깃허브 명령어 입력 
git init
git remote add origin https://github.com/yourname/markdown-summary.git
git add .
git commit -m "깃허브에 올리는법"
git branch -M main
git push -u origin main

자주쓰는 깃허브 명령어 
| 명령어                           | 설명           |
| ----------------------------- | ------------ |
| `git init`                    | Git 저장소 초기화  |
| `git add .`                   | 모든 파일 추가     |
| `git commit -m "메시지"`         | 커밋 저장        |
| `git remote add origin [URL]` | GitHub 주소 등록 |
| `git push -u origin main`     | GitHub로 업로드  |


>>>>>>> 34620858a00bedd27b346e4c695103ea388174f9
