-- 여기는 gradeUser 화면입니다.

-- 학생 리스트
-- 00001:에이미:010-8694-3742:대구 서구 이현동

-- 학생 리스트 테이블 생성
CREATE TABLE tbl_student(
    st_num  CHAR(5)         PRIMARY KEY,
    st_name nVARCHAR2(30)   NOT NULL,
    st_tel  nVARCHAR2(20),
    st_addr nVARCHAR2(50)
);

SELECT * FROM tbl_student ;

DELETE tbl_student ;

COMMIT;

