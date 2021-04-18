-- 직급 테이블 ##########
-- 생성
CREATE TABLE z_rank(
	r_no NUMBER CONSTRAINT z_rank_no_pk PRIMARY KEY,
	r_name VARCHAR2(50) CONSTRAINT z_rank_name_nn NOT NULL
);
CREATE SEQUENCE Z_RANK_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 데이터
INSERT INTO Z_RANK VALUES (Z_RANK_NO_SEQ.NEXTVAL,'CEO');
INSERT INTO Z_RANK VALUES (Z_RANK_NO_SEQ.NEXTVAL,'이사');
INSERT INTO Z_RANK VALUES (Z_RANK_NO_SEQ.NEXTVAL,'부장');
INSERT INTO Z_RANK VALUES (Z_RANK_NO_SEQ.NEXTVAL,'과장');
INSERT INTO Z_RANK VALUES (Z_RANK_NO_SEQ.NEXTVAL,'대리');
INSERT INTO Z_RANK VALUES (Z_RANK_NO_SEQ.NEXTVAL,'사원');

-- 조회
SELECT * FROM z_rank;
SELECT Z_RANK_NO_SEQ.CURRVAL FROM DUAL;

-- 삭제
DROP TABLE Z_RANK CASCADE CONSTRAINTS ;
DROP SEQUENCE Z_RANK_NO_SEQ;

----------------------------------------------------------------
-- 직책 테이블 ##########
-- 생성
CREATE TABLE z_position(
	pos_no NUMBER CONSTRAINT z_position_no_pk PRIMARY KEY,
	pos_name VARCHAR2(50) CONSTRAINT z_position_name_nn NOT NULL
);


-- 데이터
INSERT INTO Z_POSITION VALUES (1,'CEO');
INSERT INTO Z_POSITION VALUES (2,'인사담당자');
INSERT INTO Z_POSITION VALUES (3,'PM');
INSERT INTO Z_POSITION VALUES (4,'임직원');

-- 조회
SELECT * FROM z_position;
SELECT Z_POSITION_NO_SEQ.CURRVAL FROM DUAL;

-- 삭제
DROP TABLE Z_POSITION CASCADE CONSTRAINTS ;

----------------------------------------------------------------
-- 부서 테이블 ##########
-- 생성
CREATE TABLE z_department(
	d_no NUMBER CONSTRAINT z_department_no_pk PRIMARY KEY,
	d_name VARCHAR2(50) CONSTRAINT z_department_name_nn NOT NULL
); 
	
CREATE SEQUENCE Z_DEPARTMENT_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

-- 데이터
INSERT INTO Z_DEPARTMENT VALUES (Z_DEPARTMENT_NO_SEQ.NEXTVAL,'임원진');
INSERT INTO Z_DEPARTMENT VALUES (Z_DEPARTMENT_NO_SEQ.NEXTVAL,'경영지원팀');
INSERT INTO Z_DEPARTMENT VALUES (Z_DEPARTMENT_NO_SEQ.NEXTVAL,'인사팀');
INSERT INTO Z_DEPARTMENT VALUES (Z_DEPARTMENT_NO_SEQ.NEXTVAL,'전략기획팀');
INSERT INTO Z_DEPARTMENT VALUES (Z_DEPARTMENT_NO_SEQ.NEXTVAL,'IT팀');

-- 조회
SELECT * FROM Z_DEPARTMENT;
SELECT Z_DEPARTMENT_NO_SEQ.CURRVAL FROM DUAL;

-- 삭제
DROP TABLE Z_DEPARTMENT CASCADE CONSTRAINTS;
DROP SEQUENCE Z_DEPARTMENT_NO_SEQ;

