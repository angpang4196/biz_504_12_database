-- erUser ȭ�� 

CREATE TABLE tbl_or_error(
    or_er_code VARCHAR2(15) PRIMARY KEY,
	or_er_stanSql NVARCHAR2(800) NOT NULL,
	or_er_oraSql NVARCHAR2(800) NOT NULL,
	or_er_sys NVARCHAR2(800) NOT NULL,
	or_er_cause NVARCHAR2(800) NOT NULL,
	or_er_action NVARCHAR2(800) NOT NULL
);

DESC tbl_or_error;

desc tbl_or_error;

SELECT * FROM tbl_or_error ORDER BY or_er_code;
SELECT * FROM tbl_or_error WHERE or_er_code BETWEEN 'ORA-18010 ' AND 'ORA-18014 ';
ALTER TABLE tbl_or_error MODIFY or_er_code VARCHAR2(20);

UPDATE tbl_or_error SET or_er_code = 'ORA-00311' WHERE or_er_code = 'ora-00311';

COMMIT;

ALTER TABLE tbl_or_error DROP COLUMN or_er_sys;

SELECT * FROM tbl_or_error WHERE or_er_code = 'ORA-' || LPAD('1',5,0);

select * from tbl_or_error where or_er_code = 'ORA-12333 ' or or_er_code = 'ORA-OOOO1 ';

select substr('ora-00001',-5) from dual;

SELECT LENGTH(TRIM('ORA-00001 ')) from dual;

select * from tbl_or_error where or_er_code = 'ORA-00903';

update tbl_or_error set or_er_code = trim(or_er_code);

commit;

create table tbl_eclipse(
    id NUMBER PRIMARY KEY,
	ec_er_name NVARCHAR2(800) NOT NULL,
	ec_er_cause NVARCHAR2(800) NOT NULL
);
select * from tbl_eclipse;

CREATE SEQUENCE SEQ_ECL START WITH 1 INCREMENT BY 1 ;

drop table tbl_eclipse;
drop sequence seq_ecl;

