# BookRecommendService_MVC2_Project
도서 추천 및 평가 서비스


## 프로젝트 소개
사용자가 관심 있는 장르의 도서를 추천해 주고, 도서 별점 부여와 리뷰를 작성할 수 있습니다.

### 개발 기간
* 2023.09.13 - 2023.10.10

### 참여 인원
  - 임유빈: 메인 페이지, 도서 검색, 도서 추천, 도서 데이터 분석 및 시각화
  - 김락윤: 로그인, 회원가입, 아이디 비밀번호 찾기, 회원정보 변경, 리뷰 찜 기능

### 개발 환경
  - **Language**: Java 8
  - **JDK**: 1.8.0
  - **IDE**: Eclipse
  - **Model**: MVC2
  - **Database**: Oracle DB(11)

### 프로젝트 구조
  - src/book.test
  - WebContent/dataAnalysis
  - WebContent/login
  - WebContent/main
  - WebContent/mypage

### ERD
![BooksProjectTable](https://github.com/yubin-im/BookRecommendService_MVC2_Project/assets/140530127/e1809ea8-0f9f-495a-a7e4-0daf9e1ae588)

## 주요 기능
#### [회원가입](https://rakyun.notion.site/22ebd6cb2fb643469f76b738f6f3a0e2)
  - 가입 시 관심있는 장르 두가지 선택

#### [로그인](https://rakyun.notion.site/3ae0f86cb426490d8ba9f5baee728ebb)

#### [메인](https://rakyun.notion.site/7b4125add8764de9a10a6191356eb901)
  - 전체 도서 목록 출력
  - 도서 통합 검색

#### [도서 상세](https://rakyun.notion.site/5dd04cb170f24458a16660ea4afe14a1)
  - 도서 상세 출력
  - 도서 별점과 리뷰 작성
  - 도서 즐겨찾기

#### [추천도서](https://rakyun.notion.site/2c41dfb6d28a4d03b0a02ae997c637d6)
  - 가입 시 선택한 두 가지 장르의 도서 출력

#### [실시간 트렌드](https://rakyun.notion.site/8114f2a5b6a94d749735f39c83aa8833)
  - 리뷰 데이터 워드 클라우드
  - 장르 별 도서 수 그래프
  - 출간 연도 별 그래프

#### [마이페이지](https://rakyun.notion.site/3bdfb6e99e304167a292adc4a9d6f1d3)
  - 내가 작성한 리뷰 목록
  - 찜 목록

#### [회원정보 찾기](https://rakyun.notion.site/cfe9fea4542e4d80a02fb3dae5a0d4cf)
  - 아이디, 비밀번호 찾

#### [로그아웃](https://rakyun.notion.site/e9bbee0f9e864f4fb6dde7dfa305172d)