----------------------------------------------------------------
-- 임직원(회원) 테이블 ##########
-- 생성
CREATE TABLE z_user(
	u_no NUMBER CONSTRAINT z_user_no_pk PRIMARY KEY,
	u_id VARCHAR2(50) CONSTRAINT z_user_id_nn NOT NULL,
	u_pass VARCHAR2(50) CONSTRAINT z_user_pass_nn NOT NULL,
	u_name VARCHAR2(100) CONSTRAINT z_user_name_nn NOT NULL,
	u_email VARCHAR2(500) CONSTRAINT z_user_email_nn NULL,
	u_phone VARCHAR2(50) CONSTRAINT z_user_phone_nn NULL,
	u_img VARCHAR2(200) CONSTRAINT z_user_img_nn NULL,
	d_no NUMBER CONSTRAINT z_user_d_no_fk REFERENCES z_department(d_no) ON DELETE CASCADE,
	pos_no NUMBER CONSTRAINT z_user_pos_no_fk REFERENCES z_position(pos_no) ON DELETE CASCADE,
	r_no NUMBER CONSTRAINT z_user_r_no_fk REFERENCES z_rank(r_no) ON DELETE CASCADE
);

CREATE SEQUENCE Z_USER_NO_SEQ
	START WITH 1
	INCREMENT BY 1;
	
-- 데이터
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '75CE001','king777','김경일',
							'ceo@google.com','01012549836','img/user/75CE001_김경일.jpg',01,01,01);
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '85CE002','dladnjs12','임한원',
							'dlsdnjs@google.com','01011354562','img/user/85CE002_임한원.jpg',05,02,02);						
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '02MA064','kangny56','김나영',
							'nayonee@google.com','01031292712','img/user/02MA064_김나영.jpg',02,03,03);	
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '15MA486','haha1253','하성찬',
							'hahaha@google.com','01031927121','img/user/15MA486_하성찬.jpg',02,04,05);							
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '82HR012','passhr00','이강식',
							'hjhj@google.com','01012349876','img/user/82HR012_이강식.jpg',03,03,03);
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '17HR095','wonhk123','차원혁',
							'wkyuk@google.com','01007051220','img/user/17HR095_차원혁.jpg',03,04,06);			
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '05PL125','jonejj','정하나',
							'jj11@google.com','01007751389','img/user/05PL125_정하나.jpg',04,04,04);
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '99PL614','zoooo555','강주희',
							'zzzooo@google.com','01057513645','img/user/99PL614_강주희.jpg',04,04,03);							
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '94IT757','psma9854','한지혜',
							'ks9854@google.com','01012135976','img/user/94IT757_한지혜.jpg',05,04,03);						
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '15IT536','jaekkk','이재관',
							'jaekk@google.com','01054621568','img/user/15IT536_이재관.jpg',05,04,05);
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '09IT801','jjean159','정택진',
							'jjean@google.com','01057513645','img/user/09IT801_정택진.jpg',05,04,04);							
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '20IT254','doood987','도경아',
							'dodok@google.com','01065125014','img/user/20IT254_도경아.jpg',05,04,06);						
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '18IT279','mingee31','이민지',
							'minjee@google.com','01028915267','img/user/18IT279_이민지.jpg',05,04,06);	
INSERT INTO Z_USER VALUES (Z_USER_NO_SEQ.NEXTVAL, '19IT574','you55','유성환',
							'hwan@google.com','01055198510','img/user/19IT574_유성환.jpg',05,04,06);		
							
-- 조회
SELECT * FROM Z_USER;
SELECT Z_USER_NO_SEQ.CURRVAL FROM DUAL;
-- 삭제
DROP TABLE Z_USER CASCADE CONSTRAINTS ;
DROP SEQUENCE Z_USER_NO_SEQ;

---------------------------------------------------------------
-- 일정 테이블 ##########
-- 생성
DROP SEQUENCE Z_CALENDAR_NO_SEQ;
DROP TABLE z_calendar;


