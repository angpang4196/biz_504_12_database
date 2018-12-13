-- 여기는 user2 화면입니다.

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

-- 현재 입력된 데이터가 어쩌다 보니 학번 순서가 뒤섞여
-- 입력이 되어있다. 이 데이터를 학번순으로 보고싶다.
SELECT * FROM tbl_grade 
ORDER BY str_num; -- 정렬하기

SELECT * FROM tbl_grade
ORDER BY str_num DESC; -- 내림차순 정렬(descending)

-- SUM, AVG 함수를 사용하자
SELECT SUM(intKor) AS 국어합계, SUM(intEng) AS 영어합계, SUM(intMath) AS 수학합계
FROM tbl_grade;

-- 각 학생의 총점 계산
SELECT str_num, intKor, intEng, intMath,(intKor+intEng+intMath) AS 총점
FROM tbl_grade;

-- 각 학생의 평균 계산
SELECT str_num, intKor, intEng, intMath,(intKor+intEng+intMath) AS 총점,(intKor+intEng+intMath)/ 3 AS 평균
FROM tbl_grade;

-- tbl_grade의 데이터를 전체 삭제
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

-- 각 학생의 총점과 평균 계산 후 총점순으로 오름차순 정렬
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS 총점, ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade ORDER BY intKor+intEng+intMath;

-- 각 학생의 총점과 평균 계산 후 총점순으로 내림차순 정렬
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS 총점, ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade ORDER BY intKor+intEng+intMath DESC;

-- 총점을 계산하여 성적 순위를 표현하는 방법
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS 총점, ROUND((intKor+intEng+intMath)/3,2) AS 평균, 
    RANK() OVER(ORDER BY (intKor+intEng+intMath) DESC) AS 순위
FROM tbl_grade ORDER BY str_num;

-- 평균이 70점 이상인 학생들의 리스트만 표시
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS 총점, ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade WHERE ROUND((intKor+intEng+intMath)/3,2) >= 70 ORDER BY str_num;

-- 평균이 40점 미만인 학생들의 리스트만 표시
SELECT str_num,intKor,intEng,intMath,(intKor+intEng+intMath) AS 총점, ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade WHERE ROUND((intKor+intEng+intMath)/3,2) < 40 ;