SELECT * FROM Z_PROJECT;
SELECT * FROM Z_RESOURCE;
SELECT * FROM Z_JOB;
SELECT * FROM Z_OUTPUTS;
SELECT * FROM Z_RISK;

-- 회원별 참여 프로젝트
SELECT *
  FROM Z_PROJECT
 WHERE p_no IN (
	SELECT p_no
	  FROM Z_RESOURCE
	 WHERE u_no = 7 
 );
-- 회원별 프로젝트
SELECT *
  FROM Z_PROJECT
 WHERE p_no IN (
 	SELECT p_no
  	  FROM Z_RESOURCE
 	 WHERE u_no = 7
 );
 
-- 회원별 프로젝트
SELECT * 
  FROM Z_RESOURCE
 WHERE u_no = 7;
 
-- 프로젝트 별 작업 갯수 및 작업별 산출물 갯수
SELECT j.j_no, count(o.o_no) o_cnt
  FROM Z_JOB j, Z_OUTPUTS o
 WHERE j.j_no = o.j_no(+)
   AND p_no = 1
GROUP BY j.j_no;

-- 1번프로젝트 별 산출물 갯수
SELECT count(o.o_no) o_cnt
  FROM Z_JOB j, Z_OUTPUTS o
 WHERE j.j_no = o.j_no
   AND p_no = 1;
 
-- 프로젝트 별 산출물
SELECT p_no, count(o.o_no) o_cnt
  FROM Z_JOB j, Z_OUTPUTS o
 WHERE j.j_no = o.j_no
   AND p_no IN (
		SELECT p_no
		  FROM Z_RESOURCE
		 WHERE u_no = 7
   )
GROUP BY p_no;

-- 1번 프로젝트 별 리스크 갯수
SELECT count(r.r_no) r_cnt
  FROM Z_JOB j, Z_RISK r
 WHERE j.j_no = r.j_no
   AND p_no = 1;

-- 프로젝트 별 리스크 갯수
SELECT p_no, count(r.r_no) r_cnt
  FROM Z_JOB j, Z_RISK r
 WHERE j.j_no = r.j_no
   AND p_no IN (
		SELECT p_no
		  FROM Z_RESOURCE
		 WHERE u_no = 7
   )
GROUP BY p_no;

SELECT p_no
  FROM Z_RESOURCE
 WHERE u_no = 7;

  -- 회원별 프로젝트
SELECT *
  FROM Z_PROJECT
 WHERE p_no IN (
 	SELECT p_no
  	  FROM Z_RESOURCE
 	 WHERE u_no = 7
 );
  
SELECT * FROM Z_JOB;
SELECT * FROM Z_RISK;

SELECT j_no
  FROM Z_JOB
 WHERE p_no = 1;

-- 작업 별 산출물
SELECT *
  FROM Z_OUTPUTS
 WHERE j_no = 1;

-- 작업 별 산출물 갯수
SELECT j_no, count(o_no)
  FROM Z_OUTPUTS
GROUP BY j_no;

SELECT * FROM Z_OUTPUTS;

-- 프로젝트 등록
INSERT INTO Z_PROJECT
   VALUES(Z_PROJECT_NO_SEQ.NEXTVAL, 'Zenkit', 
         to_date('2021/03/29','YYYY-MM-DD'), to_date('2021/04/30','YYYY-MM-DD'),
         '프로젝트 관리 시스템 PMS', '94MA757', 1);


        
SELECT u_no FROM Z_USER
WHERE u_id = '94IT757';

SELECT * FROM Z_PROJECT;

SELECT * FROM Z_RESOURCE;

SELECT * FROM Z_USER zu;
INSERT INTO Z_RESOURCE
VALUES (16, 6);
SELECT * FROM Z_AUTH;