CREATE TABLE z_calendar(
   id NUMBER CONSTRAINT z_calendar_no_pk PRIMARY KEY,
   title VARCHAR2(100) CONSTRAINT z_calendar_title_nn NOT NULL,
   start1 varchar2(50) CONSTRAINT z_calendar_start_nn NOT NULL,
   end1 varchar2(50) CONSTRAINT z_calendar_end_nn NOT NULL,
   allDay number(1) CONSTRAINT z_calendar_allDay_nn NOT NULL,
   content VARCHAR2(1000) CONSTRAINT z_calendar_content_nn NOT NULL,
   textColor varchar2(50) CONSTRAINT z_calendar_textColor_nn NOT NULL,
   backgroundColor varchar2(50) CONSTRAINT z_calendar_backgroundColor_nn NOT NULL,
   borderColor varchar2(50) CONSTRAINT z_calendar_borderColor_nn NOT NULL,
   u_no NUMBER CONSTRAINT z_calendar_u_no_fk REFERENCES z_user(u_no) ON DELETE CASCADE
);


CREATE SEQUENCE Z_CALENDAR_NO_SEQ
   START WITH 1
   INCREMENT BY 1;

INSERT INTO Z_CALENDAR VALUES (Z_CALENDAR_NO_SEQ.NEXTVAL, '미팅',
   '2021-04-01T00:00:00.000Z','2021-04-02T00:00:00.000Z', 2, '삼성전자 PTC 개발 건 관련 담당자', 'yellow','navy','orange',3);
SELECT * FROM z_calendar;

----------------------------------------------------------------
-- 프로젝트 테이블 ##########
-- 생성
CREATE TABLE Z_PROJECT(
   p_no NUMBER CONSTRAINT z_project_no_pk PRIMARY KEY,
   p_name varchar2(100) CONSTRAINT z_project_name_nn NOT NULL,
   p_startD DATE CONSTRAINT z_project_startD_nn NOT NULL,
   p_endD DATE CONSTRAINT z_project_endD_nn NULL,
   p_content varchar2(1000) CONSTRAINT z_project_content_nn NOT NULL,
   p_pm varchar2(50) CONSTRAINT z_project_pm_nn NOT NULL,
   d_no NUMBER CONSTRAINT z_d_no_fk REFERENCES Z_DEPARTMENT(d_no) ON DELETE CASCADE
);

CREATE SEQUENCE Z_PROJECT_NO_SEQ
   START WITH 1
   INCREMENT BY 1;
   
-- 데이터
INSERT INTO Z_PROJECT
   VALUES(Z_PROJECT_NO_SEQ.NEXTVAL, 'Zenkit', 
         to_date('2021/03/29','YYYY-MM-DD'), to_date('2021/04/30','YYYY-MM-DD'),
         '프로젝트 관리 시스템 PMS', '94MA757', 1);

INSERT INTO Z_PROJECT
   VALUES(Z_PROJECT_NO_SEQ.NEXTVAL, 'Plo', 
         to_date('2021/02/11','YYYY-MM-DD'), to_date('2021/03/15','YYYY-MM-DD'),
         '음원 스트리밍 사이트', '09PL801', 2);      
      
INSERT INTO Z_PROJECT
   VALUES(Z_PROJECT_NO_SEQ.NEXTVAL, 'Gameflix', 
         to_date('2021/01/15','YYYY-MM-DD'), to_date('2021/02/14','YYYY-MM-DD'),
         '게임 사이트', '15MA536', 3);   
      
INSERT INTO Z_PROJECT
   VALUES(Z_PROJECT_NO_SEQ.NEXTVAL, 'Ecobean',
         to_date('2021/01/03','YYYY-MM-DD'), to_date('2021/01/25','YYYY-MM-DD'),
         '친환경 제품을 판매하는 웹 쇼핑몰 사이트', '09PL801', 4);      

INSERT INTO Z_PROJECT
   VALUES(Z_PROJECT_NO_SEQ.NEXTVAL, 'Classsite',
         to_date('2021/02/18','YYYY-MM-DD'), to_date('2021/03/20','YYYY-MM-DD'),
         '수강 신청 사이트', '94MA757', 3);         

