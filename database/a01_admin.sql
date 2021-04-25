 SELECT * FROM Z_DEPARTMENT;

INSERT INTO Z_DEPARTMENT VALUES (Z_DEPARTMENT_NO_SEQ.NEXTVAL,'IT팀');

-- 비밀번호 변경
UPDATE Z_USER
   SET u_pass = #{u_pass}
 WHERE u_no = #{u_no};
SELECT * FROM Z_USER zu ;

DELETE Z_DEPARTMENT
 WHERE d_name = '테스트';

SELECT za.*, zj.J_NAME AS job_name, zp.P_NAME AS pro_name, zu.u_no AS req_no,
   zu.U_NAME AS req_name, zu2.u_no AS res_no, zu2.U_NAME AS res_name
      FROM Z_AUTH za, Z_JOB zj, Z_USER zu, Z_PROJECT zp, z_user zu2
      WHERE za.J_NO=zj.J_NO
      AND zj.U_NO=zu.U_NO
      AND zj.P_NO=zp.P_NO
      AND zp.P_PM = zu2.U_ID
      AND zp.P_NAME like '%'||''||'%'
      AND zj.J_NAME like '%'||''||'%'
      AND za.A_NAME like '%'||''||'%'
      ORDER BY za.A_DATE DESC;
SELECT * FROM z_project;
SELECT * FROM z_user;


SELECT * FROM Z_AUTH;
SELECT * FROM ;
SELECT * FROM Z_RESOURCE;

SELECT * FROM z_job;
SELECT * FROM Z_OUTPUTS;

INSERT INTO Z_USER
		VALUES(15, '210410-16', 'JcYRBvVXoA', '왕성택',
				'tjdxorv@naver.com', NULL, NULL, NULL,
				NULL, NULL);

SELECT * FROM  Z_USER;
SELECT u.u_id, u.u_name, d.d_name, r.r_name, p.pos_name
  FROM Z_USER u, Z_DEPARTMENT d, Z_POSITION p, Z_RANK r
 WHERE u.d_no = d.d_no
   AND u.r_no = r.r_no
   AND u.pos_no = p.pos_no
   AND d.d_name LIKE '%'||''||'%'
   AND r.r_name LIKE '%'||''||'%'
   AND p.pos_name LIKE '%'||''||'%';
  
SELECT u.u_id, u.u_name, d.d_name, r.r_name, p.pos_name
  FROM Z_USER u, Z_DEPARTMENT d, Z_POSITION p, Z_RANK r
 WHERE u.d_no = d.d_no(+)
   AND u.r_no = r.r_no
   AND u.pos_no = p.pos_no
   AND d.d_name LIKE '%'||''||'%'
   AND r.r_name LIKE '%'||''||'%'
   AND p.pos_name LIKE '%'||''||'%';
  
SELECT u.u_id, u.u_name, d.d_name, r.r_name, p.pos_name
  FROM Z_USER u LEFT OUTER JOIN Z_DEPARTMENT d ON(u.d_no = d.d_no),
  		 Z_POSITION p, Z_RANK r
 WHERE u.r_no = r.r_no
 	AND u.pos_no = p.pos_no;
 
 	AND d.d_name LIKE  '%'||''||'%'
	 OR d.d_name IS NULL
	AND r.r_name LIKE '%'||''||'%'
   AND p.pos_name LIKE '%'||''||'%';

SELECT * FROM (
	SELECT u.u_id, u.u_name, d.d_name, r.r_name, p.pos_name
 	  FROM Z_USER u 
 	  LEFT OUTER JOIN Z_DEPARTMENT d ON(u.d_no = d.d_no)
	  LEFT OUTER JOIN Z_POSITION p ON(u.pos_no = p.pos_no)
	  LEFT OUTER JOIN Z_RANK r ON(u.r_no = r.r_no)
)
WHERE (d_name LIKE  '%'||''||'%' OR d_name IS NULL)
  AND (pos_name LIKE  '%'||'IT'||'%' OR pos_name IS NULL)
  AND (r_name LIKE  '%'||''||'%' OR r_name IS NULL)
ORDER BY d_name;
  
