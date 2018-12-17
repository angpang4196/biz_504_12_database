-- ����� myuser ���� ȭ���Դϴ�.
-- ���Ը������(����)���Ͽ��� DataBase�� �����͸� �ű��
-- DB ��Ģ�� �µ��� �����ϴ� ����

CREATE TABLE io_list(
    id	        NUMBER PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,
    io_cname	nVARCHAR2(50)	NOT NULL,
    io_dname	nVARCHAR2(30)	NOT NULL,
    io_dceo	    nVARCHAR2(10),
    io_inout	nVARCHAR2(5),	
    io_quan  	NUMBER,
    io_price	NUMBER,	
    io_total	NUMBER	
);

SELECT * FROM io_list;

SELECT COUNT(*) FROM io_list;

DELETE FROM io_list;

-- 2018-02-01 ~ 2018-02-28 �Ⱓ�� ���� ����Ʈ ����
SELECT * FROM io_list WHERE io_date between '2018-02-01' AND '2018-02-28' AND io_inout = '����' ;

-- 2018-02-01 ~ 2018-02-28 �Ⱓ�� ���� ����Ʈ ����
SELECT * FROM io_list WHERE io_date between '2018-02-01' AND '2018-02-28' AND io_inout = '����' ;

-- ��ü ����Ʈ�� ������ io_total�� �հ踦 ����
SELECT COUNT(*) as ����, SUM(io_total) as �հ� FROM io_list;

-- ��� �Լ��� �̿��ؼ� ������ �հ踦 ���ϴ� �� 
-- ������ �����հ�, �����հ踦 ���� ����ϰ� �ʹ�.
-- 1. ���԰� ������ �����ϴ� Į�� : io_inout
SELECT SUM(io_total) as �����հ� FROM io_list WHERE io_inout = '����';

SELECT io_inout, COUNT(io_total), SUM(io_total) FROM io_list GROUP BY io_inout;

-- 2. ������ �հ踦 ��� 
-- ���� : ��¥���� �˻� : io_date
SELECT io_date, count(*), SUM(io_total) FROM io_list GROUP BY io_date ORDER BY io_date;

-- 3. ���� : ��¥���� ����, �ٽ� ���� ����� �����Ͽ� ������ �հ踦 ���
-- ��¥ ���� : io_date
-- ���� ���� ���� : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_total) FROM io_list GROUP BY io_date, io_inout ORDER BY io_date;

-- ���а� ��¥ ������ �ٲپ...
SELECT io_inout, io_date, COUNT(*), SUM(io_total) FROM io_list GROUP BY io_inout, io_date ORDER BY io_inout;

-- ����, ������ �����ϰ� ��¥���� ������ �հ� ����Ͽ� ����, ��¥������ 2018-03-01 ~ 2018-03-31
SELECT io_inout, io_date, COUNT(*), SUM(io_total) FROM io_list  
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date ORDER BY io_date;

-- �հ�ݾ��� 100���� �̻��� �׸�
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM io_list  
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date 
HAVING SUM(io_total) >= 500000
ORDER BY io_inout;
-- ����Լ��� ����ϴ� ���
-- ����Լ� ����� ���� �����ϴ� list�� �����ϰ������
-- (�ʿ��� ������ ���� ���� ���� ��)
-- where�� ������ �ο��ϸ� �ȵȴ�.
-- �� ���� having �̶�� ���� ����Ѵ�.

-- having ���� ��� ��踦 ��� �� �� �������� ������ �ϱ� ������
-- ��� �����Ϳ� COUNT�� SUM�� ����ϰ� 
-- ��μ� ��¥ ������ �����Ѵ�.
-- ���� DB SELECT���� �־��� �ð� �ҿ䰡 �ȴ�.