-- 조회
SELECT * FROM Z_PROJECT;
SELECT Z_PROJECT_NO_SEQ.CURRVAL FROM DUAL;
-- 삭제
DROP TABLE Z_PROJECT CASCADE CONSTRAINTS ;
DROP SEQUENCE Z_PROJECT_NO_SEQ;

----------------------------------------------------------------
-- 프로젝트 참여인원 테이블 ##########
-- 생성
CREATE TABLE Z_RESOURCE(
   p_no NUMBER,
   u_no NUMBER,
   PRIMARY KEY (p_no, u_no),
   FOREIGN KEY (p_no) REFERENCES Z_PROJECT(p_no) ON DELETE CASCADE,
   FOREIGN KEY (u_no) REFERENCES Z_USER(u_no) ON DELETE CASCADE
);


-- 데이터
INSERT INTO Z_RESOURCE VALUES(1,2);
INSERT INTO Z_RESOURCE VALUES(1,4);
INSERT INTO Z_RESOURCE VALUES(1,6);
INSERT INTO Z_RESOURCE VALUES(2,3);
INSERT INTO Z_RESOURCE VALUES(2,7);
INSERT INTO Z_RESOURCE VALUES(3,8);
INSERT INTO Z_RESOURCE VALUES(3,9);

-- 조회
SELECT * FROM Z_RESOURCE;
-- 삭제
DROP TABLE Z_RESOURCE CASCADE CONSTRAINTS;

----------------------------------------------------------------
----------------------------------------------------------------
-- 작업 테이블 ##########
CREATE TABLE Z_JOB (
   j_no NUMBER CONSTRAINT z_job_pk PRIMARY KEY,
--   j_level NUMBER CONSTRAINT z_job_level_nn NOT NULL,
   j_refno NUMBER CONSTRAINT z_job_refno_nn NOT NULL,
   j_name VARCHAR2(500) CONSTRAINT z_job_name_nn NOT NULL,
   j_content varchar2(1000) CONSTRAINT z_job_content_nn NOT NULL,
   j_startD date CONSTRAINT z_job_startD_nn NOT NULL,
   j_endD DATE CONSTRAINT z_job_endD_nn NOT NULL,
   j_regD date CONSTRAINT z_job_regD_nn NOT NULL,
   j_uptD date CONSTRAINT z_job_uptD_nn NOT NULL,
   j_completeR NUMBER CONSTRAINT z_job_completeR NOT NULL,
   p_no NUMBER CONSTRAINT z_job_p_no_fk REFERENCES Z_PROJECT(p_no) ON DELETE CASCADE,
   u_no NUMBER CONSTRAINT z_job_u_no_fk REFERENCES Z_USER(u_no) ON DELETE CASCADE
);
CREATE SEQUENCE Z_JOB_NO_SEQ
   START WITH 1
   INCREMENT BY 1;

  SELECT * FROM Z_RESOURCE zr ;
  
-- 데이터
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 0, 'Zenkit PMS 시스템','작업설명1' ,to_date('2021-04-01','yyyy-mm-dd'), to_date('2021-04-30','yyyy-mm-dd'), sysdate, sysdate, 0.2, 1, 2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '로그인/프로필', '작업설명2' ,to_date('2021-04-01','YYYY-MM-DD'), to_date('2021-04-02','YYYY-MM-DD'),sysdate, sysdate,0.2, 1, 4);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '대시보드', '작업설명3' ,to_date('2021-04-02','YYYY-MM-DD'), to_date('2021-04-03','YYYY-MM-DD'),sysdate, sysdate, 0.2, 1, 4);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '내작업', '작업설명4' ,to_date('2021-04-03','YYYY-MM-DD'), to_date('2021-04-04','YYYY-MM-DD'),sysdate, sysdate, 0.2, 1, 6);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 0, 'plo', '작업설명5' ,to_date('2021-04-04','YYYY-MM-DD'), to_date('2021-04-05','YYYY-MM-DD'),sysdate, sysdate, 0.2, 2, 3);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 5, '프로젝트/리스크', '작업설명6' ,to_date('2021-04-05','YYYY-MM-DD'), to_date('2021-04-06','YYYY-MM-DD'),sysdate, sysdate, 0.2, 1, 7);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 5, '프로젝트/간트차트', '작업설명7' ,to_date('2021-04-07','YYYY-MM-DD'), to_date('2021-04-07','YYYY-MM-DD'),sysdate, sysdate, 0.2, 1, 8);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 5, '프로젝트/기본정보', '작업설명8' ,to_date('2021-04-07','YYYY-MM-DD'), to_date('2021-04-08','YYYY-MM-DD'),sysdate, sysdate, 0.2, 1, 9);

