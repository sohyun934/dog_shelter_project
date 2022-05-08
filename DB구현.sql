--user---------------------------------------------------------------------
-- drop user kimgibeom cascade;

create user kimgibeom IDENTIFIED by kimgibeom default tablespace users;
grant resource, connect to kimgibeom;

--table---------------------------------------------------------------------
create table kimgibeom.users(
user_id varchar2(50) constraint users_uid_pk primary key,
password varchar2(50) constraint users_pw_nn not null,
name varchar2(50) constraint users_name_nn not null,
phone_number varchar2(50) constraint users_phone_nn not null,
e_mail varchar2(100) constraint users_email_nn not null,
reg_date date constraint users_regdate_nn not null
);


-------------------------------------------------------------------------


create table kimgibeom.dogs(
dog_num number(10) constraint dogs_num_pk primary key,
title  varchar2(100) constraint dogs_title_nn not null,
name varchar2(50) constraint dogs_name_nn not null,
age number(3) constraint dogs_age_ck check(age>0),
kind varchar2(50) constraint dogs_kind_nn not null,
weight number(3) constraint dogs_weight_nn not null constraint dogs_weight_ck check(weight>0),
gender varchar2(20) constraint dogs_gender_nn not null,
adoption_status varchar2(20) constraint dogs_adopt_nn not null,
entrance_date date constraint dogs_enterdate_nn not null,
content  varchar2(4000) constraint dogs_content_nn not null,
attach_name varchar2(1000)
);





create table kimgibeom.adopts(
adopt_num number(10) constraint adopts_adoptnum_pk primary key,
user_id varchar2(50) constraint adopts_uid_fk references kimgibeom.users(user_id) on delete set null,
reg_date date constraint adopts_regdate_nn not null,
dog_num number(10) constraint adopts_abandonnum_fk references kimgibeom.dogs(dog_num) on delete set null
);




create table kimgibeom.reports(
report_num number(10) constraint reports_num_pk primary key,
user_id varchar2(50) constraint reports_uid_fk references kimgibeom.users(user_id) on delete cascade,
title varchar2(100) constraint reports_title_nn not null,
content varchar2(4000) constraint reports_content_nn not null,
view_count number(10) constraint reports_viewcount_nn not null constraint reports_viewcount_ck check(view_count>0),
reg_date date constraint reports_regdate_nn not null,
attach_name varchar2(1000)
);



create table kimgibeom.report_replies(
report_reply_num number(10) constraint reportreplies_num_pk primary key,
report_num number(10)  constraint reportreplies_reportnum_fk references kimgibeom.reports(report_num) on delete cascade,
user_id varchar2(50) constraint reportreplies_uid_fk references kimgibeom.users(user_id) on delete cascade,
content varchar2(4000) constraint reportreplies_content_nn not null,
reg_date date constraint reportreplies_regdate_nn not null
);


create table kimgibeom.reviews(
review_num number(10) constraint reviews_num_pk primary key,
title varchar2(100) constraint reviews_title_nn not null,
content varchar2(4000) constraint reviews_content_nn not null,
reg_date date constraint reviews_regdate_nn not null,
attach_name varchar2(1000)
);


create table kimgibeom.review_replies(
review_reply_num number(10) constraint reviewreplies_num_pk primary key,
review_num number(10)  constraint reviewreplies_reviewnum_fk references kimgibeom.reviews(review_num) on delete cascade,
user_id varchar2(50) constraint reviewreplies_uid_fk references kimgibeom.users(user_id) on delete cascade,
content varchar2(4000) constraint reviewreplies_content_nn not null,
reg_date date constraint reviewreplies_regdate_nn not null
);



create table kimgibeom.donations(
donation_num number(10) constraint donations_num_pk primary key,
user_id varchar2(50) constraint donations_uid_fk references kimgibeom.users(user_id) on delete set null,
price number(15) constraint donations_price_nn not null constraint donations_price_ck check(price>0),
donation_date date constraint donations_date_nn not null
);


