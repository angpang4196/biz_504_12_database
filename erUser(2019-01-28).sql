-- erUser 화면 

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

insert into tbl_eclipse values(seq_ecl.nextval,'ArithmeticException' ,'예외적인 산술 조건이 발생했을 경우에 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'ArrayIndexOutOfBoundsException' ,'배열이 부정한 인덱스로 액세스되고있는 것을 나타 내기 위해서 (때문에) throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'ArrayStoreException' ,'잘못된 타입의 객체를 객체의 배열에 저장하려고 시도했음을 나타 내기 위해 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'ClassCastException' ,'이것은, 코드가 인스턴스가 아닌 서브 클래스에 객체를 캐스트하려고 한 것을 나타 내기 위해서 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'ClassNotFoundException' ,'이것은, 어플리케이션이 캐릭터 라인 명을 사용해 클래스를로드하려고하면 (자), Class 클래스의 forName 메소드가 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'CloneNotSupportedException' ,'이것은, Object 클래스의 clone 메소드가 객체의 복제를 위해서 불려 갔지만, 그 객체의 클래스는 Cloneable 인터페이스를 구현하고 있지 않는 것을 나타 내기 위해서 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'EnumConstantNotPresentException' ,'어플리케이션이 이름으로 열거 형 정수에 액세스하려고 해, 열거 형에 지정된 이름을 가지는 정수가없는 경우에 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'Exception' ,'이것은 Exception 클래스이며, 그 서브 클래스는 합리적인 어플리케이션이 캐치 할 가능성이있는 조건을 나타내는 Throwable의 형식입니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalAccessException' ,'이것은, 어플리케이션이 인스턴스 (배열 이외)를 생성 해, 필드를 설정 또는 취득하려고했을 때, 또는 메소드를 호출하려고했을 때에 Throw됩니다 만, 현재 실행 중의 메소드는, 지정된 클래스의 정의에 액세스 할 수 없습니다. 필드, 메소드 또는 생성자.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalArgumentException' ,'메소드가 불법 또는 부적당 한 인수를 건네 받았음을 나타 내기 위해 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalMonitorStateException' ,'이것은, thread가 객체의 모니터를 대기하거나, 지정된 모니터를 소유하지 않고 객체의 모니터로 대기 중의 다른 thread에 통지를 시도한 것을 나타 내기 위해서 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalStateException' ,'불법 또는 부적절한시기에 메소드가 호출되었다는 신호.');
insert into tbl_eclipse values(seq_ecl.nextval,'IllegalThreadStateException' ,'thread가 요구 된 조작에 적절한 상태에없는 것을 나타 내기 위해서 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'IndexOutOfBoundsException' ,'일종의 인덱스 (배열, 스트링, 벡터 등)가 범위 외인 것을 나타 내기 위해서 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'InstantiationException' ,'이것은, 어플리케이션이 Class 클래스의 newInstance 메소드를 사용해 클래스의 인스턴스를 생성하려고했지만, 지정된 클래스 객체를 인스턴스화 할 수없는 경우에 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'InterruptedException' ,'이것은, thread가 대기 중, 대기 중, 또는 점령 중이었을 때, 및 thread가 액티 버티의 전 또는 중에 인터럽트되었을 때에 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'NegativeArraySizeException' ,'어플리케이션이 부의 크기의 배열을 작성하려고하면 (자) 불려갑니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'NoSuchFieldException' ,'클래스에 지정된 이름의 필드가 없다는 신호입니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'NoSuchMethodException' ,'특정의 메소드가 발견되지 않는 경우에 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'NullPointerException' ,'이것은, 오브젝트가 필요한 경우에 어플리케이션이 null를 사용하려고하면 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'NumberFormatException' ,'이것은, 어플리케이션이 캐릭터 라인을 수치 형의 1 개에 변환하려고했지만 캐릭터 라인이 적절한 형식을 가지고 있지 않는 것을 나타 내기 위해서 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'RuntimeException' ,'RuntimeException는, Java 가상 머신의 통상의 조작 중에 슬로우 할 수있는 그러한 예외의 슈퍼 클래스입니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'SecurityException' ,'시큐리티 매니저에 의해 슬로우되어 시큐리티 위반을 나타냅니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'StringIndexOutOfBoundsException' ,'이 메소드는 String 메소드에 의해 throw되어 인덱스가 부 또는 캐릭터 라인의 사이즈보다 큰 것을 나타냅니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'TypeNotPresentException' ,'이것은, 어플리케이션이 형태의 이름을 나타내는 캐릭터 라인을 사용해 형태에 액세스하려고했지만, 지정된 이름을 가지는 형태의 정의는 발견되지 않는 경우에 Throw됩니다.');
insert into tbl_eclipse values(seq_ecl.nextval,'UnsupportedOperationException' ,'요구 된 오퍼레이션이 서포트되어 있지 않은 것을 나타 내기 위해서 Throw됩니다.');

commit;

create table tbl_ms_error(
    ms_er_code varchar2(10) primary key,
    ms_er_name nvarchar2(255) not null,
    ms_er_msg nvarchar2(800) not null
);

SELECT * FROM tbl_ms_error;

select * from tbl_ms_error order by ms_er_code;

commit;