-- 조회
SELECT * FROM Z_JOB;
SELECT z_job_no_seq.CURRVAL FROM DUAL;
-- 삭제
DROP TABLE Z_JOB CASCADE CONSTRAINTS;
DROP SEQUENCE z_job_no_seq;
SELECT * FROM Z_USER ;
----------------------------------------------------------------

----------------------------------------------------------------
----------------------------------------------------------------
-- 결재상태 테이블 ##########
CREATE TABLE Z_AUTH_STATE(
	a_name VARCHAR(20) CONSTRAINT z_auth_state_pk PRIMARY KEY
);
-- 데이터
INSERT INTO Z_AUTH_STATE VALUES('승인중');
INSERT INTO Z_AUTH_STATE VALUES('승인완료');
INSERT INTO Z_AUTH_STATE VALUES('반려');
INSERT INTO Z_AUTH_STATE VALUES('회수');
INSERT INTO Z_AUTH_STATE VALUES('대기');

-- 조회
SELECT * FROM Z_AUTH_STATE;
-- 삭제
DROP TABLE Z_AUTH_STATE CASCADE CONSTRAINTS;

----------------------------------------------------------------
-- 결재 테이블 ##########
CREATE TABLE Z_AUTH(
	a_no NUMBER CONSTRAINT a_no_pk PRIMARY KEY,
	a_date DATE CONSTRAINT a_date_nn NOT NULL,
	a_resultN VARCHAR2(1000),
	a_requestN VARCHAR2(1000),
	a_requestP NUMBER,
	j_no NUMBER CONSTRAINT z_auth_j_no_fk REFERENCES Z_JOB(j_no) ON DELETE CASCADE,
	a_name VARCHAR2(50) CONSTRAINT z_auth_a_name_fk REFERENCES Z_AUTH_STATE(a_name) ON DELETE CASCADE
);
CREATE SEQUENCE Z_AUTH_NO_SEQ
	START WITH 1
	INCREMENT BY 1;

SELECT * FROM Z_USER zu ;
-- 데이터
INSERT INTO Z_AUTH VALUES(Z_AUTH_NO_SEQ.NEXTVAL, sysdate, '요청합니다.', '승인합니다', 90, 1, '승인완료');
INSERT INTO Z_AUTH VALUES(Z_AUTH_NO_SEQ.NEXTVAL, sysdate, '요청해주세요', NULL, 40, 2, '승인중');
INSERT INTO Z_AUTH VALUES(Z_AUTH_NO_SEQ.NEXTVAL, to_date('2021-03-02', 'YYYY-MM-DD'), '요청', NULL, 50, 1, '회수');
INSERT INTO Z_AUTH VALUES(Z_AUTH_NO_SEQ.NEXTVAL, sysdate, '', '반려합니다.',70, 1, '반려');

-- 조회
SELECT * FROM Z_AUTH;
SELECT Z_AUTH_NO_SEQ.CURRVAL FROM DUAL;
-- 삭제
DROP TABLE Z_AUTH CASCADE CONSTRAINTS;
DROP SEQUENCE Z_AUTH_NO_SEQ;

