-- ����� myMem ȭ���Դϴ�.

CREATE TABLE tbl_score(
    g_id	    NUMBER		    PRIMARY KEY,
    g_stname	NVARCHAR2(50)	NOT NULL,	
    g_subject	NVARCHAR2(10)	NOT NULL,	
    g_score	    NUMBER		
);

DESC tbl_score;

SELECT COUNT(*) FROM tbl_score;
SELECT * FROM tbl_score;

SELECT g_stname AS �̸�, SUM(g_score) AS ���� FROM tbl_score GROUP BY g_stname;

-- SQL���� SELECT�� for ��ɰ� ���� ����
-- SELECT g_stname, SUM(g_stname) FROM tbl_score group by g_stname;
-- =>> ���� ��ɹ������� invalid number��� ���� �߻�
--     CAUSE : SUM�̶�� �Լ��� ���ڿ������� �־ 
--     ACTION : SUM(g_score)��... 

-- �л����� ������ �� �ٿ� �����ϴ� SQL�� �ۼ�
-- �̸� ���� ���� ���� ... <<< �̷� ������
-- 1. �л��� : �л��̸� Į������ �׷��� �����
SELECT g_stname
FROM tbl_score
GROUP BY g_stname;

-- 2. ������ ���ٿ� ����
SELECT g_stname, ����, ����, ����, ����, ����
FROM tbl_score
GROUP BY g_stname;
-- ���� SQL���� ����,����,���� �� ������ Į���� tbl_score�� ���������ʴ´�.
-- ������ ��𿡼��� ������ ����ؼ� ����(Į��)�� �����ϴ� �κ��� �ʿ��ϴ�.
-- ������ ����ϴ� �ڵ带 ����Ŭ�� �Լ��� �̿��ؼ� �ۼ��Ѵ�.
SELECT g_subject,
    DECODE(g_subject, '����', g_score, 0) AS ����,
    DECODE(g_subject, '����', g_score, 0) AS ����,
    DECODE(g_subject, '����', g_score, 0) AS ����,
    DECODE(g_subject, '����', g_score, 0) AS ����,
    DECODE(g_subject, '�̼�', g_score, 0) AS �̼�,
    DECODE(g_subject, '����', g_score, 0) AS ����
FROM tbl_score;

SELECT g_subject,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '�̼�', g_score, 0)) AS �̼�,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����
FROM tbl_score GROUP BY g_subject;

SELECT g_stname,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '�̼�', g_score, 0)) AS �̼�,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����
FROM tbl_score  GROUP BY g_stname;

CREATE VIEW �����϶�ǥ
AS
SELECT g_stname,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����,
    SUM(DECODE(g_subject, '�̼�', g_score, 0)) AS �̼�,
    SUM(DECODE(g_subject, '����', g_score, 0)) AS ����
FROM tbl_score  GROUP BY g_stname;

SELECT * FROM �����϶�ǥ;

SELECT * FROM tbl_iolist 
WHERE ROWNUM < 10;

SELECT * FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- �ŷ�ó���� �ŷ��ݾ��� ���ΰ� �˰�ʹ�.
SELECT I.io_dcode, D.d_name, D.d_ceo, SUM(I.io_price * I.io_quan) AS �ŷ��ݾ� 
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code GROUP BY I.io_dcode, D.d_name, D.d_ceo;
-- �� SQL�� �ŷ�ó���� �ܼ��� �ŷ��ݾ��� �ջ��� ���

-- �ŷ�ó���� ���Աݾװ� ����ݾ��� ������ �˰�ʹ�.
SELECT I.io_dcode, D.d_name, D.d_ceo, 
    SUM(DECODE(I.io_inout, '����', I.io_price * I.io_quan,0)) AS ���Աݾ�,
    SUM(DECODE(I.io_inout, '����', I.io_price * I.io_quan,0)) AS ����ݾ� 
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code GROUP BY I.io_dcode, D.d_name, D.d_ceo;

SELECT g_stname FROM tbl_score GROUP BY g_stname ORDER BY g_stname;

CREATE TABLE tbl_student(
    s_number	CHAR(10)		PRIMARY KEY,
    s_name	    NVARCHAR2(30)	NOT NULL	
);

SELECT COUNT(*) FROM tbl_student;
DESC tbl_student;
SELECT * FROM tbl_student;

SELECT *
FROM tbl_score G
LEFT JOIN tbl_student S
ON G.g_stname = S.st_name;

ALTER TABLE tbl_student RENAME COLUMN st_name to st_num;
ALTER TABLE tbl_student RENAME COLUMN s_name to st_name;

ALTER TABLE tbl_score ADD g_stnum CHAR(5);
DESC tbl_score;

UPDATE tbl_score SC SET SC.g_stnum = (SELECT st_num FROM tbl_student ST WHERE SC.g_stname = ST.st_name); 

ALTER TABLE tbl_score MODIFY(g_stnum CHAR(10));

SELECT * FROM tbl_score
LEFT JOIN tbl_student
on tbl_score.g_stnum = tbl_student.st_num where tbl_student.st_name is null;

ALTER TABLE tbl_score DROP COLUMN g_stname;

SELECT SC.g_stnum, ST.st_name
FROM tbl_score SC
LEFT JOIN tbl_student ST
ON SC.g_stnum = ST.st_num;

CREATE TABLE tbl_subject(
    sb_code	CHAR(10)		PRIMARY KEY,
    sb_name	NVARCHAR2(30)	NOT NULL	
);

INSERT INTO tbl_subject
VALUES('B0001', '����');
INSERT INTO tbl_subject
VALUES('B0002', '����');
INSERT INTO tbl_subject
VALUES('B0003', '����');
INSERT INTO tbl_subject
VALUES('B0004', '����');
INSERT INTO tbl_subject
VALUES('B0005', '����');
INSERT INTO tbl_subject
VALUES('B0006', '�̼�');

SELECT * FROM tbl_subject;

ALTER TABLE tbl_score ADD g_sbcode CHAR(10);

UPDATE tbl_score SC SET SC.g_sbcode = (SELECT SB.sb_code FROM tbl_subject SB WHERE SC.g_subject = SB.sb_name);

SELECT SC.g_sbcode, SB.sb_code, SC.g_subject, SB.sb_name
FROM tbl_score SC
LEFT JOIN tbl_subject SB
ON SC.g_sbcode = SB.sb_code ;
