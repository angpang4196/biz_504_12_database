-- ����� myIoUser ȭ���Դϴ�.

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

SELECT io_dname AS �ŷ�ó, io_ceo AS ��ǥ�ڸ� FROM tbl_iolist GROUP BY io_dname, io_ceo;

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

-- �ŷ�ó���� ������ �׸��� �ִ���?
SELECT io_dname 
FROM tbl_iolist 
WHERE io_dname is null;

-- �ŷ�ó���� �ִ� �׸��� �ִ���?
SELECT io_dname
FROM tbl_iolist
WHERE io_dname is not null;

-- ���� Į���� 0�� ���� 0�̶�� ���� INSERT, UPDATE ���� �� ��
SELECT io_price
FROM tbl_iolist
WHERE io_price = 0;

-- ���� Į���� NULL�� ���� ó������ �ƿ� ���� INSERT ���� ���� ��
SELECT io_price
FROM tbl_iolist
WHERE io_price is null;

SELECT I.io_dname, I.io_ceo, (SELECT D.d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND D.d_ceo = I.io_ceo) dcode
FROM tbl_iolist I;

SELECT io_dcode, io_dname, io_ceo FROM tbl_iolist;