----------------------------------------------------------------
-- 리스크상태 테이블 ##########
CREATE TABLE Z_RISK_STATE(
	rs_name VARCHAR(20) CONSTRAINT z_risk_state_pk PRIMARY KEY
);
-- 데이터
INSERT INTO Z_RISK_STATE VALUES('오픈');
INSERT INTO Z_RISK_STATE VALUES('조치완료');
INSERT INTO Z_RISK_STATE VALUES('진행');
INSERT INTO Z_RISK_STATE VALUES('취소');
INSERT INTO Z_RISK_STATE VALUES('홀드');

-- 조회
SELECT * FROM Z_RISK_STATE;
-- 삭제
DROP TABLE Z_RISK_STATE CASCADE CONSTRAINTS;

----------------------------------------------------------------
SELECT * FROM Z_RISK;

--건드리면 큰일나는 테이블 드랍더비트...

DROP TABLE z_risk CASCADE CONSTRAINTS;
DROP SEQUENCE z_risk_no_seq;

--기존 테이블
SELECT * FROM Z_RISK;
CREATE TABLE z_risk (
	r_no NUMBER CONSTRAINT z_risk_no_pk PRIMARY KEY, --리스크 번호
	r_name VARCHAR2(100) CONSTRAINT z_risk_name_nn NOT NULL, --리스크명
	r_content VARCHAR2(500) CONSTRAINT z_risk_content_nn NOT NULL, --리스크 내용
	r_regdate DATE CONSTRAINT z_risk_regdate_nn NOT NULL, --등록일
	r_send VARCHAR2(100) CONSTRAINT z_risk_send_nn NOT NULL, --제기자
	r_receive VARCHAR2(100) , --조치자
	r_rcontent VARCHAR2(500), --조치내용
	r_file VARCHAR2(300), --첨부파일
	j_no NUMBER CONSTRAINT z_job_j_no_fk REFERENCES Z_JOB(j_no) ON DELETE CASCADE, --작업번호
	rs_name VARCHAR2(20) CONSTRAINT z_risk_state_rs_name_fk REFERENCES Z_RISK_STATE(rs_name) ON DELETE CASCADE --상태명
);

create sequence z_risk_no_seq
	start with 1
	increment by 1;

-- 조치이력 테이블
CREATE TABLE Z_RISK_ACTION(
	ac_no NUMBER CONSTRAINT z_risk_action_no_pk PRIMARY KEY, --pk
	ac_receive VARCHAR2(100) CONSTRAINT z_risk_receive_nn NOT NULL, --조치자
	ac_name VARCHAR2(500) CONSTRAINT z_risk_action_name_nn NOT NULL, -- 조치내용
	ac_date DATE CONSTRAINT z_risk_action_date_nn NOT NULL, -- 조치일
	ac_state VARCHAR2(50) CONSTRAINT z_risk_action_state_nn NOT NULL, -- 조치상태
	r_no NUMBER CONSTRAINT z_risk_action_r_no_fk REFERENCES Z_RISK(r_no) ON DELETE CASCADE --리스크 번호
);

create sequence Z_RISK_ACTION_SEQ
	start with 1
	increment by 1;

                           --리스크 번호          --리스크명  --리스크 내용       --등록일  --등록자  --조치자  --조치내용  --첨부파일 --작업번호 --상태명
