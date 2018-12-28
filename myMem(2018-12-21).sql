-- ����� myMem ����ȭ���Դϴ�. 

-- tbl_iolist���� ��ǰ���� ���̺��� �и��ؼ� ��2����ȭ ������ ����

-- tbl_iolist�� ������ Ȯ��
SELECT COUNT(*) FROM tbl_iolist;

-- ��ü�����Ͱ� �ƴ� � ���ǿ� �´� �����͸� �����ؼ� Ȯ���ϰ��� �� ���� 
-- WHERE ������ Į�� = ���� ������ SQL�� �̿��Ѵ�.

-- � ������ �����ϱⰡ ����ġ���� �� �׳� �� ���� ������ �����ؼ�( �� : 10��, 100��) ��ȸ�ϰ��� �� ��
-- ����Ŭ�� ���� SQL Ű���� �߿�
-- Į�������� ROWNUM �̶�� Į���� �ִ�.
-- �� Į���� ����� �������� ROW ������ �������� ǥ���ϴ� ����Ŭ DUMMY Į��
SELECT ROWNUM, io_date, io_cname io_dcode FROM tbl_iolist ;

-- ROWNUM Į���� �̿��ϸ� �����͸���Ʈ �߿��� �� ���� ���������� ��ȸ�� �� �� �ִ�.
SELECT ROWNUM, io_date, io_cname FROM tbl_iolist WHERE ROWNUM <= 10;

-- ROWNUM Į���� �̿��ؼ� 10��°��ġ�� �����ͺ��� 20��° ��ġ�� �����͸� ��ȸ�ϰ�ʹ�.
SELECT ROWNUM, io_date, io_cname FROM tbl_iolist WHERE ROWNUM BETWEEN 10 AND 20;

-- MySQL
-- SELECT * FROM tbl_iolist LIMIT 10;

SELECT * FROM tbl_iolist WHERE ROWNUM < 10;

-- ��ǰ������ ��ǰ���̺�� �и��ϱ� ���ؼ� 
-- ��ǰ�̸� ����Ʈ�� �����
SELECT io_cname FROM tbl_iolist GROUP BY io_cname;

SELECT io_cname, io_inout, io_price FROM tbl_iolist WHERE ROWNUM < 10;

-- ���� ��ȸ�� �����Ϳ��� io_inout�� '����'�̸� io_price �� '���Դܰ�'�� ���̰�
--                                   '����'�̸� '����ܰ�'�� ������ ������ ���.
-- �׷��� io_inout�� ���� �ܰ��� �ٸ��� ǥ�� �� ����.
-- ��. ROWNUM���� ���� ����
SELECT io_cname, io_inout,
DECODE(io_inout, '����', io_price) ���Դܰ�,
DECODE(io_inout, '����', io_price) ����ܰ�
FROM tbl_iolist WHERE ROWNUM < 10;

-- ��
SELECT io_cname, io_inout,
DECODE(io_inout, '����', io_price) ���Դܰ�,
DECODE(io_inout, '����', io_price) ����ܰ�
FROM tbl_iolist GROUP BY io_cname, io_inout, DECODE(io_inout, '����', io_price), DECODE(io_inout, '����', io_price);

-- ��
SELECT io_cname, 
    AVG(DECODE(io_inout, '����', io_price)) ���Դܰ�,
    AVG(DECODE(io_inout, '����', io_price)) ����ܰ�
FROM tbl_iolist 
GROUP BY io_cname ORDER BY io_cname;

DROP TABLE tbl_product;

CREATE TABLE tbl_product(
    p_code	    CHAR(9)		    PRIMARY KEY,
    p_name	    NVARCHAR2(50)	NOT NULL,	
    p_iprice	NUMBER,
    p_oprice	NUMBER		
);

SELECT COUNT(*) FROM tbl_product;

-- ���� ��ǰ���� ���̺��� �����ϰ� �����͸� ���������
-- ���Ը����������� ��ǰ�ڵ� Į���� �����ϰ� 
-- ��ǰ�ڵ� Į�� �����͸� UPDATE�ϰ� ��ǰ�� Į���� ����

ALTER TABLE tbl_iolist DROP COLUMN io_pcode;

