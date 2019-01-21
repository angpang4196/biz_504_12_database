-- 여기는 BBS 화면입니다.

SELECT * FROM tbl_bbs_main;

INSERT INTO tbl_bbs_main
VALUES(SEQ_BBS_MAIN.nextval, '2019-01-02', '이순신', '게시판시작', '오늘은 자바를 이용해서 게시판을 만든다');

UPDATE tbl_bbs_main SET b_id = 6 WHERE b_id = 21;

-- DCL 명령중 commit 과 rollback 명령이 있는데
-- 현재 위에서 실행한 insert문으로 데이터를 추가했는데
-- 아직은 메모리상에 데이터가 존재를 하고,
-- 실제적으로 물리적DB에는 저장이 안 된 상태이다.
-- 그래서 현재 화면이 아닌 다른 곳(JAV 등)에서 DB에 연결해서
-- 데이터를 조회하면 데이터가 보이지 않는다.

-- COMMIT 명령
-- 현재 메모리에 있는 데이터를 물리적 DB에 저장하도록 하는 명령
COMMIT;

-- ROLLBACK 명령
-- 데이터를 INSERT, UPDATE, DELETE를 수행한 다음에
-- 해당되는 명령을 취소하고자 할 때 사용하는 명령


-- SQL Developer와 JAVA를 동시에 연동해서 
-- 테스트를 할 때는 SQL에서 데이터를 추가, 변경, 삭제한 후에는
-- COMMIT을 해 준다.