INSERT INTO z_risk values(z_risk_no_seq.nextval, '데이터베이스 기술 문제','데이터베이스 서버 문제가 생겼습니다.',sysdate,'19IT574',NULL,NULL,NULL,1,'오픈');--1
INSERT INTO z_risk values(z_risk_no_seq.nextval, '일정 지연','기술적으로 너무 어려운 개발이기 때문에 마감 기한까지 완성시킬 수 없을 것 같습니다.',sysdate,'15MA486',NULL,NULL,NULL,2,'오픈');--2
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 변경 요소','갑작스러운 프로젝트 변경 요소가 생겼습니다.',sysdate,'94IT757',NULL,NULL,NULL,2,'오픈');--3
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 통합관리','프로젝트관리 계획서 변경이 필요합니다.',sysdate,'17HR095',NULL,NULL,NULL,4,'오픈');--4
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 의사소통관리','보고서가 누락되었습니다.',sysdate,'05PL125',NULL,NULL,NULL,3,'오픈');--5
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 조달관리','프로젝트 조달 결정사항이 문서화되지 않았습니다.',sysdate,'99PL614',NULL,NULL,NULL,4,'오픈');--6
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 계획관리','미흡한 요구사항으로 인해 범위 계획 또한 미흡합니다.',sysdate,'05PL125',NULL,NULL,NULL,2,'오픈');--7
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 통합관리','새로운 기술의 도입 리스크가 큽니다.',sysdate,'20IT254',NULL,NULL,NULL,3,'오픈');--8
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 통합관리','예상치 못한 오류들이 계속 발생합니다.',sysdate,'18IT279',NULL,NULL,NULL,4,'오픈');--9
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 통합관리','프로젝트의 규모가 갑자기 확대되었습니다.',sysdate,'09IT801',NULL,NULL,NULL,1,'오픈');--10
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 계획관리','프로젝트 변경 요소가 생겼습니다.',sysdate,'20IT254',NULL,NULL,NULL,2,'오픈');--11
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 의사소통관리','프로젝트 상태와 이슈가 모든 이해관계자에게 전달되지 않았습니다.',sysdate,'05PL125',NULL,NULL,NULL,3,'오픈');--12
INSERT INTO z_risk values(z_risk_no_seq.nextval, '프로젝트 인력관리','투입된 인원에 비해 업무량이 많습니다.',sysdate,'15MA486',NULL,NULL,NULL,4,'오픈');--13

--조치날짜, 조치 내용, 조치 상태, fk로 리스크 no를 가져오는 것
--Z_RISK_ACTION 인서트

INSERT INTO Z_RISK_ACTION
VALUES(Z_RISK_ACTION_SEQ.NEXTVAL,'02MA064','데이터베이스 서버점검 중', SYSDATE, '진행', 1);
INSERT INTO Z_RISK_ACTION
VALUES(Z_RISK_ACTION_SEQ.NEXTVAL,'02MA064','데이터베이스 테이블 점검 중', SYSDATE, '진행', 1);
INSERT INTO Z_RISK_ACTION
VALUES(Z_RISK_ACTION_SEQ.NEXTVAL,'02MA064','데이터베이스 서버점검 완료 하였습니다.', SYSDATE, '조치완료', 1);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL,'02MA064','전략 및 우선 순위를 수정하고, 범위 및 일정 조정을 진행하겠습니다.', SYSDATE, '진행', 2);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','투입 인력과 할당량을 조정합니다. ',SYSDATE, '홀드',2);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','투입 인력과 할당량 조정 완료',SYSDATE,'조치완료',2);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','변경된 일정을 기준으로 지속적으로 기준을 다시 설정합니다.',SYSDATE,'진행',3);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','프로젝트 관리 계획을 업데이트합니다.',SYSDATE,'진행',3);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','프로젝트 변경 요소 업데이트 완료',SYSDATE,'조치완료',3);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','전략 및 우선 순위를 수정하고, 범위 및 일정 조정을 진행하겠습니다.',SYSDATE,'진행',4);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','변경된 프로젝트 계획서를 업데이트합니다.',SYSDATE,'진행',4);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','변경된 프로젝트 계획서 업데이트가 완료되었습니다.',SYSDATE,'조치완료',4);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','보고서를 새로 업데이트합니다.',SYSDATE,'진행',5);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','보고서 업데이트 완료 하였습니다.',SYSDATE,'조치완료',5);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','프로젝트 조달 결정사항을 문서화합니다.',SYSDATE,'진행',6);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','프로젝트 조달 결정사항을 문서화하여 업데이트 완료했습니다.',SYSDATE,'조치완료',6);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','요구관리 전문인력을 투입합니다.',SYSDATE,'진행',7);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','요구관리 전문인력 투입 완료',SYSDATE,'조치완료',7);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','신기술을 배제하고 기존의 익숙한 기술을 최대한 활용합니다.',SYSDATE,'진행',8);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','기존 기술 활용 완료',SYSDATE,'조치완료',8);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','반복적인 테스트를 진행하여 오류를 방지합니다.',SYSDATE,'진행',9);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','반복적인 테스트를 진행하였습니다.',SYSDATE,'조치완료',9);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','프로토타입 개발과 시스템 중복 설계를 진행합니다.',SYSDATE,'진행',10);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '82HR012','프로토타입 개발과 시스템 중복 설계 진행 완료',SYSDATE,'조치완료',10);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','변경된 일정을 기준으로 지속적으로 기준을 다시 설정합니다.',SYSDATE,'진행',11);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','프로젝트 관리 계획을 업데이트합니다.',SYSDATE,'진행',11);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','프로젝트 관리 계획 업데이트 완료',SYSDATE,'조치완료',11);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','프로젝트 정보, 계획을 모두가 확인할 수 있도록 수시로 업데이트합니다.',SYSDATE,'진행',12);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','프로젝트 상태와 이슈 사항을 전달하였습니다.',SYSDATE,'조치완료',12);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','추가 인력을 배치합니다.',SYSDATE,'진행',13);
INSERT INTO Z_RISK_ACTION VALUES(Z_RISK_ACTION_SEQ.NEXTVAL, '02MA064','추가 인력 배치 완료',SYSDATE,'진행',13);



