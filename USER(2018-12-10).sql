-- 여기는 user1으로 접속한 화면입니다.
-- user1은 dba 권한을 가지고 있다.

-- table 생성
-- table이름 : tbl_std
-- st_num, st_name, st_tel, st_addr, int_age, int_grade 칼럼을 가지고 있고
-- st_num은 PK로 설정되어 있고, st_name은 빈칸이 없는 제약사항이 설정되어있다.

CREATE TABLE tbl_std(
st_num CHAR(3) PRIMARY KEY,
st_name nVARCHAR2(50) NOT NULL,
st_tel nVARCHAR2(20),
st_addr nVARCHAR2(125),
int_age NUMBER(3),
int_grade NUMBER(4)
);

SELECT * FROM tbl_std;

-- 홍길동, 이몽룡, 성춘향, 임꺽정, 장길산 이름을 기준으로 
-- 나머지 항목을 자유롭게 설정하여 데이터를 추가하시오.
INSERT INTO tbl_std
VALUES('1','홍길동','010-1111-1111','서울특별시',15,30);
INSERT INTO tbl_std
VALUES('2','이몽룡','010-1111-1234','부산광역시',15,30);
INSERT INTO tbl_std
VALUES('3','성춘향','010-1111-4567','인천광역시',15,30);
INSERT INTO tbl_std
VALUES('4','임꺽정','010-1113-1113','울산광역시',15,30);
INSERT INTO tbl_std
VALUES('5','장길산','010-1212-1212','대전광역시',15,30);

SELECT * FROM tbl_std;

UPDATE tbl_std SET int_age = 16, int_grade = 50 WHERE st_name = '이몽룡';

SELECT * FROM tbl_std;

UPDATE tbl_std SET int_age = 17, int_grade = 60 WHERE st_name = '성춘향';
UPDATE tbl_std SET int_age = 18, int_grade = 70 WHERE st_name = '임꺽정';
UPDATE tbl_std SET int_age = 19, int_grade = 80 WHERE st_name = '장길산';

SELECT * FROM tbl_std;