-- 여기는 myuser 접속 화면입니다.
-- 매입매출샘플(엑셀)파일에서 DataBase로 데이터를 옮기고
-- DB 규칙에 맞도록 적용하는 연습

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

-- 2018-02-01 ~ 2018-02-28 기간의 매출 리스트 보기
SELECT * FROM io_list WHERE io_date between '2018-02-01' AND '2018-02-28' AND io_inout = '매출' ;

-- 2018-02-01 ~ 2018-02-28 기간의 매입 리스트 보기
SELECT * FROM io_list WHERE io_date between '2018-02-01' AND '2018-02-28' AND io_inout = '매입' ;

-- 전체 리스트의 개수와 io_total의 합계를 보기
SELECT COUNT(*) as 개수, SUM(io_total) as 합계 FROM io_list;

-- 통계 함수를 이용해서 개수와 합계를 구하는 데 
-- 조건이 매입합계, 매출합계를 따로 계산하고 싶다.
-- 1. 매입과 매출을 구분하는 칼럼 : io_inout
SELECT SUM(io_total) as 매입합계 FROM io_list WHERE io_inout = '매입';

SELECT io_inout, COUNT(io_total), SUM(io_total) FROM io_list GROUP BY io_inout;

-- 2. 개수와 합계를 계산 
-- 조건 : 날짜별로 검색 : io_date
SELECT io_date, count(*), SUM(io_total) FROM io_list GROUP BY io_date ORDER BY io_date;

-- 3. 조건 : 날짜별로 묶고, 다시 매입 매출로 구분하여 개수와 합계를 계산
-- 날짜 구분 : io_date
-- 매입 매출 구분 : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_total) FROM io_list GROUP BY io_date, io_inout ORDER BY io_date;

-- 구분과 날짜 순서를 바꾸어서...
SELECT io_inout, io_date, COUNT(*), SUM(io_total) FROM io_list GROUP BY io_inout, io_date ORDER BY io_inout;

-- 매입, 매출을 구분하고 날짜별로 개수와 합계 계산하여 보기, 날짜범위는 2018-03-01 ~ 2018-03-31
SELECT io_inout, io_date, COUNT(*), SUM(io_total) FROM io_list  
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date ORDER BY io_date;

-- 합계금액이 100만원 이상인 항목
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM io_list  
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date 
HAVING SUM(io_total) >= 500000
ORDER BY io_inout;
-- 통계함수를 사용하는 경우
-- 통계함수 결과에 따라 추출하는 list를 제한하고싶을때
-- (필요한 범위의 값만 보고 싶을 때)
-- where에 조건을 부여하면 안된다.
-- 이 때는 having 이라는 절을 사용한다.

-- having 절은 모든 통계를 계산 한 후 조건으로 제한을 하기 때문에
-- 모든 데이터에 COUNT와 SUM을 계산하고 
-- 비로소 날짜 범위를 제한한다.
-- 따라서 DB SELECT에서 최악의 시간 소요가 된다.