-- 조회
SELECT * FROM Z_RISK_ACTION;
SELECT * FROM Z_USER zu ;

-- 건들면 큰일나는 테이블 삭제
DROP TABLE Z_RISK_ACTION CASCADE CONSTRAINTS;
DROP SEQUENCE Z_RISK_ACTION_SEQ;

----------------------------------------------------------------



-- 산출물 테이블 ##########
CREATE TABLE Z_OUTPUTS(
	o_no NUMBER CONSTRAINT z_outputs_no_pk PRIMARY KEY,
	o_name VARCHAR2(100) CONSTRAINT z_outputs_name_nn NOT NULL,
	o_path VARCHAR2(500) NULL,
	o_content VARCHAR2(1000) NULL,
	j_no NUMBER CONSTRAINT z_output_j_no_fk REFERENCES Z_JOB(j_no) ON DELETE CASCADE
);
CREATE SEQUENCE Z_OUTPUTS_NO_SEQ
	START WITH 1
	INCREMENT BY 1;
SELECT * FROM ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME LIKE 'Z_OUTPUTS%';
--NOT NULL 제거(변경)
ALTER TABLE Z_OUTPUTS MODIFY o_path VARCHAR2(500) NULL;

-- 데이터
INSERT INTO Z_OUTPUTS VALUES(Z_OUTPUTS_NO_SEQ.NEXTVAL, '요구사항정의서 완료 사진', '/z01_upload/img/1.png', '작업 완료했습니다.', 1);
INSERT INTO Z_OUTPUTS VALUES(Z_OUTPUTS_NO_SEQ.NEXTVAL, '완료', '/z01_upload/img/2.png', '작업 완료했습니다.', 2);
INSERT INTO Z_OUTPUTS VALUES(Z_OUTPUTS_NO_SEQ.NEXTVAL, '사진', '/z01_upload/img/3.png', '작업 완료했습니다.', 4);
INSERT INTO Z_OUTPUTS VALUES(Z_OUTPUTS_NO_SEQ.NEXTVAL, '사진', '/z01_upload/img/3.png', '작업 완료했습니다.', 5);

-- 조회
SELECT * FROM Z_OUTPUTS;
SELECT Z_OUTPUTS_NO_SEQ.CURRVAL FROM DUAL;
-- 삭제
DROP TABLE Z_OUTPUTS CASCADE CONSTRAINTS;
DROP SEQUENCE Z_OUTPUTS_NO_SEQ;



