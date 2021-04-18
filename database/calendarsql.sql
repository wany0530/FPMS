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

DROP SEQUENCE Z_CALENDAR_NO_SEQ;
DROP TABLE z_calendar;

INSERT INTO Z_CALENDAR VALUES (Z_CALENDAR_NO_SEQ.NEXTVAL, '미팅',
	'2021-04-01T00:00:00.000Z','2021-04-02T00:00:00.000Z', 2, '삼성전자 PTC 개발 건 관련 담당자', 'yellow','navy','orange',3);
SELECT * FROM z_calendar;
