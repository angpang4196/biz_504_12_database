-- mybts 접속화면

select * from tbl_member;

desc tbl_member;
drop table tbl_member;
DROP TABLE tbl_hobby;

create table tbl_member(
    M_USERID        VARCHAR2(30)    primary key,
    M_PASSWORD      NVARCHAR2(125)  NOT NULL,
    M_NAME          NVARCHAR2(125)  NOT NULL,
    M_TEL           NVARCHAR2(20), 
    M_CITY          NVARCHAR2(20), 
    M_ADDR          NVARCHAR2(125),
    M_PHOTO         NVARCHAR2(125),
    M_PHOTO_PATH    NVARCHAR2(255)
);

SELECT * FROM tbl_member;

DELETE FROM tbl_member;
commit;