ALTER TABLE tbl_iolist ADD io_pcode CHAR(9);

DESC tbl_iolist;

-- ���������� �̿��ؼ� iolist�� product ���̺� ���� ���踦 �ѹ� ���캸��
SELECT io_cname, (SELECT p_name FROM tbl_product P WHERE P.p_name = I.io_cname),
    (SELECT p_code FROM tbl_product P WHERE P.p_name = I.io_cname)
FROM tbl_iolist I;

-- product table ���� ��ǰ�ڵ�(p_code)�� ��ȸ�ؼ� 
-- iolist ���̺��� io_pcode Į���� UPDATE����
UPDATE tbl_iolist I SET io_pcode = (SELECT p_code FROM tbl_product P WHERE P.p_name = I.io_cname);

SELECT * FROM tbl_iolist;

-- UPDATE �Ŀ� ����
-- JOIN�� �̿��ؼ� ����
SELECT I.io_pcode, I.io_cname, P.p_code, P.p_name
FROM tbl_iolist I
LEFT JOIN tbl_product P
ON I.io_pcode = P.p_code
ORDER BY I.io_pcode;

-- ��ǰ�� Į���� ����
ALTER TABLE tbl_iolist DROP COLUMN io_cname;

DESC tbl_iolist;

SELECT * FROM tbl_iolist WHERE ROWNUM < 10;

-- tbl_iolist�� ��2����ȭ ������ �Ϸ�Ǿ���.
-- ���Ը��� ���� ���鼭 ��ǰ��� �ŷ�ó���� ���� Ȯ���ϰ�ʹ�.

-- 1. ���Ը������ ��ǰ�� ���� ����
SELECT I.io_date, I.io_pcode, P.p_name, I.io_inout, I.io_price, P.p_iprice, P.p_oprice, I.io_quan, I.io_price * I.io_quan AS �հ�
FROM tbl_iolist I
LEFT JOIN tbl_product P
ON I.io_pcode = P.p_code; 

-- 2. ���Ը������ �ŷ�ó������ ���� ����
SELECT I.io_date, I.io_dcode, D.d_name, I.io_inout, I.io_price, I.io_quan, I.io_price * I.io_quan AS �հ�
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- 3. ���Ը������ ���鼭 ��ǰ����, �ŷ�ó������ ���� ����
SELECT I.io_date, I.io_pcode, P.p_name, I.io_inout, I.io_dcode, D.d_name, D.d_ceo, I.io_price, 
    P.p_iprice, P.p_oprice, I.io_quan, I.io_price * I.io_quan AS �հ�
    FROM tbl_iolist I
    LEFT JOIN tbl_product P
    ON I.io_pcode = P.p_code
    LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

-- ���Ը������ ��ǰ����, �ŷ�ó������ JOIN�ؼ� ��ȸ�� �ߴµ� 
-- ������ �ʹ� ������
-- �׷��� ���� ����� �� ����.
-- �̷� ������ SQL�� VIEW�� ���� �� �ξ��.

CREATE VIEW io_dept_product_view AS
SELECT I.io_date, I.io_pcode, P.p_name, I.io_inout, I.io_dcode, D.d_name, D.d_ceo, I.io_price, 
    P.p_iprice, P.p_oprice, I.io_quan, I.io_price * I.io_quan AS �հ�
    FROM tbl_iolist I
    LEFT JOIN tbl_product P
    ON I.io_pcode = P.p_code
    LEFT JOIN tbl_dept D
ON I.io_dcode = D.d_code;

SELECT * FROM io_dept_product_view;

-- �ŷ����ڰ� 2018-03-01 ~ 2018-03-31 �Ⱓ�� ������ �׸��� ������ �հ�ݾ��� ��ȸ
SELECT io_inout AS ����, COUNT(io_inout) AS �׸񰳼�, SUM(io_total) AS �հ�ݾ� 
FROM tbl_iolist 
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31' AND io_inout = '����'
GROUP BY io_inout;

SELECT io_inout AS ����, COUNT(io_inout) AS �׸񰳼�, SUM(io_total) AS �հ�ݾ� 
FROM tbl_iolist 
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout;

