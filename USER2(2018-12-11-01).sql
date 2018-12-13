-- ����� user2 ȭ���Դϴ�.

CREATE TABLE tbl_grade(
    str_num nVARCHAR2(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

SELECT * FROM tbl_grade;

INSERT INTO tbl_grade
VALUES('001',30,49,50);
INSERT INTO tbl_grade
VALUES('002',31,48,51);
INSERT INTO tbl_grade
VALUES('003',32,47,52);
INSERT INTO tbl_grade
VALUES('004',33,46,53);
INSERT INTO tbl_grade
VALUES('005',34,45,54);

SELECT * FROM tbl_grade;

-- ���� �Էµ� �����Ͱ� ��¼�� ���� �й� ������ �ڼ���
-- �Է��� �Ǿ��ִ�. �� �����͸� �й������� ����ʹ�.
SELECT * FROM tbl_grade 
ORDER BY str_num; -- �����ϱ�

SELECT * FROM tbl_grade
ORDER BY str_num DESC; -- �������� ����(descending)

-- SUM, AVG �Լ��� �������
SELECT SUM(intKor) AS �����հ�, SUM(intEng) AS �����հ�, SUM(intMath) AS �����հ�
FROM tbl_grade;

-- �� �л��� ���� ���
SELECT str_num, intKor, intEng, intMath,(intKor+intEng+intMath) AS ����
FROM tbl_grade;

-- �� �л��� ��� ���
SELECT str_num, intKor, intEng, intMath,(intKor+intEng+intMath) AS ����,(intKor+intEng+intMath)/ 3 AS ���
FROM tbl_grade;

-- tbl_grade�� �����͸� ��ü ����
DELETE FROM tbl_grade;

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES('001', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100))
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES('002', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100))
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES('003', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100))
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES('004', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100))
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES('005', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100))
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES(ROUND(DBMS_RANDOM.VALUE(0,999),0), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100))
);

SELECT * FROM tbl_grade;

SELECT * FROM tbl_grade ORDER BY str_num;

-- �� �л��� ������ ��� ��� �� ���������� �������� ����
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS ����, ROUND((intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade ORDER BY intKor+intEng+intMath;

-- �� �л��� ������ ��� ��� �� ���������� �������� ����
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS ����, ROUND((intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade ORDER BY intKor+intEng+intMath DESC;

-- ������ ����Ͽ� ���� ������ ǥ���ϴ� ���
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS ����, ROUND((intKor+intEng+intMath)/3,2) AS ���, 
    RANK() OVER(ORDER BY (intKor+intEng+intMath) DESC) AS ����
FROM tbl_grade ORDER BY str_num;

-- ����� 70�� �̻��� �л����� ����Ʈ�� ǥ��
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS ����, ROUND((intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade WHERE ROUND((intKor+intEng+intMath)/3,2) >= 70 ORDER BY str_num;

-- ����� 40�� �̸��� �л����� ����Ʈ�� ǥ��
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS ����, ROUND((intKor+intEng+intMath)/3,2) AS ���
FROM tbl_grade WHERE ROUND((intKor+intEng+intMath)/3,2) < 40 ;