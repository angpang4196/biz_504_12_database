-- 여기는 myMem 접속 화면입니다.

CREATE TABLE tbl_iolist(
    id	       NUMBER	     PRIMARY KEY,
    io_date	   CHAR(10)	     NOT NULL,	
    io_Cname   NVARCHAR2(30) NOT NULL,
    io_Dname   NVARCHAR2(30) NOT NULL,	
    io_ceo	   NVARCHAR2(30),		
    io_inout   NVARCHAR2(5),		
    io_quan	   NUMBER,		
    io_price   NUMBER,		
    io_total   NUMBER		    
);

SELECT COUNT(*) FROM tbl_iolist;

SELECT * FROM tbl_iolist;

-- 매입과 매출을 구분하고 한꺼번에 확인
SELECT io_inout, COUNT(io_inout), SUM(io_total) FROM tbl_iolist GROUP BY io_inout;

-- 일자별로 구분하여 매입과 매출의 개수와 총합계금액
SELECT io_date, io_inout, COUNT(io_inout), SUM(io_total) FROM tbl_iolist GROUP BY io_date, io_inout ORDER BY io_date;

-- 문자열 함수 몇가지
SELECT 'KOREA' FROM DUAL;
SELECT 'Republic of Korea' FROM DUAL;

-- 문자열을 대문자로 변환 
SELECT UPPER('korea') FROM DUAL;
-- 문자열을 소문자로 변환
SELECT LOWER('KOREA') FROM DUAL;

-- 단어의 첫 글자(이니셜)를 대문자로 변환
SELECT INITCAP('republic of korea') FROM DUAL; 

SELECT LENGTH('Republic of Korea') FROM DUAL;
-- LENGTH 함수를 사용할 때 간혹 한글개수를 * 2 의 값으로 표시하는 경우가 있다.
-- 이 때 한글의 정확한 개수를 알고자 할 때는 ''문자열 앞에 N을 붙여준다.
SELECT LENGTH(N'대한민국') FROM DUAL;

-- 데이터의 저장용량을 Byte 단위로 보여주기
SELECT LENGTHB('대한민국') FROM DUAL;

-- of가 Republic of Korea 문자열 중에 몇번째 위치에 있냐?
SELECT INSTR('Republic of Korea','of') FROM DUAL;

-- 앞의 문자열을 4번째자리부터 3글자
-- 오라클은 첫 글자 위치를 0이 아닌 1부터 시작한다.
SELECT SUBSTR('Republic of Korea', 4, 3) FROM DUAL;

-- 표준 SQL에서 왼쪽부터 3번째 위치의 글자
-- SELECT LEFT('Republic',3) FROM DUAL;
-- 3번째부터 2글자
-- SELECT MID('Republic', 3, 2) FROM DUAL;

-- KOREA 문자열을 포함하여 총 20개의 문자열을 생성하되
-- 빈 곳은 *로 채워라.
SELECT LPAD('KOREA', 20, '*') FROM DUAL;
-- 숫자 1을 문자열로 바꾸고 총 5개의 문자열로 생성하되
-- 빈 곳은 0으로 채워라.
SELECT LPAD(1, 5, '0') FROM DUAL;

SELECT RPAD(1, 5, '0') FROM DUAL;

INSERT test(t_num) VALUES(LPAD(1, 3, '0');

-- 공백을 제거
SELECT LTRIM(' KOREA 대한민국 ' ) FROM DUAL;
SELECT RTRIM(' KOREA 대한민국 ' ) FROM DUAL;
SELECT TRIM(' KOREA ') FROM DUAL;

-- TRIM 함수의 특이한 사용
-- 'aaaaaaaaabbbbKorennnnnaa' 문자열의 앞뒤에 붙은 a문자들을 모두 삭제
SELECT TRIM('a' FROM 'aaaaaaaaabbbbKorennnnnaa') FROM DUAL;

-- 일자별로 거래구분에 따른 개수와 합계를 확인
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total) FROM tbl_iolist
GROUP BY io_date, io_inout ORDER BY io_date;

-- 일자별로 거래구분에 따른 개수와 합계를 확인
-- 단 2018-03-01 ~ 2018-03-31 까지의 data로 한정
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total) 
FROM tbl_iolist WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_date, io_inout ORDER BY io_date;

-- 월별로 또는 연도별로 합계를 계산해서 보고 싶을 때가 있다.
CREATE VIEW 월별통계
AS
SELECT SUBSTR(io_date, 1, 7) AS 월별, io_inout , COUNT(io_total) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
GROUP BY SUBSTR(io_date, 1, 7), io_inout ORDER BY SUBSTR(io_date, 1, 7);

SELECT * FROM 월별통계 WHERE 월별 BETWEEN '2018-03' AND '2018-06';

-- 거래처별로 구분하여 매입, 매출 개수와 합계를 확인 단 , 거래처별로 정렬
SELECT io_dname, io_inout, COUNT(io_inout), SUM(io_total) FROM tbl_iolist 
GROUP BY io_dname, io_inout ORDER BY io_dname;

-- 상품별로 구분하고, 월별로 세분하여 매입, 매출 개수와 합계를 확인 단, 상품별로 정렬
SELECT io_cname, SUBSTR(io_date, 1,7), COUNT(io_inout), SUM(io_total) FROM tbl_iolist
GROUP BY io_cname, SUBSTR(io_date, 1,7) ORDER BY io_cname;

-- 상품중에 링 키 바 의 매입 매출 리스트 확인
SELECT * FROM tbl_iolist WHERE io_cname = ' 링 키 바';

SELECT io_cname, SUBSTR(io_date,1,7), COUNT(io_inout), SUM(io_total) FROM tbl_iolist WHERE io_cname = ' 링 키 바'
GROUP BY io_cname, SUBSTR(io_date,1,7) ORDER BY io_cname;