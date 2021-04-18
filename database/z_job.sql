-- 테이블 생성
CREATE TABLE Z_JOB (
	j_no NUMBER CONSTRAINT z_job_pk PRIMARY KEY,
--	j_level NUMBER CONSTRAINT z_job_level_nn NOT NULL,
	j_refno NUMBER CONSTRAINT z_job_refno_nn NOT NULL,
	j_name VARCHAR2(500) CONSTRAINT z_job_name_nn NOT NULL,
	j_startD VARCHAR2(200) CONSTRAINT z_job_startD_nn NOT NULL,
	j_endD VARCHAR2(200) CONSTRAINT z_job_endD_nn NOT NULL,
	j_charger VARCHAR2(200) CONSTRAINT z_job_charger_nn NOT NULL,
	j_completeR NUMBER CONSTRAINT z_job_completeR NOT NULL
--	p_no NUMBER CONSTRAINT z_p_no_fk REFERENCES Z_PROJECT(p_no) ON DELETE CASCADE,
--	u_no NUMBER CONSTRAINT z_u_no_fk REFERENCES Z_USER(p_no) ON DELETE CASCADE
);

-- 시퀀스 생성
CREATE SEQUENCE Z_JOB_NO_SEQ
	START WITH 1
	INCREMENT BY 1;


--삭제
DROP TABLE z_job;
DROP SEQUENCE z_job_no_seq;

-- 데이터
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 0, 'Zenkit PMS 시스템', '01-04-2021', '30-04-2021','왕성택', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '로그인/프로필', '01-04-2021', '02-04-2021','최혜주', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '대시보드', '02-04-2021', '03-04-2021','이슬', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '내작업', '03-04-2021', '04-04-2021','이슬', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '프로젝트/배정현황', '04-04-2021', '05-04-2021','왕성택', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '프로젝트/리스크', '05-04-2021', '06-04-2021','이지은', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '프로젝트/간트차트', '06-04-2021', '07-04-2021','이재완', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '리스크관리', '07-04-2021', '08-04-2021','최혜주', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, '결제관련', '08-04-2021', '09-04-2021','강혜지', 0);


SELECT * FROM z_job;

SELECT rownum rn, LEVEL, j.*
  FROM Z_JOB j
START WITH j_refno = 0
CONNECT BY PRIOR j_no = j_refno
ORDER siblings BY j_no DESC;

	
