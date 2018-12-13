-- 여기는 관리자 화면입니다.

CREATE USER myuser IDENTIFIED BY 1234;
-- CREATE USER myuser IDENTIFIED BY 1234 DEFAULT TABLESPACE ....;
-- 아직 TABLESPACE를 생성하기전에 사용자를 먼저 등록하다보니 DEFAULT TABLESPACE를 지정하지 않았다.
-- 이럴 경우 DEFAULT TABLESPACE는 SYSTEM 설정 값으로 지정되는 데, 이것은 실무에서 매우 위험한 방법 

GRANT DBA TO myuser;

CREATE TABLESPACE myTBL DATAFILE 'D:/bizwork/oracle/ordata/mytbl.dbf' size 100M AUTOEXTEND ON NEXT 1M;

-- myuser 사용자에게 TABLESPACE를 적용하지 않았다.
-- 이제 새로운 TABLESPACE를 생성했으므로 myuser에게 default tablespace를 지정하겠다.

ALTER USER myuser DEFAULT TABLESPACE myTBL;
    