insert into tbl_eclipse values(seq_ecl.nextval,'ArithmeticException' ,'�������� ��� ������ �߻����� ��쿡 Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'ArrayIndexOutOfBoundsException' ,'�迭�� ������ �ε����� �׼����ǰ��ִ� ���� ��Ÿ ���� ���ؼ� (������) throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'ArrayStoreException' ,'�߸��� Ÿ���� ��ü�� ��ü�� �迭�� �����Ϸ��� �õ������� ��Ÿ ���� ���� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'ClassCastException' ,'�̰���, �ڵ尡 �ν��Ͻ��� �ƴ� ���� Ŭ������ ��ü�� ĳ��Ʈ�Ϸ��� �� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'ClassNotFoundException' ,'�̰���, ���ø����̼��� ĳ���� ���� ���� ����� Ŭ�������ε��Ϸ����ϸ� (��), Class Ŭ������ forName �޼ҵ尡 Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'CloneNotSupportedException' ,'�̰���, Object Ŭ������ clone �޼ҵ尡 ��ü�� ������ ���ؼ� �ҷ� ������, �� ��ü�� Ŭ������ Cloneable �������̽��� �����ϰ� ���� �ʴ� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'EnumConstantNotPresentException' ,'���ø����̼��� �̸����� ���� �� ������ �׼����Ϸ��� ��, ���� ���� ������ �̸��� ������ ���������� ��쿡 Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'Exception' ,'�̰��� Exception Ŭ�����̸�, �� ���� Ŭ������ �ո����� ���ø����̼��� ĳġ �� ���ɼ����ִ� ������ ��Ÿ���� Throwable�� �����Դϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalAccessException' ,'�̰���, ���ø����̼��� �ν��Ͻ� (�迭 �̿�)�� ���� ��, �ʵ带 ���� �Ǵ� ����Ϸ������� ��, �Ǵ� �޼ҵ带 ȣ���Ϸ������� ���� Throw�˴ϴ� ��, ���� ���� ���� �޼ҵ��, ������ Ŭ������ ���ǿ� �׼��� �� �� �����ϴ�. �ʵ�, �޼ҵ� �Ǵ� ������.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalArgumentException' ,'�޼ҵ尡 �ҹ� �Ǵ� ������ �� �μ��� �ǳ� �޾����� ��Ÿ ���� ���� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalMonitorStateException' ,'�̰���, thread�� ��ü�� ����͸� ����ϰų�, ������ ����͸� �������� �ʰ� ��ü�� ����ͷ� ��� ���� �ٸ� thread�� ������ �õ��� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalStateException' ,'�ҹ� �Ǵ� �������ѽñ⿡ �޼ҵ尡 ȣ��Ǿ��ٴ� ��ȣ.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalThreadStateException' ,'thread�� �䱸 �� ���ۿ� ������ ���¿����� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'IndexOutOfBoundsException' ,'������ �ε��� (�迭, ��Ʈ��, ���� ��)�� ���� ���� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'InstantiationException' ,'�̰���, ���ø����̼��� Class Ŭ������ newInstance �޼ҵ带 ����� Ŭ������ �ν��Ͻ��� �����Ϸ���������, ������ Ŭ���� ��ü�� �ν��Ͻ�ȭ �� ������ ��쿡 Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'InterruptedException' ,'�̰���, thread�� ��� ��, ��� ��, �Ǵ� ���� ���̾��� ��, �� thread�� ��Ƽ ��Ƽ�� �� �Ǵ� �߿� ���ͷ�Ʈ�Ǿ��� ���� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'NegativeArraySizeException' ,'���ø����̼��� ���� ũ���� �迭�� �ۼ��Ϸ����ϸ� (��) �ҷ����ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'NoSuchFieldException' ,'Ŭ������ ������ �̸��� �ʵ尡 ���ٴ� ��ȣ�Դϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'NoSuchMethodException' ,'Ư���� �޼ҵ尡 �߰ߵ��� �ʴ� ��쿡 Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'NullPointerException' ,'�̰���, ������Ʈ�� �ʿ��� ��쿡 ���ø����̼��� null�� ����Ϸ����ϸ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'NumberFormatException' ,'�̰���, ���ø����̼��� ĳ���� ������ ��ġ ���� 1 ���� ��ȯ�Ϸ��������� ĳ���� ������ ������ ������ ������ ���� �ʴ� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'RuntimeException' ,'RuntimeException��, Java ���� �ӽ��� ����� ���� �߿� ���ο� �� ���ִ� �׷��� ������ ���� Ŭ�����Դϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'SecurityException' ,'��ť��Ƽ �Ŵ����� ���� ���ο�Ǿ� ��ť��Ƽ ������ ��Ÿ���ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'StringIndexOutOfBoundsException' ,'�� �޼ҵ�� String �޼ҵ忡 ���� throw�Ǿ� �ε����� �� �Ǵ� ĳ���� ������ ������� ū ���� ��Ÿ���ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'TypeNotPresentException' ,'�̰���, ���ø����̼��� ������ �̸��� ��Ÿ���� ĳ���� ������ ����� ���¿� �׼����Ϸ���������, ������ �̸��� ������ ������ ���Ǵ� �߰ߵ��� �ʴ� ��쿡 Throw�˴ϴ�.');
insert into tbl_eclipse values(seq_ecl.nextval,'UnsupportedOperationException' ,'�䱸 �� ���۷��̼��� ����Ʈ�Ǿ� ���� ���� ���� ��Ÿ ���� ���ؼ� Throw�˴ϴ�.');

commit;

create table tbl_ms_error(
    ms_er_code varchar2(10) primary key,
    ms_er_name nvarchar2(255) not null,
    ms_er_msg nvarchar2(800) not null
);

SELECT * FROM tbl_ms_error;

select * from tbl_ms_error order by ms_er_code;

commit;