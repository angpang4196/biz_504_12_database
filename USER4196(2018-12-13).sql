-- ����� user4196 ���� ȭ���Դϴ�.

CREATE TABLE tbl_grade(
    strNum CHAR(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

INSERT INTO tbl_grade
VALUES('001', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('002', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('003', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('004', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

INSERT INTO tbl_grade
VALUES('005', ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0), ROUND(DBMS_RANDOM.VALUE(100,0),0));

SELECT * FROM tbl_grade;

CREATE TABLE tbl_users(
    strNum CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strTel nVARCHAR2(20),
    strAddr nVARCHAR2(50)
);

INSERT INTO tbl_users
VALUES('001','ȫ�浿','001-001-0001','����Ư����');

INSERT INTO tbl_users
VALUES('002','������','001-001-0001','�λ걤����');

INSERT INTO tbl_users
VALUES('003','ȫ�浿','001-001-0001','���ֱ�����');

INSERT INTO tbl_users
VALUES('004','�庸��','001-001-0001','����Ư����');

INSERT INTO tbl_users(strNum, strName)
VALUES('005','�̼���');

SELECT * FROM tbl_users;

SELECT G.strNum AS �й�, U.strName AS �̸�, U.strTel AS ��ȣ, U.strAddr AS �ּ�, 
G.intKor AS ��������, G.intEng AS ��������, G.intMath AS ��������, 
G.intKor + G.intEng + G.intMath AS ����, ROUND((G.intKor + G.intEng + G.intMath)/3,2) AS ���
FROM tbl_users U
LEFT JOIN tbl_grade G ON G.strNum = U.strNum;

SELECT * FROM tbl_grade, tbl_users WHERE tbl_grade.strNum = tbl_users.strNum;

SELECT * FROM tbl_users;

UPDATE tbl_users SET strTel = '005-005-0005', strAddr = '��õ������' WHERE strNum = '005';


    