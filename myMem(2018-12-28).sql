-- 여기는 myMem 화면입니다.

CREATE TABLE tbl_primary(
    p_id    NUMBER        PRIMARY KEY,
    p_name  nVARCHAR2(50) NOT NULL,
    p_tel   nVARCHAR2(20)
);

-- 보통 테이블에 PK는 각 데이터(레코드)를 식별하는 어떤 요소로서 사용이 된다.
-- 그래서 정보(학생정보, 상품정보, 거래처정보, 부서정보)를 저장하는 테이블에서는
-- 임의로 코드(D0001, S001)를 생성해서 데이터를 추가(INSERT)할 때 사용한다.

-- 하지만 임의의 데이터가 다량으로 추가되는 work 테이블일 경우(상품매입매출, 성적처리)
-- 코드 개념을 추가하기가 매우 어렵다.
-- 그래서 이런 테이블에는 임의로 id칼럼을 하나 추가하고
-- 일정한 순서의 값(숫자가 증가되는 형태)을 만들어 저장을 한다.
-- mySQL같은 DB에서는 AUTO INCREMENT 라는 옵션이 있어서 
-- PK칼럼에 해당 옵션을 저장해주면 INSERT를 실행할 때
-- 자동으로 1씩 증가된 값을 생성하고 칼럼에 할당해 주도록 할 수 있다.

-- 그런데, 오라클(11 이하)에서는 AUTO INCREMENT 옵션이 없다.

-- 편법으로 오라클에 있는 SEQUENCE(SEQ) 라는 객체를 활용해서 AUTO INCREMENT 효과를 얻을 수 있다.

-- 새로운 SEQ 객체를 생성
CREATE SEQUENCE PK_SEQ START WITH 1 INCREMENT BY 1;
-- START : 시작값,  INCREMENT : 증가
CREATE SEQUENCE PK_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE NOMINVALUE; -- 또는 [ MAXVALUE 1000 OR MINVALUE 0 ]형식으로

-- 위에서 생성한 PK_SEQ 시퀀스를 테스트 해 보자.
SELECT PK_SEQ.NEXTVAL FROM DUAL;

INSERT INTO tbl_primary
VALUES(1, '홍길동', '0001');
INSERT INTO tbl_primary
VALUES(PK_SEQ.NEXTVAL, '이몽룡','0005');

SELECT * FROM tbl_primary;

-- INSERT를 실행한 후 현재 ID값을 SEQ를 통해서 확인하는 방법
-- INSERT가 실행되지 않은 상태에서 조회를 하면 오류가 난다.
SELECT PK_SEQ.CURRVAL FROM DUAL;

-- INSERT가 실행되지않아 오류가 발생하고 현재 ID값을 얻을 수 없을 때
-- 오라클의 SYSTEM DB(시스템 데이터 사전)으로부터 값을 조회할 수 있다.
SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'PK_SEQ';

-- RANDOM 함수를 사용해서 PK를 만드는 방법
SELECT DBMS_RANDOM.VALUE FROM DAUL;
SELECT DBMS_RANDOM.VALUE(100000, 99999999) FROM DUAL;

INSERT INTO tbl_primary
VALUES( ROUND(DBMS_RANDOM.VALUE(100,9999)), '성춘향', '0007');

SELECT * FROM tbl_primary ORDER BY p_id;

-- GUID( Global Unique Identifier), UUID( Universally Unique Identifier)
SELECT SYS_GUID() FROM DUAL;

-- SYS_GUID를 사용해서 PK를 선언할 때는 CHAR(32) 이상의 값으로 설정한다.
-- SYS_GUID를 사용해서 PK를 선언할 때 CHAR(32)에서 오류가 발생하는 경우가 있다.
-- 그럴 때는 CLOB, BLOB
INSERT INTO tbl_primary 
VALUES( SYS_GUID(), '임꺽정', '0000');

CREATE SEQUENCE SEQ_TEST
START WITH 1 INCREMENT BY 1 MAXVALUE 10 NOCACHE CYCLE;

SELECT SEQ_TEST.NEXTVAL FROM DUAL;

DROP SEQUENCE SEQ_TEST;

-- 시퀀스변경 
-- 시퀀스도 다른 객체처럼 ALTER를 사용해서 변경을 할 수 있는데 
-- START WITH는 변경할 수 없다.
-- START WITH를 변경하려면 DROP한 후에 다시 생성해야한다.
ALTER SEQUENCE SEQ_TEST INCREMENT BY 2 MAXVALUE 20 NOCYCLE;

-- 시퀀스의 값을 역순으로 생성하고 싶을 때가 있다.
CREATE SEQUENCE ASC_SEQ
START WITH 9999 INCREMENT BY -1 MINVALUE 0 MAXVALUE 9999; 
-- NOMINVALUE : -1까지 , NOMAXVALUE : 10의 27승까지

SELECT ASC_SEQ.NEXTVAL FROM DUAL;

CREATE TABLE tbl_mytable(
    p_id    NUMBER          PRIMARY KEY,
    p_name  nVARCHAR2(50)   NOT NULL,
    p_tel   nVARCHAR2(20),
    p_kor   NUMBER, -- 점수를 저장하려고 만든 칼럼으로 예상이 된다.
    p_eng   NUMBER  -- 이처럼 최대값이 예상이 될 경우는 값의 크기를 지정해 주는 것이 좋다.
);

ALTER TABLE tbl_mytable MODIFY p_kor NUMBER(3);
ALTER TABLE tbl_mytable MODIFY p_eng NUMBER(3);

CREATE SEQUENCE MY_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE;

INSERT INTO tbl_mytable
VALUES( MY_SEQ.NEXTVAL, '홍자', '010-1013-4238', ROUND(DBMS_RANDOM.VALUE(50,100)), ROUND(DBMS_RANDOM.VALUE(50,100)));

SELECT * FROM tbl_mytable;

SELECT p_name AS 이름, (p_kor + p_eng) AS 총점 FROM tbl_mytable ;