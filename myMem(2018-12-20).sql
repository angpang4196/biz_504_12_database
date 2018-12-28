-- ����� myMem ����ȭ���Դϴ�.

-- ���� ���̺� ����
DROP TABLE tbl_iolist;
DROP TABLE tbl_dept;

-- ������ ���Ը��� ������ ����Ŭ�� import
-- ���Ը���DB�κ��� ��2����ȭ�� �����ؼ� �ŷ�ó ������ �и�

CREATE TABLE tbl_iolist(
    io_id	    NUMBER		    PRIMARY KEY,
    io_date	    CHAR(10)	    NOT NULL,	
    io_Cname	NVARCHAR2(50)	NOT NULL,	
    io_Dname	NVARCHAR2(50)	NOT NULL,	
    io_dceo	    NVARCHAR2(50),		
    io_inout	NVARCHAR2(5)	NOT NULL,	
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER
);

-- ������ import Ȯ��
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

-- ���� ���� �����ؼ� import Ȯ��
SELECT io_inout, COUNT(*) FROM tbl_iolist GROUP BY io_inout;

-- ���Ը����������� �ŷ�ó������ �ٸ� table�� �и��ؼ� ��2����ȭ ������ ����
-- 1. ���Ը����������� �ŷ�ó������ ����
--  ��. �ŷ�ó��� ��ǥ���� �׷����� ���� ����Ʈ�� ����
SELECT io_dname, io_dceo FROM tbl_iolist GROUP BY io_dname, io_dceo ORDER BY io_dname;

--  ��. �������� ������ �ŷ�ó������ import�ϱ� ���ؼ� table�� ����
CREATE TABLE tbl_dept(
    d_code	CHAR(6)		    PRIMARY KEY,
    d_name	NVARCHAR2(50)	NOT NULL,	
    d_ceo	NVARCHAR2(50)		
);

--  ��. �����κ��� �ŷ������� import
SELECT COUNT(*) FROM tbl_dept;

-- 2. tbl_iolist�� tbl_dept�� ������ Į���� �߰��ϰ� 
--    tbl_dept�κ��� �����۾��� ����

--  ��. Į���߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(6);

--  ��. �߰��� Į�� Ȯ��
DESC tbl_iolist;

-- SUB QUERY
-- DML���ο� �ٸ� SELECT���� �ִ� SQL�� ���Ѵ�.
SELECT io_dname, io_dceo, io_dcode FROM tbl_iolist;

-- ���� SQL�� SUB QUERY�� �߰��ؼ� dept ���̺�κ��� io_dcode�� ��ȸ
SELECT io_dname, io_dceo, 
    (SELECT d_code FROM tbl_dept D WHERE D.d_name = tbl_iolist.io_dname AND D.d_ceo = tbl_iolist.io_dceo) AS d_code
FROM tbl_iolist;

-- SUB QUERY�� ����ؼ� tbl_dept�κ��� tbl_iolist�� �ŷ�ó�ڵ带 update�ϴ� �ڵ�
UPDATE tbl_iolist I
SET io_dcode = (SELECT d_code FROM tbl_dept D WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_dceo);

SELECT io_dcode, io_dname, io_dceo FROM tbl_iolist ORDER BY io_dcode;

-- tbl_iolist�� io_dname�� io_dceo Į���� ����
ALTER TABLE tbl_iolist DROP COLUMN io_dname;
ALTER TABLE tbl_iolist DROP COLUMN io_dceo;

DESC tbl_iolist;

-- iolist�� dept ���̺��� join�ؼ� ��ȸ�ϴ� SQL
SELECT I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I , tbl_dept D
WHERE I.io_dcode = D.d_code ;
-- �� JOIN�� EQ JOIN �̶�� �ϸ�, tbl_iolist ���̺��� tbl_dept ���̺� ���� io_dcode�� 
-- ���� �������� �ʴ´ٴ� ������ ���� �� ������ ����� �����ش�.
-- ���� ��Ȳ������ tbl_dept�� ���� �ڵ尡 tbl_iolist���� ������ �� �ִ�.

-- �׽�Ʈ �����͸� ����� ���ؼ� ���� �������� io_dcode�� ������ ����
SELECT * FROM tbl_iolist WHERE io_dcode = 'D00100';

UPDATE tbl_iolist SET io_dcode = 'D00500' WHERE io_id = 306;

SELECT I.io_id, I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I , tbl_dept D
WHERE I.io_dcode = D.d_code AND io_id BETWEEN 300 AND 310 ORDER BY I.io_id;

-- JOIN ���� ���� ���·� ���Ը��� ���о��� �հ�ݾ��� ���
SELECT COUNT(*) , SUM(io_total) FROM tbl_iolist WHERE io_id BETWEEN 300 AND 310;

-- EQ JOIN ���� ���Ը��� ���о��� �հ�ݾ��� ���
-- ���� �հ�ݾװ� ������ ���̰� ����.
SELECT COUNT(*) , SUM(io_total)
FROM tbl_iolist I , tbl_dept D
WHERE I.io_dcode = D.d_code AND io_id BETWEEN 300 AND 310 ;

-- LEFT JOIN ���� ���Ը��� ���о��� �հ�ݾ��� ���
SELECT COUNT(*) , SUM(io_total)
FROM tbl_iolist I LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code WHERE io_id BETWEEN 300 AND 310 ;

-- LEFT JOIN�� 
--      ���� table�� �����ʹ� ��� �����ְ�, 
--      ���� table�� Ű(io_dcode)�� ��ġ�ϴ� �����Ͱ�
--      ������ table�� ������ �����ְ�, ������ null�� ǥ���϶�.
-- ������ table �� ��ġ�ϴ� �����Ͱ� ��� ���� �������� �Ϻΰ� �����Ǿ�
--      ��谡 �߸��Ǵ� ������ Ȯ���ϴ� ����̸�
--      ���� ��Ȳ���� ����� ������ JOIN�̴�.
SELECT I.io_dcode, D.d_name , D.d_ceo FROM tbl_iolist I 
LEFT JOIN tbl_dept D ON I.io_dcode = D.d_code
WHERE I.io_id BETWEEN 300 AND 310;

SELECT * FROM tbl_iolist;

-- iolist�κ��� �ŷ�ó ������ �и�
-- 1. �ŷ�ó������ GROUPING �Ͽ� ���� ����Ʈ ��ȸ
-- 2. ������ ����
-- 3. CODE�� �ο�
-- 4. TABLE ����
-- 5. import
-- 6. iolist�� dcode Į�� ����
-- 7. �ŷ�ó���� ���̺��� iolist�� dcodeĮ���� update

-- ��ǰ�ڵ� : p_code, ���̺�� : tbl_product
SELECT io_cname FROM tbl_iolist GROUP BY io_cname;

CREATE TABLE tbl_product(
    p_code	CHAR(5)		    PRIMARY KEY,
    p_name	NVARCHAR2(50)	NOT NULL	
);

SELECT count(*) FROM tbl_product;

ALTER TABLE tbl_iolist ADD io_pcode CHAR(5) ;
DESC tbl_iolist;

UPDATE tbl_iolist I SET io_pcode = (SELECT p_code FROM tbl_product P WHERE I.io_cname = p.p_name);

SELECT io_pcode FROM tbl_iolist;

SELECT I.io_pcode, P.p_name, I.io_inout
FROM tbl_iolist I
LEFT JOIN tbl_product P
ON I.io_pcode = P.p_code ORDER BY I.io_pcode;


    		
