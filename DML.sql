insert into Viewer values ('abc4568','a4568','man','34','495-324');
insert into Viewer values ('dfe1325','d1325','woman','17','148-672');
insert into Viewer values ('wef3248','w3248','woman','35','812-246');
insert into Viewer values ('ger6872','g6872','man','09','494-231');
insert into Viewer values ('fsd9875','f9875','woman','52','865-371');
insert into Viewer values ('gdf1185','g1185','man','60','481-272');
insert into Viewer values ('kju7952','k7952','woman','45','741-900');
insert into Viewer values ('vfe4984','v4984','woman','27','528-867');
insert into Viewer values ('fqe2347','f2347','man','21','542-992');
insert into Viewer values ('hrt8564','h8564','man','32','630-855');
insert into Viewer values ('dfw3793','d3793','man','36','259-886');
insert into Viewer values ('fwe7951','f7951','woman','35','694-025');

insert into Maker values ('m4984','인턴','김서정','wef3248');
insert into Maker values ('d8715','스토브리그','김상희','fwe7951');
insert into Maker values ('m3445','괴물','박소민','fsd9875');
insert into Maker values ('e3046','신서유기','나영희','kju7952');
insert into Maker values ('e4801','삼시세끼','차승국','dfw3793');
insert into Maker values ('d2011','연모','한희정','vfe4984');
insert into Maker values ('e5022','꽃보다할배','김상호','abc4568');
insert into Maker values ('d3182','빈센조','박재범','hrt8564');
insert into Maker values ('m8691','어카운턴트','게빈 오코너','gdf1185');

insert into Membership values ('dfe1325','a845840','A','18000');
insert into Membership values ('fqe2347','a305429','B','14000');
insert into Membership values ('ger6872','a354617','N','9000');
insert into Membership values ('abc4568','a672922','B','14000');

insert into Makermanagement values ('m4984','m3445');
insert into Makermanagement values ('m8691','m4984');
insert into Makermanagement values ('e3046','e4801');
insert into Makermanagement values ('d2011','d8715');
insert into Makermanagement values ('e5022','e3046');

insert into Movie values ('m317937','인턴','마이어스',
12,to_date('24-09-2015','dd-mm-yyyy'),'02:01:00','m4984');
insert into Movie values ('m355501','괴물','봉준호',
12,to_date('27-07-2006','dd-mm-yyyy'),'01:59:00','m3445');
insert into Movie values ('m164522','어카운턴트','벤',
15,to_date('13-10-2016','dd-mm-yyyy'),'02:07:00','m8691');

insert into review values ('fqe2347',4,'O',to_date('12-05-2018','dd-mm-yyyy'),'인턴');
insert into review values ('fqe2347',3,'X',to_date('25-09-2019','dd-mm-yyyy'),'빈센조');
insert into review values ('ger6872',5,'O',to_date('07-11-2020','dd-mm-yyyy'),'꽃보다할배');

insert into Drama values ('d219944','스토브리그','스포츠',15,'16부작','d8715');
insert into Drama values ('d617051','연모','사극',15,'20부작','d2011');
insert into Drama values ('d904825','빈센조','스릴러',15,'20부작','d3182');


insert into Entertainment values ('e219944','신서유기','나영석','7','Tving','e3046');
insert into Entertainment values ('e970008','삼시세끼','신효정','3','tvN','e4801');
insert into Entertainment values ('e442807','꽃보다할배','박희연','6','tvN','e5022');

insert into Movieview values ('m317937','dfe1325','01:00:52');
insert into Movieview values ('m317937','fqe2347','11:40:02');
insert into Movieview values ('m355501','hrt8564','08:03:31');
insert into Movieview values ('m164522','kju7952','02:01:01');
insert into Movieview values ('m355501','abc4568','00:15:45');

insert into Dramaview values ('d219944','ger6872','02:13:15');
insert into Dramaview values ('d904825','fqe2347','20:52:32');
insert into Dramaview values ('d904825','wef3248','00:55:35');
insert into Dramaview values ('d617051','fqe2347','01:05:03');
insert into Dramaview values ('d219944','dfw3793','00:10:46');

insert into Entertainmentview values ('e442807','ger6872','06:35:02');
insert into Entertainmentview values ('e970008','gdf1185','02:17:12');
insert into Entertainmentview values ('e219944','fqe2347','12:35:26');
insert into Entertainmentview values ('e442807','gdf1185','00:42:32');
insert into Entertainmentview values ('e970008','dfw3793','09:02:45');

insert into membershipbenefit values ('dfe1325','a845840','최상급 화질/기간 연장');
insert into membershipbenefit values ('fqe2347','a305429','중급 화질');
insert into membershipbenefit values ('ger6872','a354617','1개월 무료 이용');
insert into membershipbenefit values ('abc4568','a672922','중급 화질');

------------------------------------------------------------------------------------DML 검색

1. 후기의 모든 속성 검색
select * from review;

2. 시청자 중 제작자가 아닌 인원의 시청자아이디 검색
select viewer_id from Viewer
where viewer_id not in 
(select makerview_id from Maker);

3. 제작자 중 드라마를 시청한 인원의 대표자이름과 드라마명 검색
select Maker.ceo_name, drama.drama_name from Maker, Drama
where  maker_id = drama.dramamaker_id;

4. 영화를 제작한 제작자 중 시청자로 등록한 인원의 시청자아이디 검색
select viewer_id from Viewer
where viewer_id in (select Maker.makerview_id from Maker, Movie
                    where Maker.maker_id = Movie.moviemaker_id)
order by viewer_id;

5. 전체 시청자 중 멤버십을 가입한 시청자의 아이디, 혜택 검색 (미가입자는 아이디만 출력)
select viewer_id, membership_benefit 
from Viewer, Membershipbenefit
where Viewer.viewer_id = membershipbenefit.membershipviewer_id(+);

6. 예능과 드라마를 둘다 시청한 시청자의 아이디, 각 시청시간 검색 검색
select dramaview_id, dramaview_time, entertainmentview_time from Dramaview, Entertainmentview
where Dramaview.dramaview_id = Entertainmentview.entertainmentview_id;

7. 다른 제작자를 관리해주는 동시에 관리를 받는 제작자의 제작자아이디 검색
select target_manager from Makermanagement
where target_manager in (select check_manager 
                        from Makermanagement);

8. 아이디가 fqe2347인 시청자의 시청했던 드라마등록번호와 드라마명 검색
select drama_number, drama_name from Dramaview, Drama
where dramaview_number = drama_number and dramaview_id = 'fqe2347';

9. 드라마를 시청한 시청자 중 드라마를 2개 미만으로 시청한 시청자의 시청자아이디와 
   시청횟수 검색
select dramaview_id, count(dramaview_id)as 시청횟수 from dramaview
group by dramaview_id
having count(dramaview_id) < 2;

10. 멤버십을 구매하지 않은 시청자가 시청한 예능명 검색
select entertainment_name from entertainment 
where entertainment_number in 
(select entertainmentview_number from entertainmentview
	where entertainmentview_id in 
	(select viewer_id from viewer
		where viewer_id not in 
		(select viewer.viewer_id from viewer, membership
			where 
			viewer.viewer_id = membership.membershipviewer_id)));