SELECT * FROM Z_JOB;
SELECT * FROM Z_USER zu ;
SELECT * FROM Z_RESOURCE zr ;
INSERT INTO Z_JOB VALUES
(z_job_no_seq.nextval, 0, 
'Zenkit PMS 시스템','작업설명1' ,
to_date('2021-04-01','yyyy-mm-dd'),
to_date('2021-04-30','yyyy-mm-dd'),
sysdate, sysdate,
0.2, 24, 15);
SELECT * FROM Z_JOB;
INSERT INTO Z_AUTH VALUES (Z_AUTH_NO_SEQ.NEXTVAL, sysdate, NULL, '요청합니다', 80, 11, '승인중');
INSERT INTO Z_AUTH VALUES (Z_AUTH_NO_SEQ.NEXTVAL, sysdate, NULL, '요청합니다', 70, 11, '승인완료');
INSERT INTO Z_AUTH VALUES (Z_AUTH_NO_SEQ.NEXTVAL, sysdate, NULL, '요청합니다', 90, 11, '반려');
INSERT INTO Z_AUTH VALUES (Z_AUTH_NO_SEQ.NEXTVAL, sysdate, NULL, '요청합니다', 30, 11, '회수');

--	프로젝트 참여인원
SELECT u.u_name, ra.r_name, pos.pos_name
  FROM Z_RESOURCE r, Z_USER u, Z_RANK ra, Z_POSITION pos
 WHERE r.u_no = u.u_no
   AND u.r_no = ra.r_no
   AND u.pos_no = pos.pos_no
   AND r.p_no = 1;

-- 프로젝트 정보
SELECT *
  FROM Z_PROJECT
 WHERE p_no = 1;
SELECT * FROM Z_USER zu ;

-- 부서 전체 인원
SELECT u.u_name, ra.r_name, pos.pos_name
  FROM Z_USER u, Z_RANK ra, Z_POSITION pos
 WHERE u.r_no = ra.r_no
   AND u.pos_no = pos.pos_no
	AND d_no = 4;
	
-- 프로젝트에 참여인원 추가
SELECT * FROM Z_RESOURCE zr ;
INSERT INTO Z_RESOURCE 
	  VALUES (1,(SELECT u_no
					   FROM Z_USER
 					  WHERE u_name = '정택진'));
SELECT * FROM Z_USER zu;
SELECT * FROM Z_RESOURCE zr ;

-- 프로젝트에 인원 제거
DELETE Z_RESOURCE
 WHERE p_no = 
   AND u_no = (SELECT u_no
					  FROM Z_USER
 					 WHERE u_name = '정택진')
 					 
-- 부서에서 초대 가능한 인원
SELECT u.u_name, ra.r_name, pos.pos_name
  FROM Z_USER u, Z_RANK ra, Z_POSITION pos
 WHERE u.r_no = ra.r_no
 	AND u.pos_no = pos.pos_no
   AND u.d_no = 5
   AND NOT u.u_no IN (SELECT u_no
								FROM Z_RESOURCE r
								WHERE r.p_no = 1);
SELECT u_no
  FROM Z_RESOURCE r
 WHERE r.p_no = 1;
SELECT * FROM Z_USER zu ;
SELECT u_no
  FROM Z_USER
 WHERE u_name = '정택진';
 
SELECT * FROM z_user;
SELECT * FROM z_jo	b;

-- 회원이 담당하는 프로젝트의 작업 건
SELECT *
  FROM Z_JOB
 WHERE p_no = 1
   AND u_no = 2;

SELECT c1.cnt1, c2.cnt2, c3.cnt3
  FROM (
  	SELECT count(*) cnt1
	  FROM Z_JOB
 	 WHERE p_no = 1
		AND j_completer = 0
  ) c1, (
 	SELECT count(*) cnt2
 	  FROM Z_JOB
	 WHERE p_no = 1
		AND j_completer > 0 
		AND j_completer < 1  
  ) c2, (
	SELECT count(*) cnt3
	  FROM Z_JOB
	 WHERE p_no = 1
	   AND j_completer = 1
  ) c3;

 SELECT * FROM Z_JOB
 WHERE p_no = 1;
SELECT * FROM Z_RISK_STATE zrs ;

