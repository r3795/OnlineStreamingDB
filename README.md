# 💻 OnlineStreamingDB
  - 온라인 스트리밍 사이트 DB

## ⌚ Project Period
  - 2021.09 ~ 2021.12

## 🛠 Development Environment
  -  Tool : ![Visual Studio Code](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)
  -  Language : ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)

## 요구사항 명세서
* 온라인 스트리밍 서비스 사이트에는 컨텐츠를 공급하는 제작자와 
  제공받은 컨텐츠를 이용하는 시청자가 있다.

* 제작자는 컨텐츠를 공급하기 위해 제작자 아이디, 프로그램명, 대표자를 표기해야 한다.
* 제작자는 제작자 아이디로 식별한다.
* 제작자는 각 컨텐츠를 공동 제작이 아닌, 단일 제작한다.
* 제작자는 서비스 품질 향상을 위해 주기적으로 자체 관리를 실시한다.

* 시청자는 컨텐츠를 이용하려면 시청자 아이디, 비밀번호, 성별, 나이, 주소를 
  입력해야 한다.
* 시청자는 시청자 아이디로 식별한다.

* 현재 웹사이트 내의 컨텐츠는 영화, 드라마, 예능이 제공되고 있다.
* 영화는 영화등록번호, 영화제목, 감독, 관람등급, 개봉년도, 상영시간을 가지고 있으며 
  시청자가 해당 영화를 시청할 시 시청시간을 기록한다.
* 영화는 영화등록번호로 식별한다.

* 드라마는 드라마등록번호, 드라마명, 장르, 시청등급, 회차정보를 가지고 있으며 
  시청자가 해당 드라마를 시청할 시 시청시간을 기록한다.
* 드라마는 드라마등록번호로 식별한다.

* 예능은 예능등록번호, 예능명, 연출자, 출연자수, 방송사정보를 가지고 있으며 
  시청자가 해당 예능을 시청할 시 시청시간을 기록한다.
* 예능은 예능등록번호로 식별한다.

* 시청자는 동 시간에 여러 컨텐츠의 시청시간을 소유할 수 있고, 컨텐츠는 여러 시청자에게 
  시청될 수 있다.

* 멤버십은 멤버십번호, 등급, 혜택, 가격으로 분류된다.
* 멤버십은 멤버십번호로 식별한다.
* 각 멤버십은 차등 혜택에 따라 가격이 달라진다.
* 혜택은 다양한 종류가 있을 수 있다.
* 회원탈퇴 시 멤버십 정보는 더 이상 관리하지 않는다.

* 사이트 내에 후기를 남길 수 있으며 후기는 시청자아이디, 프로그램명, 평점, 추천여부, 
  작성일자로 이루어진다.
* 후기는 시청자 아이디로 식별하며, 시청자는 여러 후기를 남길 수 있다.
* 이렇게 기록된 후기는 추 후 제작사가 확인하며 참고한다.
* 제작자는 또한, 시청자로 구성되어 컨텐츠를 이용할 수 있다.
  
## 개념적 데이터 모델링 (ER 다이어그램)
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/eb53a025-8abf-4e88-99ea-3555678b46b0)

## 논리 모델링
### ER 다이어 그램을 관계 데이터 모델로 변환
* 제작자(**제작자아이디**, 프로그램명, 대표자, 시청자아이디(FK)) 
* 관리(**피관리제작자아이디(FK), 관리제작자아이디(FK)**)
* 시청자(**시청자아이디**, 비밀번호, 성별, 나이, 주소)
* 영화(**영화등록번호**, 영화제목(FK), 감독, 관람등급, 개봉년도, 상영시간, 제작자아아디(FK))
* 영화시청(**영화등록번호(FK), 시청자아이디(FK)**, 영화시청시간)
* 드라마(**드라마등록번호**, 드라마명(FK), 장르, 시청등급, 회차정보, 제작자아아디(FK))
* 드라마시청(**드라마등록번호(FK)시청자아이디(FK)**, 드라마시청시간)
* 예능(**예능등록번호**, 예능명(FK), 연출자, 출연자, 방송사정보, 제작자아이디(FK))
* 예능시청(**예능등록번호(FK)시청자아이디(FK)**, 예능시청시간)
* 멤버십(**시청자아이디(FK), 멤버십번호**, 등급, 가격)
* 후기(**시청자아이디(FK), 프로그램명(FK)**, 평점, 추천여부, 작성일자)
* 멤버십혜택(**시청자아이디(FK), 멤버십번호(FK), 혜택**)

## DML INSERT 데이터 삽입
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/6bd05da3-82ff-430b-b34f-699f4d4b9cf0)

### 상세 코드 소스 참조

## DML 검색 
**1. 후기의 모든 속성 검색<**br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/c7d3e011-f915-440c-a214-fe2d513443b8)


**2. 시청자 중 제작자가 아닌 인원의 시청자아이디 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/ea2b56ca-710a-471e-9491-71255a2ee651)


**3. 제작자 중 드라마를 시청한 인원의 대표자이름과 드라마명 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/efd81210-8933-407e-901e-1d74c9596697)


**4. 영화를 제작한 제작자 중 시청자로 등록한 인원의 시청자아이디 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/8ed42e14-2ddd-495d-88c5-470f1f35b6c3)


**5. 전체 시청자 중 멤버십을 가입한 시청자의 아이디, 혜택 검색** (미가입자는 아이디만 출력)<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/8a77963d-aa79-46ad-a15e-57e99812baca)


**6. 예능과 드라마를 둘다 시청한 시청자의 아이디, 각 시청시간 검색 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/f246ced9-e05d-45bf-9029-8dfb73a7e652)


**7. 다른 제작자를 관리해주는 동시에 관리를 받는 제작자의 제작자아이디 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/03d64fb4-5ef9-4a11-9361-1286b274f3da)


**8. 아이디가 fqe2347인 시청자의 시청했던 드라마등록번호와 드라마명 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/108e599b-621e-4eeb-8891-e2143b4d8ed8)


**9. 드라마를 시청한 시청자 중 드라마를 2개 미만으로 시청한 시청자의 시청자아이디와 
   시청횟수 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/7bd86cb8-168e-4a87-aabb-e79515d2bc60)


**10. 멤버십을 구매하지 않은 시청자가 시청한 예능명 검색**<br>
![image](https://github.com/r3795/OnlineStreamingDB/assets/105268338/8031fece-1f93-4ba8-aa07-80bd34cbe292)
