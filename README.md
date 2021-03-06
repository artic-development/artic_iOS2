

# artic

![](./img/icon.png)

 **artic 아틱 : 주니어 실무자를 위한 아티클 큐레이션 서비스**

**개발 기간: 2019.7.1 ~ 2019.7.12**



## [Contributors]

* [정초이](https://github.com/iamcho2)
* [정윤혁](https://github.com/yooonhyuk)



## [Service Workflow]

![](./img/workflow.png)







# [Develop Environment]

- [![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)

- IOS Depolyment Target : **12.0**

  

# [Library]

#### Server

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Kingfisher](https://github.com/onevcat/Kingfisher)

#### Layout

- [Lottie-ios](https://github.com/airbnb/lottie-ios)

- [Taglistview](https://github.com/ElaWorkshop/TagListView)

  

# [Feature]



### ✅ 로그인

- [x] 로그인 뷰

- [x] 이메일로 로그인
  - [x] 이메일 형식에 맞는지 검사 (정규식)
  - [x] 비밀번호 블라인드 처리
  - [x] 로그인 통신
  - [x] 로그인 실패 시 (이메일 / 비밀번호 / 둘 다 맞지 않을 때) alert
- [ ] 페이스북 로그인



### ✅ 회원가입

- [x] 회원가입 뷰

- [x] 이메일 형식에 맞는지 검사 및 안내문 표시(정규식)
- [x] 비밀번호 형식 (영문, 숫자 포함 8자리 이상)에 맞는지 검사 및 안내문 표시(정규식)
- [x] 생일 형식에 맞는지 검사 및 안내문 표시(정규식)
- [x] 중복 가입 불가 alert
- [x] 회원가입 통신



### ✅ 홈

- [x] 홈 뷰

#### 검색 버튼

- [x] 검색 화면으로 이동

#### 새로운 아카이브

- [x] 새로운 아카이브 CollecitonView Cell

- [x] 새로운 아카이브 통신
- [x] 각 아카이브 셀 클릭시 아카이브 내 아티클 목록으로 이동

#### 새로운 아티클

- [x] 새로운 아티클 CollectionView Cell

- [x] 새로운 아티클 통신
- [x] 각 아티클 셀 클릭시 새로운 아티클 설명 뷰로 이동
- [x] 새로운 아티클 설명 뷰 통신

#### 최근 읽은 아티클

- [x] 최근 읽은 아티클 TableView Cell
- [x] 최근 읽은 아티클 통신
- [x] 각 아티클 셀 클릭시 해당 아티클 Safari 웹뷰로 이동

#### 아틱의 선택

- [ ] 아틱의 선택 CollecitonView Cell
- [ ] 아틱의 선택 통신
- [ ] 각 아티클 셀 클릭시 아틱의 선택 아티클 목록으로 이동

#### 카테고리별 아카이브

- [x] 카테고리별 아카이브 셀
- [x] 카테고리 개수만큼 section 증가
- [x] 카테고리별 아카이브 통신
- [ ] 각 아카이브 셀 클릭 시 아카이브 내 아티클 목록으로 이동



### ✅ 검색

- [x] 검색 뷰
- [x] 검색어 입력 후 검색 통신
- [x] 추천검색어 통신
- [x] 추천검색어 클릭 시 추천검색어로 검색 통신
- [x] 검색 후 검색 완료 뷰로 이동

- [x] 검색 완료 뷰
  - [x] 아카이브, 아티클 토글
  - [x] 검색어, 검색결과 개수 통신
  - [x] 아카이브 리스트 xib cell
  - [x] 아티클 리스트  xib cell
  - [x] 검색 완료 아카이브 통신
  - [x] 검색 완료 아티클 통신

- [x] 검색 완료 아카이브 셀 클릭 시 아카이브 내 아티클 목록으로 이동
- [x] 검색 완료 아티클셀 클릭 시 해당 아티클 Safari 웹뷰로 이동
- [ ] 검색 결과 empty view



### ✅ 카테고리

- [x] 카테고리 뷰
- [x] 카테고리 통신
- [x] 각 카테고리 셀 클릭 시 카테고리 내 아카이브 목록으로 이동
- [x] 각 아카이브 셀 클릭 시 아카이브 내 아티클 목록으로 이동



### ✅ 아카이브

- [x] 아카이브 타이틀 통신 구현
- [x] 아카이브에 담긴 아티클 통신
- [ ] 스크랩 통신
- [ ] 좋아요 통신



### ✅ 인앱 브라우저

- [x] SFSafariViewController 사용하여 인앱 브라우저 구현



### ✅ 담기

- [ ] 디폴트 이미지 아카이브 담기 버튼
- [x] 가로 스크롤
- [ ] 내 아카이브 불러오기 통신



### ✅ 아카이브 이름 작성

- [ ] 내 아카이브 이름 작성
- [ ] 내 아카이브 이름 작성 통신



### ✅ 알림 

- [ ] 알림 empty 뷰
- [x] 새로운 알림, 읽은 알림로 나뉜 섹션별로 알림 통신
- [x] 읽은 알림 체크 통신
- [ ] 알림이 몇분 전에 왔는지 시간 연산



### ✅ 마이 페이지(스크랩)

- [x] 스크랩한 아카이브 통신 구현(짝수일때)
- [x] 스크랩 탭 empty 뷰



### ✅ 마이 페이지

- [ ] 수정한 프로필 사진 통신 구현
- [ ] 나의 (새)아카이브 만들기 버튼



### ✅ 나의 아카이브

- [ ] 추가한 ''나의 아카이브''  통신 구현



### ✅ 설정

- [x] 프로필 수정화면으로 이동
- [ ] 로그아웃 버튼 초기화면으로 이동



### ✅ 프로필 수정

- [x] 프로필 사진 바꾸기 (갤러리,카메라 ACCESS)
- [x] 이름, 텍스트 수정시 각각 15자, 100자 제한
- [ ] 로그아웃하면 로그인 초기화면으로 이동



### ✅ 버전 정보

- [ ] 현재 버전 정보 불러오기

   

