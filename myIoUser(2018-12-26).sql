-- 여기는 myIoUser 화면입니다.

CREATE TABLE tbl_iolist(
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10) NOT NULL,		
    io_pname	NVARCHAR2(50)	NOT NULL,	
    io_dname	NVARCHAR2(50)	NOT NULL,	
    io_ceo	    NVARCHAR2(30)	NOT NULL,	
    io_inout	CHAR(10),		
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

DROP TABLE tbl_iolist;

SELECT * FROM tbl_iolist;

SELECT io_inout, COUNT(*) FROM tbl_iolist GROUP BY io_inout;
DESC tbl_iolist;

SELECT io_dname AS 거래처, io_ceo AS 대표자명 FROM tbl_iolist GROUP BY io_dname, io_ceo;

CREATE TABLE tbl_dept(
    d_code	CHAR(10)		PRIMARY KEY,
    d_name	NVARCHAR2(50)	NOT NULL,	
    d_ceo	NVARCHAR2(30)	
);

SELECT count(*) from tbl_dept;
SELECT * FROM tbl_dept;

--  EQ JOIN
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;

-- LEFT JOIN
SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;

ALTER TABLE tbl_iolist ADD io_dcode CHAR(10);

UPDATE tbl_iolist I SET io_dcode = (SELECT D.d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT count(*) from tbl_iolist;
SELECT count(*) from tbl_dept;

SELECT I.io_dname, D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo
WHERE D.d_name is null or D.d_ceo is null;

-- 거래처명이 누락된 항목이 있느냐?
SELECT io_dname 
FROM tbl_iolist 
WHERE io_dname is null;

-- 거래처명이 있는 항목이 있느냐?
SELECT io_dname
FROM tbl_iolist
WHERE io_dname is not null;

-- 숫자 칼럼이 0인 것은 0이라는 값을 INSERT, UPDATE 실행 한 것
SELECT io_price
FROM tbl_iolist
WHERE io_price = 0;

-- 숫자 칼럼이 NULL인 것은 처음부터 아예 값을 INSERT 하지 않은 것
SELECT io_price
FROM tbl_iolist
WHERE io_price is null;

SELECT I.io_dname, I.io_ceo, (SELECT D.d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND D.d_ceo = I.io_ceo) dcode
FROM tbl_iolist I;

SELECT io_dcode, io_dname, io_ceo FROM tbl_iolist;