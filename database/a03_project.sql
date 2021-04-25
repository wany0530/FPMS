SELECT * FROM Z_PROJECT;
SELECT * FROM Z_RESOURCE;
SELECT * FROM Z_JOB;
SELECT * FROM Z_OUTPUTS;
SELECT * FROM Z_RISK;
SELECT * FROM Z_USER;


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

SELECT * FROM Z_PROJECT;
SELECT * FROM Z_USER;
SELECT NVL(max(o_no),0) AS o_no
  		  FROM Z_OUTPUTS;
SELECT * FROM Z_OUTPUTS;

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

SELECT *
  FROM Z_RISK
 WHERE p_no = 1
   AND r_receive = '210417-4';
  
  
SELECT count(*) cnt
  FROM Z_PROJECT
 WHERE p_no IN (SELECT p_no FROM Z_RESOURCE WHERE u_no = 3)
	AND p_name LIKE '%'||''||'%';


SELECT count(*) FROM Z_RESOURCE WHERE u_no = 3;
SELECT * FROM Z_USER zu ;

SELECT *
  FROM (
	SELECT ROWNUM num,upproject.*
	  FROM (
		SELECT p.*, pr.riskCnt, po.outputCnt
		  FROM Z_PROJECT p, (
				SELECT p.p_no, count(r.p_no) AS riskCnt
			   FROM Z_RISK r, Z_PROJECT p
			   WHERE r.p_no(+) = p.p_no
				AND p.p_no IN (
					SELECT p_no
					FROM Z_RESOURCE
					WHERE u_no = 3
				)
				GROUP BY p.p_no
		  ) pr, (
				SELECT p.p_no, count(o.o_no) outputCnt
				FROM Z_JOB j, Z_OUTPUTS o, Z_PROJECT p
				WHERE j.j_no = o.j_no(+)
				AND p.p_no = j.p_no(+)
			 	AND p.p_no IN (
			 		SELECT p_no
					FROM Z_RESOURCE
					WHERE u_no = 3
				)
				GROUP BY p.p_no
		  ) po
		WHERE p.p_no = pr.p_no
		  AND p.p_no = po.p_no
		  AND p.p_name LIKE '%'||''||'%'
		ORDER BY p.p_no DESC
	) upproject
)
WHERE num BETWEEN 1 AND 3;

-- 프로젝트 리스트
SELECT *
  FROM (
	SELECT ROWNUM num, p.*
	  FROM (
			SELECT *
			  FROM Z_PROJECT
			 WHERE p_no IN (SELECT p_no FROM Z_RESOURCE WHERE u_no = 3)
			   AND p_name LIKE '%'||'C'||'%'
			ORDER BY p_no DESC
		) p
	)
WHERE num BETWEEN 1 AND 10;

-- 프로젝트 리스크 갯수
SELECT p_no, count(*) riskCnt
  FROM Z_RISK
 WHERE p_no IN (SELECT p_no FROM Z_RESOURCE WHERE u_no = 3)
GROUP BY p_no;

-- 프로젝트 산출물 갯수
SELECT j.p_no, count(o.o_no) outputCnt
  FROM Z_JOB j, Z_OUTPUTS o
 WHERE j.j_no = o.j_no
   AND j.p_no IN (SELECT p_no FROM Z_RESOURCE WHERE u_no = 3)
GROUP BY j.p_no;
 
SELECT * FROM Z_JOB zj ;
SELECT * FROM Z_OUTPUTS zo ;
SELECT * FROM Z_USER zu ;
SELECT * FROM Z_RISK zr ;



SELECT *
  FROM (
	SELECT ROWNUM num,upproject.*
	  FROM (
		SELECT p.*, pr.riskCnt, po.outputCnt
		  FROM Z_PROJECT p, (
				SELECT p.p_no, count(r.p_no) AS riskCnt
			   FROM Z_RISK r, Z_PROJECT p
			   WHERE r.p_no(+) = p.p_no
				AND p.p_no IN (
					SELECT p_no
					FROM Z_RESOURCE
					WHERE u_no = #{u_no}
				)
				GROUP BY p.p_no
		  ) pr, (
				SELECT p.p_no, count(o.o_no) outputCnt
				FROM Z_JOB j, Z_OUTPUTS o, Z_PROJECT p
				WHERE j.j_no = o.j_no(+)
				AND p.p_no = j.p_no(+)
			 	AND p.p_no IN (
			 		SELECT p_no
					FROM Z_RESOURCE
					WHERE u_no = #{u_no}
				)
				GROUP BY p.p_no
		  ) po
		WHERE p.p_no = pr.p_no
		  AND p.p_no = po.p_no
		  AND p.p_name LIKE '%'||#{schWord, jdbcType=VARCHAR}||'%'
		ORDER BY p.p_no DESC
	) upproject
)
WHERE num BETWEEN #{startNum} AND #{endNum}
		