-- 프로젝트 리스크 카운트
SELECT c1.cnt1, c2.cnt2, c3.cnt3
  FROM (
	SELECT count(*) cnt1
	  FROM Z_RISK r
	 WHERE j_no IN (
		SELECT j_no FROM Z_JOB WHERE p_no = 1
	 ) AND rs_name = '오픈'
	)c1 ,(
	SELECT count(*) cnt2
	  FROM Z_RISK r
	 WHERE j_no IN (
		SELECT j_no FROM Z_JOB WHERE p_no = 1
	 ) AND rs_name = '진행'
	)c2 ,(
	SELECT count(*) cnt3
	  FROM Z_RISK r
	 WHERE j_no IN (
		SELECT j_no FROM Z_JOB WHERE p_no = 1
	 ) AND rs_name = '조치완료'
	)c3;


SELECT *
  FROM Z_RISK r
 WHERE j_no IN (
	SELECT j_no
 	  FROM Z_JOB
 	 WHERE p_no = 1
 );


SELECT *
 	  FROM Z_JOB
 	 WHERE p_no = 1 ;
 	
SELECT * FROM Z_RISK zr ;
SELECT * FROM Z_USER zu ;
   
 SELECT * FROM Z_JOB
 WHERE p_no = 27;
 
SELECT u_name
  FROM Z_PROJECT p, Z_USER u
 WHERE p.p_pm = u.u_id
   AND p_no = 26;
   
 SELECT * FROM Z_Project;
SELECT * FROM Z_RESOURCE zr ;
 SELECT * FROM Z_USER zu ;
SELECT * FROM z_job;

SELECT *
  FROM Z_JOB
 WHERE p_no = 1
   AND u_no = 4;
   
-- 특정 인원의 특정 프로젝트에 참여한 작업 건
SELECT count(*) cnt
  FROM Z_JOB
 WHERE u_no = 4
   AND p_no = 27;
  
SELECT j_no
  FROM Z_JOB
 WHERE u_no = 4
   AND p_no = 27;

-- 해당인원의 job을 PM으로 변경
UPDATE Z_JOB
   SET u_no = (
   	SELECT u_no
		  FROM Z_USER
		 WHERE u_id = (
		 	SELECT p_pm FROM Z_PROJECT WHERE p_no = 27
		 )
   )
 WHERE j_no IN (
 	SELECT j_no
	  FROM Z_JOB
	 WHERE u_no = 4
	   AND p_no = 27
 );

-- 작업에 참여했지만 소속이 아닌애들 => PM으로 변경
UPDATE Z_JOB
   SET u_no = #{u_no}
 WHERE u_no IN (
	SELECT u_no
	  FROM Z_JOB
	 WHERE p_no = #{p_no}
	   AND u_no NOT IN (
		SELECT u_no
		  FROM Z_RESOURCE
		 WHERE p_no = #{p_no}
		)
 );
-- 작업에 참여한 인원
SELECT u_no
  FROM Z_JOB
 WHERE p_no = 26;
-- 프로젝트에 참여한 인원
SELECT u_no
  FROM Z_RESOURCE
 WHERE p_no = 26;




 
SELECT *
  FROM Z_JOB
 WHERE u_no = 4
   AND p_no = 1;  
  
-- 특정 프로젝트의 PM의 u_no
SELECT u_no
  FROM Z_USER
 WHERE u_id = (
 	SELECT p_pm FROM Z_PROJECT WHERE p_no = 27);
 

UPDATE Z_JOB
   SET u_no = 4
 WHERE u_no IN (
	SELECT u_no
	  FROM Z_JOB
	 WHERE p_no = 27
	   AND u_no NOT IN (
		SELECT u_no
		  FROM Z_RESOURCE
		 WHERE p_no = 27
		)
 );
 
SELECT * FROM Z_JOB
WHERE p_no = 27;

SELECT *
  FROM (
	SELECT ROWNUM num, p.*
	  FROM (
		 	SELECT *
			  FROM Z_PROJECT
			 WHERE p_no IN (
					SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
			 )			AND p_name LIKE '%'||''||'%'
				 ORDER BY p_no DESC
		) p
	)
WHERE num BETWEEN 10 AND 13;

SELECT * FROM Z_USER zu ;