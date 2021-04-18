CREATE TABLE Z_JOB (
	j_no NUMBER CONSTRAINT z_job_pk PRIMARY KEY,
--	j_level NUMBER CONSTRAINT z_job_level_nn NOT NULL,
	j_refno NUMBER CONSTRAINT z_job_refno_nn NOT NULL,
	j_name VARCHAR2(100) CONSTRAINT z_job_name_nn NOT NULL,
	j_startD VARCHAR2(50) CONSTRAINT z_job_startD_nn NOT NULL,
	j_endD VARCHAR2(50) CONSTRAINT z_job_endD_nn NOT NULL,
	j_completeR NUMBER CONSTRAINT z_job_completeR NOT NULL
--	p_no NUMBER CONSTRAINT z_p_no_fk REFERENCES Z_PROJECT(p_no) ON DELETE CASCADE,
--	u_no NUMBER CONSTRAINT z_u_no_fk REFERENCES Z_USER(p_no) ON DELETE CASCADE
);
DROP TABLE z_job;
DROP SEQUENCE z_job_no_seq;

CREATE SEQUENCE Z_JOB_NO_SEQ
	START WITH 1
	INCREMENT BY 1;


INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 0, '프론트엔드', '01-04-2021', '30-04-2021', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, 'HTML', '03-04-2021', '10-04-2021', 0.2);
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 1, 'CSS', '12-04-2021', '15-04-2021', 0);


SELECT * FROM z_job;

SELECT rownum rn, LEVEL, j.*
  FROM Z_JOB j
START WITH j_refno = 0
CONNECT BY PRIOR j_no = j_refno
ORDER siblings BY j_no DESC;

	
