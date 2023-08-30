drop table Membershipbenefit;
drop table Membership;
drop table Review;
drop table Entertainmentview;
drop table Entertainment;
drop table Dramaview;
drop table Drama;
drop table Movieview;
drop table Movie;
drop table Makermanagement;
drop table Maker;
drop table Viewer;

create table Viewer (
viewer_id varchar2(30) primary key, -- 시청자아이디
viewer_pwd varchar2(30) not null, -- 비밀번호, 필수 입력
viewer_gender char(5), -- 성별
viewer_age number(3), -- 나이
viewer_address varchar2(30), -- 주소
check(viewer_gender = 'woman' or viewer_gender = 'man'), -- 여성 ,남성 표기
check(viewer_address like '%-%') -- 주소 입력 방식 설정
);

create table Maker (
maker_id varchar2(30) primary key, -- 제작자아이디
program_name varchar2(30) unique not null, -- 프로그램명, 유일성, 필수 입력
ceo_name varchar2(30) not null, -- 대표자, 필수 입력
makerview_id varchar2(30) -- 시청자아이디(FK)
);

create table Makermanagement (
target_manager varchar2(30), -- 피관리자아이디(FK)
check_manager varchar2(30), -- 관리자아이디(FK)
CONSTRAINT Makermanagement_pk primary key(target_manager, check_manager)-- 기본키 별도 지정
);

create table Movie (
movie_number varchar2(30) primary key, -- 영화등록번호
movie_name varchar2(30) not null, -- 영화제목 -> 프로그램명(FK), 필수 입력
movie_director varchar2(30), -- 감독
movie_agelevel number(2), -- 관람등급
movie_release date, -- 개봉년도
movie_runningtime  varchar2(8), -- 상영시간
moviemaker_id varchar2(30), -- 제작자아이디(FK)
check(movie_runningtime like '%:%:%') -- 상영시간 입력 방식 설정
);

create table Movieview (
movieview_number varchar2(30), -- 영화등록번호(FK)
movieview_id varchar2(30), -- 시청자아이디(FK)
movieview_time varchar2(30), -- 영화시청시간
CONSTRAINT Movieview_pk primary key(movieview_number, movieview_id) -- 기본키 별도 지정
);

create table Drama (
drama_number varchar2(30) primary key, -- 드라마등록번호
drama_name varchar2(30) not null, -- 드라마명 -> 프로그램명(FK), 필수 입력
drama_genre varchar2(10), -- 장르
drama_agelevel number(2), -- 시청등급
drama_episodeinfo varchar2(30), -- 회차정보
dramamaker_id varchar2(30) -- 제작자아이디(FK)
);

create table Dramaview (
dramaview_number varchar2(30), -- 드라마등록번호(FK)
dramaview_id varchar2(30), -- 시청자아이디(FK)
dramaview_time varchar2(30), -- 드라마시청시간
CONSTRAINT Dramaview_pk primary key(dramaview_number, dramaview_id) -- 기본키 별도 지정
);

create table Entertainment (
entertainment_number varchar2(30) primary key, -- 예능등록번호
entertainment_name varchar2(30) not null, -- 예능명 -> 프로그램명(FK), 필수 입력
entertainment_director varchar2(10), -- 연출자
entertainment_cast number(2), -- 출연자수
entertainment_broadcastinfo varchar2(30), -- 방송사정보
entertainmentmaker_id varchar2(30) -- 제작자아이디(FK)
);

create table Entertainmentview (
entertainmentview_number varchar2(30), -- 예능등록번호(FK)
entertainmentview_id varchar2(30), -- 시청자아이디(FK)
entertainmentview_time varchar2(30), -- 예능시청시간
CONSTRAINT Entertainmentview_pk primary key(entertainmentview_number, entertainmentview_id) -- 기본키 별도 지정
);

create table Membership (
membershipviewer_id varchar(30), -- 시청자아이디(FK)
membership_number varchar(30), -- 멤버십번호
membership_grade char(1) NOT NULL, -- 등급, 필수 입력
membership_price number(5) NOT NULL, -- 가격, 필수 입력
CONSTRAINT Membership_pk primary key(membershipviewer_id, membership_number), -- 기본키 별도 지정
check(membership_price >= 8000 or membership_price <= 20000) -- 금액적정선 설정
);