SELECT u.u_id, u.u_name, d.d_name
  FROM Z_USER u LEFT OUTER JOIN Z_DEPARTMENT d ON(u.d_no = d.d_no);
 
 
 
SELECT u.u_id, u.u_name, d.d_name, r.r_name
  FROM Z_USER u, Z_DEPARTMENT d, Z_RANK r
 WHERE u.d_no = d.d_no(+)
   AND u.r_no = r.r_no;
  



SELECT * FROM Z_USER;
SELECT * FROM Z_DEPARTMENT
ORDER BY d_no;
SELECT * FROM Z_POSITION;
SELECT * FROM z_rank;

INSERT INTO Z_USER VALUES
(Z_USER_NO_SEQ.NEXTVAL, 'TEST','you55','유성환',
							'hwan@google.com','01055198510','img/user/19IT574_유성환.jpg',5,10,06);
INSERT INTO Z_USER VALUES
(14, '210410-14','sdfj12','왕성택',NULL,NULL,NULL,NULL,NULL,NULL);
			
SELECT rownum rn, LEVEL, j_no, j_refno, d.P_NAME AS j_pname, j_name, j_content, j_startD, j_endD, j_regD, j_uptD, c.u_name j_charger, j_completeR, d.p_no, b.u_no
  FROM z_job a, z_resource b, z_user c, Z_PROJECT d
  WHERE d.p_no = 1 AND a.u_no = b.u_no AND b.u_no = c.u_no AND a.p_no = b.p_no AND b.p_no =d.p_no
START WITH j_refno = 0
CONNECT BY PRIOR j_no = j_refno
ORDER siblings BY j_no DESC;

SELECT * FROM z_user;
SELECT *
  FROM Z_USER;
SELECT * FROM Z_PROJECT zp ;
SELECT * FROM Z_USER zu ;
UPDATE Z_USER
   SET d_no = 56
 WHERE u_no = 14;
 
UPDATE Z_USER
   SET d_no = (
		SELECT d_no
		  FROM Z_DEPARTMENT
		 WHERE d_name = '부서없음'
   )
 WHERE d_no = (
		SELECT d_no
		  FROM Z_DEPARTMENT
		 WHERE d_name = 'ㄹㄹㄹㄹㄹ'
);

DELETE z_user
 WHERE u_id = 'T';

SELECT * FROM Z_USER;

-- 회원정보 업데이트
UPDATE Z_USER
	SET d_no = (
		SELECT d_no
		  FROM Z_DEPARTMENT
		 WHERE d_name = 'IT팀'
	), pos_no = (
		SELECT pos_no
		  FROM Z_POSITION
		 WHERE pos_name = 'IT팀원'
	), r_no =(
		SELECT r_no
		  FROM Z_RANK
		 WHERE r_name = '사원'
	)
 WHERE U_ID = '18IT279';

SELECT d_no
  FROM Z_DEPARTMENT
 WHERE d_name = '경영지원';
SELECT * FROM Z_USER;
SELECT * FROM Z_DEPARTMENT;
SELECT * FROM Z_POSITION;
SELECT * FROM Z_RANK;
SELECT * FROM Z_PROJECT;

SELECT * FROM Z_USER;
SELECT max(u_no) FROM Z_USER;
SELECT max(p_no) p_no FROM Z_PROJECT;
SELECT * FROM Z_RESOURCE zr ;
SELECT * FROM Z_DEPARTMENT zd ;

SELECT u.*, d.d_name, pos.pos_name, r.r_name
  FROM Z_USER u, Z_DEPARTMENT d, Z_POSITION pos, Z_RANK r
 WHERE u.d_no = d.d_no
 	AND u.pos_no = pos.pos_no
   AND u.r_no = r.r_no
   AND u.u_id = '02MA064'
   AND u.u_pass = 'kangny56';
   
UPDATE Z_USER
   SET u_email = 'neeyonee@google.com',
		 u_phone = '010-1234-5678',
		 u_img = 'aaa'
 WHERE u_id = '02MA064';
 
 SELECT * FROM Z_USER;

