CREATE TABLE Z_PROJECT
	p_no NUMBER CONSTRAINT p_project_no pk PRIMARY KEY,
	p_name varchar2(100) CONSTRAINT p_project_name_nn NOT NULL,
	p_startD DATE CONSTRAINT p_project_startD_nn NOT NULL,
	p_endD DATE CONSTRAINT p_project_endD_nu NULL,
	p_content varchar2(1000) CONSTRAINT p_project_content_nn NOT NULL,
	p_pm varchar2(50) CONSTRAINT p_project_pm_nn NOT NULL,
	d_no NUMBER CONSTRAINT p_d_no_fk REFERENCES Z_DEPARTMENT(d_no) ON DELETE CASCADE
);

CREATE SEQUENCE Z_PROJECT_NO_SEQ
	START WITH 1
	INCREMENT BY 1;
	
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

DROP TABLE Z_PROJECT;
DROP SEQUENCE Z_PROJECT_NO_SEQ;