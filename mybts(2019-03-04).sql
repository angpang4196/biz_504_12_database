-- mybts ���� ȭ��

create table tbl_menu(
     MENU_ID    char(10) primary key,
     MENU_P_ID  char(10) DEFAULT NULL,
     MENU_TITLE NVARCHAR2(255),
     MENU_HREF  NVARCHAR2(255)
);

insert into tbl_menu(menu_id, menu_title, menu_href) values('D0001', 'Ȩ', '#');
insert into tbl_menu(menu_id, menu_title, menu_href) values('D0002', '�Խ���', 'board');
insert into tbl_menu(menu_id, menu_title, menu_href) values('D0003', '������', 'admin');


insert into tbl_menu(menu_id, menu_p_id, menu_title, menu_href) values('D0004', 'D0003', '�ý���', 'system');
insert into tbl_menu(menu_id, menu_p_id, menu_title, menu_href) values('D0005', 'D0003', 'ȸ������', 'member');
insert into tbl_menu(menu_id, menu_p_id, menu_title, menu_href) values('D0006', 'D0003', '�޴�����', 'menu');

select * from tbl_menu where menu_p_id is not null;
select * from tbl_menu where menu_p_id is null;

select * from tbl_menu;

select  S.menu_id, S.menu_p_id, M.menu_id, M.menu_title
from tbl_menu S 
left join tbl_menu M 
    on S.menu_p_id = M.menu_id 
where S.menu_p_id is not null ;

