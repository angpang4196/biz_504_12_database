-- 여기는 sysdba로 접속한 화면입니다.
-- 여기에서는 사용자를 생성하고 
-- 권한을 부여하는 일만 수행합니다.

-- DB의 SQL에서 등록, 생성이라는 용어가 나오면
-- 키워드는 대체로 CREATE로 시작한다.
-- CREATE 키워드는 DDL, DCL 명령어의 핵심 키워드

-- 1. 새로운 사용자 등록을 수행
-- 사용자 ID를 user1으로 설정하고 
-- 비밀번호를 1234로 하겠다.
CREATE USER user1 IDENTIFIED BY 1234;

-- 여기까지 수행을 하면 새로운 사용자가 등록
-- 이 user1은 현재 아무런 명령 수행 권한이 없다.

-- 2. 권한 부여 : DCL명령어 이용
-- GRANT, REVOKE 
GRANT CONNECT TO user1;  -- user1에게 로그인 권한만 부여
REVOKE CONNECT FROM user1;  -- user1에게 로그인 권한 제거 

CREATE USER user2 IDENTIFIED BY 1234;
GRANT CONNECT TO user2;

-- CREATE 명령으로 생성된 객체는
-- 삭제할 때 DROP 키워드로 삭제한다.
DROP USER user2;
-- 한번 삭제된 사용자는 그 내용을 복구 할 수 없다.

-- 오라클 학습 환경에서 다양한 명령들을 수행하고 
-- 테스트 해 보기 위해서 
-- 우리는 새로운 사용자에게 SYSDBA 보다 한 단계낮은 
-- DBA 권한을 부여해서 학습을 진행한다.
GRANT DBA TO user1;
-- DBA : DDL, DML, DCL 명령들을 수행할 수 있다.