SELECT *
  FROM (
	SELECT ROWNUM num, p.*, count(r_no)
	  FROM (
		 	SELECT *
			  FROM Z_PROJECT p, Z_RISK r
			 WHERE p.p_no = r.r_no(+)
			   AND p_no IN (
					SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
			 )			AND p_name LIKE '%'||''||'%'
			 	 GROUP BY p.*
				 ORDER BY p_no DESC
		) p
	)
WHERE num BETWEEN 1 AND 10;

SELECT *,
  FROM Z_PROJECT p
 WHERE p_no IN (
	SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
 )
   AND p_name LIKE '%'||''||'%'
ORDER BY p_no DESC;

SELECT p.p_no, p.p_name, p.p_startD, p.p_endD, p.p_content, p.p_pm, p.d_no,
		 count(r_no) AS riskCnt,
		 count(o_no) AS outputCnt
  FROM Z_RISK r, Z_PROJECT p, Z_OUTPUTS o, Z_JOB j
 WHERE r.p_no(+) = p.p_no
   AND p.p_no = j.p_no(+)
   AND j.j_no = o.j_no(+)
   AND p.p_no IN (
	SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
 )
GROUP BY p.p_no, p.p_name, p.p_startD, p.p_endD, p.p_content, p.p_pm, p.d_no;


SELECT *, (SELECT count(*) FROM Z_RISK WHERE p_no IN (		SELECT p_no
		  FROM Z_RESOURCE
		 WHERE u_no = 3)
  FROM Z_PROJECT
 WHERE p_no IN (
		SELECT p_no
		  FROM Z_RESOURCE
		 WHERE u_no = 3
 );

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
WHERE num BETWEEN 0 AND 99;
SELECT * FROM Z_USER zu ;

SELECT p.p_no, count(o.o_no) outputCnt
  FROM Z_JOB j, Z_OUTPUTS o, Z_PROJECT p
 WHERE j.j_no = o.j_no(+)
	AND p.p_no = j.p_no(+)
 	AND p.p_no IN (
 		SELECT p_no
		FROM Z_RESOURCE
		WHERE u_no = 3
)
GROUP BY p.p_no;


SELECT p_no
		FROM Z_RESOURCE
		WHERE u_no = 3;
SELECT * FROM Z_OUTPUTS zo ;
SELECT * FROM Z_JOb;

SELECT p.p_no, count(r.p_no) AS riskCnt
  FROM Z_RISK r, Z_PROJECT p
 WHERE r.p_no(+) = p.p_no
   AND p.p_no IN (
 		SELECT p_no
		FROM Z_RESOURCE
		WHERE u_no = 3
	 	)
GROUP BY p.p_no;
	


SELECT pr.
  FROM (
	SELECT p.p_no, p.p_name, p.p_startD, p.p_endD, p.p_content, p.p_pm, p.d_no,
		 count(r_no) AS riskCnt
  	  FROM Z_RISK r, Z_PROJECT p
 	 WHERE r.p_no(+) = p.p_no
   	AND p.p_no IN (
	SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
 	) GROUP BY p.p_no, p.p_name, p.p_startD, p.p_endD, p.p_content, p.p_pm, p.d_no  
) pr ;


SELECT p.p_no, p.p_name, p.p_startD, p.p_endD, p.p_content, p.p_pm, p.d_no,
		 count(r_no) AS riskCnt
  FROM Z_RISK r, Z_PROJECT p
 WHERE r.p_no(+) = p.p_no
   AND p.p_no IN (
	SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
 )
GROUP BY p.p_no, p.p_name, p.p_startD, p.p_endD, p.p_content, p.p_pm, p.d_no;

SELECT p.p_no, p.p_name, count(o_no)
  FROM Z_PROJECT p, Z_OUTPUTS o, Z_JOB j
 WHERE p.p_no = j.p_no(+)
   AND j.j_no = o.j_no(+)
 GROUP BY p.p_no, p.p_name;

SELECT * FROM Z_OUTPUTS zo ;
SELECT * FROM Z_JOB;
SELECT * FROM Z_RISK zr ;

SELECT *
  FROM Z_OUTPUTS
 WHERE j_no IN (
	 SELECT j_no
	  FROM Z_JOB
	 WHERE p_no IN (
		SELECT p_no FROM Z_RESOURCE WHERE u_no = 3
	 )
 );

SELECT * FROM z_user;