--회원이 참여한 프로젝트의 작업에 산출물 조회
SELECT *
  FROM (
	SELECT ROWNUM num, p.*
	  FROM (
		SELECT p.p_no, p.p_name, j.j_name, o.*
		  FROM Z_OUTPUTS o, Z_JOB j, Z_PROJECT p
		 WHERE o.j_no = j.j_no
		   AND j.p_no = p.p_no
			AND j.j_no IN (
			SELECT j_no FROM Z_JOB WHERE p_no IN (
				SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
			 )
			-- AND p.p_no = 1
			AND j.j_name LIKE '%'||''||'%'
		 )
		ORDER BY o_no DESC
		) p
)
WHERE num BETWEEN 1 AND 10;
SELECT * FROM z_user;


-- 종합 대시보드 프로젝트 테이블 
SELECT DISTINCT 
   zp.P_NAME 
   , zp.P_NO 
   , pm.pm_name
   , zd.D_NAME 
   , (CASE WHEN sysdate < zp.P_STARTD THEN '시작전'
                 WHEN zj.J_COMPLETER = 1 THEN '완료'
                 WHEN zj.J_COMPLETER != 1 AND SYSDATE > zp.P_ENDD THEN '지연'
                 ELSE '진행' END) progress_state
   , zp.P_STARTD 
   , zp.P_ENDD 
   , nvl(zj.j_completer,0) * 100||'%' AS progress_rt
   , nvl(zj2.JOB_CNT,0) AS JOB_CNT
   , nvl(zr.RISK_CNT,0) AS RISK_CNT
FROM Z_PROJECT zp 
LEFT OUTER JOIN 
(
   SELECT
      DISTINCT 
      a.P_NO 
      , a.U_NO 
   FROM Z_RESOURCE a
) zr ON zp.P_NO  = zr.P_NO
LEFT OUTER JOIN 
(
   SELECT
      distinct
      a.U_NO 
      , a.U_NAME 
   FROM z_user a
)zu ON zr.U_NO = zu.U_NO 
LEFT OUTER JOIN 
(
   SELECT
      a.U_ID 
      , a.U_NAME AS pm_name
   FROM Z_USER a
) pm ON zp.p_pm = pm.U_ID
LEFT OUTER JOIN Z_DEPARTMENT zd ON zp.D_NO = zd.D_NO 
LEFT OUTER JOIN 
(
   SELECT
      distinct
      c.P_NO 
      , a.J_COMPLETER
   FROM Z_JOB a
   LEFT OUTER JOIN Z_PROJECT c ON a.p_no = c.p_no
   WHERE a.J_REFNO = 0
) zj ON zp.p_no = zj.p_no
LEFT OUTER JOIN 
(
   SELECT
      c.P_NO
      , COUNT(A.J_NO) AS JOB_CNT
   FROM Z_JOB A
   LEFT OUTER JOIN Z_PROJECT c ON A.p_no = c.p_no
   GROUP BY c.p_no
) zj2 on zp.p_no = zj2.p_no
LEFT OUTER JOIN 
(
   SELECT
      A.P_NO
      , COUNT(A.R_NO) AS RISK_CNT
   FROM Z_RISK A
   GROUP BY A.P_NO
) zr on zp.p_no = zr.p_no
ORDER BY zp.P_NO 
;
SELECT count(*) count
  FROM (
	SELECT p.p_no, p.p_name, j.j_name, o.*
	  FROM Z_OUTPUTS o, Z_JOB j, Z_PROJECT p
	 WHERE o.j_no = j.j_no
	   AND j.p_no = p.p_no
		AND j.j_no IN (
			SELECT j_no FROM Z_JOB WHERE p_no IN (
				SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
			)
		AND p.p_no = 1
		AND j.j_name LIKE '%'||''||'%'
 	)
ORDER BY o_no DESC
);
SELECT * FROM Z_USER zu ;

SELECT * FROM Z_OUTPUTS zo ;

SELECT *
  FROM Z_PROJECT
 WHERE p_no IN (SELECT p_no FROM Z_RESOURCE WHERE u_no = 2);