create table Review (
reviewviewer_id varchar2(30), -- 시청자아이디(FK)
review_rating number(1) NOT NULL, -- 평점, 필수 입력
review_choice char(1), -- 추천여부
review_date date, -- 작성일자
reviewprogram_name varchar2(30), -- 프로그램명(FK)
CONSTRAINT Review_pk primary key(reviewviewer_id, reviewprogram_name), -- 기본키 별도 지정
check (review_rating > 0 and review_rating <= 5), -- 평점 적정선 설정
check (review_choice = 'O' or review_choice = 'X') -- 추천여부 표기
);

create table Membershipbenefit (
membershipviewer_id varchar(30), -- 시청자아이디(FK)
membership_number varchar(30), -- 멤버십번호(FK)
membership_benefit varchar(30) NOT NULL, -- 혜택, 필수 입력
CONSTRAINT Membershipbenefit_pk primary key(membershipviewer_id, membership_number, membership_benefit)
);

alter table Maker
add foreign key(makerview_id) references Viewer(viewer_id);
-- 제작자의 시청자아이디가 시청자의 시청자아이디를 외래키로 설정
alter table Makermanagement
add foreign key(target_manager) references Maker(maker_id);
alter table Makermanagement
add foreign key(check_manager) references Maker(maker_id);
-- 관리의 피관리자아이디,관리자아이디가 제작자의 제작자아이디를 외래키로 설정(순환관계)
alter table Movie
add foreign key(moviemaker_id) references Maker(maker_id);
alter table Movie
add foreign key(movie_name) references Maker(program_name);
-- 영화 테이블이 제작자아이디와 프로그램명을 외래키로 설정

alter table Movieview
add foreign key(movieview_number) references Movie(movie_number);
alter table Movieview
add foreign key(movieview_id) references Viewer(viewer_id);
-- 영화시청 테이블이 영화등록번호와 시청자아이디를 외래키로 설정
alter table Drama
add foreign key(dramamaker_id) references Maker(maker_id);
alter table Drama
add foreign key(drama_name) references Maker(program_name);
-- 드라마 테이블이 제작자아이디와 프로그램명을 외래키로 설정
alter table Dramaview
add foreign key(dramaview_number) references Drama(drama_number);
alter table Dramaview
add foreign key(dramaview_id) references Viewer(viewer_id);
-- 드라마시청 테이블이 드라마등록번호와 시청자아이디를 외래키로 설정
alter table Entertainment
add foreign key(entertainmentmaker_id) references Maker(maker_id);
alter table Entertainment
add foreign key(entertainment_name) references Maker(program_name);
-- 예능 테이블이 제작자아이디와 프로그램명을 외래키로 설정
alter table Entertainmentview
add foreign key(entertainmentview_number) references 
Entertainment(entertainment_number);
alter table Entertainmentview
add foreign key(entertainmentview_id) references Viewer(viewer_id);
-- 예능시청 테이블이 예능등록번호와 시청자아이디를 외래키로 설정
alter table Membership
add foreign key(membershipviewer_id) references Viewer(viewer_id) 
ON DELETE CASCADE;
-- 멤버십 테이블이 시청자아이디를 외래키로 설정 및 부모키 삭제 시 자식키도 같이 삭제
alter table Review
add foreign key(reviewviewer_id) references Viewer(viewer_id);
alter table Review
add foreign key(reviewprogram_name) references Maker(program_name);
-- 후기 테이블이 시청자아이디와 프로그램명을 외래키로 설정
alter table Membershipbenefit
add foreign key(membershipviewer_id, membership_number) references 
Membership(membershipviewer_id, membership_number) ON DELETE CASCADE;
-- 멤버십혜택 테이블이 시청아이디와 멤버십번호를 외래키로 설정 및 
-- 부모키 삭제 시 자식키도 같이 삭제