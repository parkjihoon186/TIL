
git init

git config -- global user.name
git config --global user.email

git add<file name>
git add.

git commot -m'<message>'
<!--지금 TIL은 remote add origin 할필요없음 -> clone 했기 때문
-->
git remote add origin <url>

git push origin main 

git status

git clone <url>

# Git 기본 명령어 정리

- `git init`  
 현재 디렉토리를 새로운 Git 저장소로 초기화합니다.

- `git config --global user.name "<이름>"`  
  전역적으로 사용자 이름을 설정합니다.

- `git config --global user.email "<이메일>"`  
  전역적으로 사용자 이메일을 설정합니다.

- `git add <파일명>`  
  특정 파일을 스테이징 영역에 추가합니다.

- `git add .`  
  현재 디렉토리의 모든 변경 파일을 스테이징 영역에 추가합니다.

- `git commit -m "<메시지>"`  
  스테이징된 변경사항을 커밋하고, 메시지를 남깁니다.

- `git remote add origin <url>`  
  원격 저장소(origin)를 추가합니다.  
  > 이미 `git clone`으로 저장소를 복제했다면 이 명령은 필요 없습니다.

- `git push origin main`  
  로컬의 main 브랜치를 원격 저장소(origin)에 푸시합니다.

- `git status`  
  현재 작업 디렉토리와 스테이징 영역의 상태를 확인합니다.

- `git clone <url>`  
  원격 저장소를 복제하여 로컬에 저장소를 만듭니다.