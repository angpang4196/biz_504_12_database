-- mybts 접속 화면

create table tbl_menu(
     MENU_ID    char(10) primary key,
     MENU_P_ID  char(10) DEFAULT NULL,
     MENU_TITLE NVARCHAR2(255),
     MENU_HREF  NVARCHAR2(255)
);

insert into tbl_menu(menu_id, menu_title, menu_href) values('D0001', '홈', '#');
insert into tbl_menu(menu_id, menu_title, menu_href) values('D0002', '게시판', 'board');
insert into tbl_menu(menu_id, menu_title, menu_href) values('D0003', '관리자', 'admin');


insert into tbl_menu(menu_id, menu_p_id, menu_title, menu_href) values('D0004', 'D0003', '시스템', 'system');
insert into tbl_menu(menu_id, menu_p_id, menu_title, menu_href) values('D0005', 'D0003', '회원보기', 'member');
insert into tbl_menu(menu_id, menu_p_id, menu_title, menu_href) values('D0006', 'D0003', '메뉴생성', 'menu');

select * from tbl_menu where menu_p_id is not null;
select * from tbl_menu where menu_p_id is null;

select * from tbl_menu;

select  S.menu_id, S.menu_p_id, M.menu_id, M.menu_title
from tbl_menu S 
left join tbl_menu M 
    on S.menu_p_id = M.menu_id 
where S.menu_p_id is not null ;

