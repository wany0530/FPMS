SELECT * FROM Z_RISK;

--건드리면 큰일나는 테이블 드랍더비트...

DROP TABLE z_risk;
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

INSERT INTO z_risk values(z_risk_no_seq.nextval, '데이터베이스 기술 문제','데이터베이스 서버 문제가 생겼습니다.',sysdate,'19IT574',NULL,NULL,NULL,3,'오픈');--1
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