--sequence-------------------------------------
create sequence kimgibeom.dog_num_seq;
create sequence kimgibeom.adopt_num_seq;
create sequence kimgibeom.report_num_seq;
create sequence kimgibeom.reportreply_num_seq;
create sequence kimgibeom.review_num_seq;
create sequence kimgibeom.reviewreply_num_seq;
create sequence kimgibeom.donation_num_seq;


--insert----------------------------------------
insert into kimgibeom.users
values('user','user','user','010-1234-1234','kkb509@naver.com','2019-01-04');
insert into kimgibeom.users
values('admin','admin','admin','010-1234-1234','rlqja910@google.com','2019-01-04');
insert into kimgibeom.users
values('user1000','user1000!','김기범','010-0000-0000','user1000@google.com','2019-01-04');
insert into kimgibeom.users
values('user1001','user1001!','신대범','010-1111-1111','user1001@google.com','2019-01-19');
insert into kimgibeom.users
values('user1002','user1002!','김아림','010-2222-2222','user1002@google.com','2019-05-04');
insert into kimgibeom.users
values('user1003','user1003!','김소현','010-3333-3333','user1003@google.com','2019-05-19');
insert into kimgibeom.users
values('user1004','user1004!','이창연','010-4444-4444','user1004@google.com','2019-06-19');
insert into kimgibeom.users
values('user1005','user1005!','박지성','010-5555-5555','user1005@google.com','2019-07-04');
insert into kimgibeom.users
values('user1006','user1006!','차두리','010-6666-6666','user1006@google.com','2019-07-04');
insert into kimgibeom.users
values('user1007','user1007!','문희준','010-7777-7777','user1007@google.com','2019-07-19');
insert into kimgibeom.users
values('user1008','user1008!','박재범','010-8888-8888','user1008@google.com','2019-08-04');
insert into kimgibeom.users
values('user1009','user1009!','김희철','010-9999-9999','user1009@google.com','2019-08-19');
insert into kimgibeom.users
values('user1010','user1010!','강재수','010-1000-1000','user1010@google.com','2019-08-19');
insert into kimgibeom.users
values('user1011','user1011!','이진주','010-1100-1100','user1011@google.com','2019-10-19');
insert into kimgibeom.users
values('user1012','user1012!','김윤아','010-1200-1200','user1012@google.com','2019-11-04');


insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'진도 다롱이 평생 가족을 찾습니다.','다롱이',6,'진돗개',18,'암컷','입양완료','2020-01-10','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'치와와 쿠키 평생 가족을 찾습니다.','쿠키',3,'치와와',4,'수컷','입양완료','2020-02-10','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'믹스견 탄이 평생 가족을 찾습니다.','탄이',2,'믹스',4,'암컷','입양완료','2020-02-13','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'믹스견 까미 평생 가족을 찾습니다.','까미',2,'믹스',6,'암컷','입양완료','2020-03-14','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'포메라니안 햇살이 평생 가족을 찾습니다.','햇살',5,'포메라니안',2,'수컷','입양완료','2020-03-17','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'이탈리안 그레이 하운드 푸파 평생 가족을 찾습니다.','푸파',3,'이탈리안 그레이하운드',21,'수컷','입양완료','2020-04-11','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'브렌치불독 보석이 평생 가족을 찾습니다.!','보석',7,'프렌치불독',22,'수컷','입양완료','2020-04-13','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'시바견 지니 평생 가족을 찾습니다.','지니',6,'시바',6,'암컷','입양완료','2020-04-26','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'믹스견 달수 평생 가족을 찾습니다.','달수',9,'믹스',4,'암컷','입양완료','2020-04-29','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'진돗개 용길이 평생 가족을 찾습니다.','용길',11,'진돗개',15,'수컷','입양완료','2020-05-01','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'말티즈 치치 평생 가족을 찾습니다.','치치',9,'말티즈',3,'수컷','입양대기','2020-05-16','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'시바견 감자 평생 가족을 찾습니다.','감자',2,'시바',4,'수컷','입양대기','2020-06-13','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'푸들 오이 평생 가족을 찾습니다.','오이',6,'푸들',12,'암컷','입양대기','2020-06-13','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'믹스견 하치 평생 가족을 찾습니다.','하치',2,'믹스',6,'암컷','입양대기','2020-06-13','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);
insert into kimgibeom.dogs
values(kimgibeom.dog_num_seq.nextval,'치와와 포포 평생 가족을 찾습니다.','포포',8,'치와와',2,'수컷','입양대기','2020-06-15','평생 가족이 되어주실 분은 방문 상담을 예약해주세요.<br>BEFF 연락처 : 02-△△△-△△△△',null);


insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1000','2020-01-15',1);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1001','2020-02-13',2);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1002','2020-02-14',3);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1003','2020-03-16',4);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1004','2020-03-19',5);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1005','2020-04-20',6);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1006','2020-04-20',7);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1007','2020-05-01',8);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1008','2020-05-04',9);
insert into kimgibeom.adopts
values(kimgibeom.adopt_num_seq.nextval,'user1009','2020-05-19',10);


insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1000','△△ 공원 강아지','산책 중인데 20분째 혼자 돌아다니고 있어서 옆에서 보고 있어요. 주인 분 이거 보시면 연락 주세요.',547,'2020-01-02',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1000','○○동 근처 말티즈 보신 분 계신가요?','이사하고 있어서 현관문 열어놨는데 가출했어요. 혹시 말티즈 보신 분 계신가요?',456,'2020-01-12',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1003','정말 섬에 반려동물 버리는 사람들 많네요.','제발 책임감을 가지고 반려동물 키웠으면 좋겠습니다.',500,'2020-01-22',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1003','□□ 빌라에 푸들 있어요.','전봇대에 묶어놨길래 잠깐 가게 들른 줄 알았는데 30분 넘게 방치돼 있어서 임시 보호 중이에요.',6789,'2020-01-28',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1003','△△ 공원 강아지','산책 중인데 20분째 혼자 돌아다니고 있어서 옆에서 보고 있어요. 주인 분 이거 보시면 연락 주세요.',2346,'2020-03-02',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1005','○○동 근처 말티즈 보신 분 계신가요?','이사하고 있어서 현관문 열어놨는데 가출했어요. 혹시 말티즈 보신 분 계신가요?',6978,'2020-03-12',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1006','정말 섬에 반려동물 버리는 사람들 많네요.','제발 책임감을 가지고 반려동물 키웠으면 좋겠습니다.',572134,'2020-03-22',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1007','□□ 빌라에 푸들 있어요.','전봇대에 묶어놨길래 잠깐 가게 들른 줄 알았는데 30분 넘게 방치돼 있어서 임시 보호 중이에요.',346,'2020-04-01',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1008','△△ 공원 강아지','산책 중인데 20분째 혼자 돌아다니고 있어서 옆에서 보고 있어요. 주인 분 이거 보시면 연락 주세요.',5123,'2020-04-02',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1008','○○동 근처 말티즈 보신 분 계신가요?','이사하고 있어서 현관문 열어놨는데 가출했어요. 혹시 말티즈 보신 분 계신가요?',345,'2020-04-02',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1009','정말 섬에 반려동물 버리는 사람들 많네요.','제발 책임감을 가지고 반려동물 키웠으면 좋겠습니다.',243,'2020-05-13',null);
insert into kimgibeom.reports
values(kimgibeom.report_num_seq.nextval,'user1010','□□ 빌라에 푸들 있어요.','전봇대에 묶어놨길래 잠깐 가게 들른 줄 알았는데 30분 넘게 방치돼 있어서 임시 보호 중이에요.',3434,'2020-06-15',null);




insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,10,'user1001','어서 집으로 돌아가자','2020-04-02');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,9,'user1003','어서 집으로 돌아가자','2020-04-02');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,12,'user1003','책임감 없는 사람들이 너무 많아요.','2020-06-15');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,12,'user1004','날씨도 추운데 주인 분은 어디 가셨을까요...','2020-06-15');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,9,'user1005','부디  빨리 주인분 찾길','2020-04-02');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,10,'user1005','부디  빨리 주인분 찾길','2020-04-02');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,11,'user1005','책임감 없는 사람들이 너무 많아요.','2020-05-13');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,12,'user1006','정말 화가 나네요...','2020-06-16');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,12,'user1008','어쩌다가..','2020-06-16');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,10,'user1011','ㅠㅠ 감사합니다 저희집 강아지에요 지금 갈게요.ㅠㅠㅠ','2020-04-02');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,9,'user1011','다행입니다..','2020-04-03');
insert into kimgibeom.report_replies
values(kimgibeom.reportreply_num_seq.nextval,9,'user1001','주인 분 금방 만나서 애기 데려다줬습니다!','2020-04-02');




insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'다롱이 평생 가족을 만났습니다.','다롱이의 행복한 삶을 BEEF가 응원합니다♡','2020-02-10',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'쿠키 평생 가족을 만났습니다.','쿠키의 행복한 삶을 BEEF가 응원합니다♡','2020-03-10',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'탄이 평생 가족을 만났습니다.','탄이의 행복한 삶을 BEEF가 응원합니다♡','2020-03-13',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'까미 평생 가족을 만났습니다.','까미의 행복한 삶을 BEEF가 응원합니다♡','2020-04-14',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'햇살이 평생 가족을 만났습니다.','햇살이의 행복한 삶을 BEEF가 응원합니다♡','2020-04-17',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'푸파 평생 가족을 만났습니다.','푸파의 행복한 삶을 BEEF가 응원합니다♡','2020-05-19',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'보석이 평생 가족을 만났습니다.','보석이의 행복한 삶을 BEEF가 응원합니다♡','2020-05-19',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'지니 평생 가족을 만났습니다.','지니의 행복한 삶을 BEEF가 응원합니다♡','2020-05-26',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'달수 평생 가족을 만났습니다.','달수의 행복한 삶을 BEEF가 응원합니다♡','2020-06-10',null);
insert into kimgibeom.reviews
values(kimgibeom.review_num_seq.nextval,'용길이 평생 가족을 만났습니다.','용길이의 행복한 삶을 BEEF가 응원합니다♡','2020-06-14',null);



insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1001','행복하게 지내길 응원할게!','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1001','정말 좋으신 분들이세요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1005','너무 다행이네요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1005','행복하게 지내길 응원할게!','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1006','정말 좋으신 분들이세요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1006','너무 다행이네요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1006','행복하게 지내길 응원할게!','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1006','정말 좋으신 분들이세요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1007','너무 다행이네요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1008','행복하게 지내길 응원할게!','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1009','정말 좋으신 분들이세요.','2020-05-26');
insert into kimgibeom.review_replies
values(kimgibeom.reviewreply_num_seq.nextval,1,'user1009','너무 다행이네요.','2020-05-26');




insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1001','100000000','2020-01-01');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1001','100004400','2020-02-01');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1001','1200000','2020-03-01');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1001','1000000','2020-04-01');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1001','1040000','2020-04-02');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1001','1005000','2020-04-05');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1002','1020000','2020-05-01');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1002','1000000','2020-05-01');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1002','102000','2020-05-11');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1003','1004000','2020-06-02');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1004','105000','2020-06-04');
insert into kimgibeom.donations
values(kimgibeom.donation_num_seq.nextval,'user1004','10002000','2020-06-05');

--commit---------------------------------------------------------------------------
commit;