--Լ�����������֣������������Ψһ����飬�ǿ�

--��Oracle�н���һ�ž�������Լ�����������ע�͵ı�
/*
1���ڽ�����ʱ�����治��������ݱ��ŵı�ռ䣬�������Ĭ�ϱ�ռ��С�
2�������ִ�����ķ�ʽ��1.�淶������2.�Ӳ�ѯ����

*/
create table aateat(
     bookid int not null, 
     bookname char not null,
     publish varchar2(20),
     pubdate varchar2(20),
     price decimal(7,2),
     author char,
     store int default 0,
     reader int,
     remarks varchar2(50),
     constraint ck_price check(price>=10 and price<=100) , --���Լ��
     constraint un_bookname unique (bookname),--Ψһ��Լ��
     constraint fk_publish foreign key(publish) references publishinfo(publishid) --���
);

create table publishinfo(
       publishid varchar2(20) primary key, --����
       publishname varchar2(30)
);
/*
�Ӳ�ѯ������
�Ӳ�ѯ���������ı��ԭ��ṹһ�¡�
�������еķǿ�Լ���ͼ��Լ����ԭ��һ�¡�
������Ψһֵ������򲻻�����һ�𴴽���
*/
create table table_name as select * from table_name

/*  ������ʹ����ʱ��
��ʱ�������ñ����ƣ�����
*/





--ɾ��Լ������
alter table aateat drop [constraint] FK_PUBLISH;
---------------------------------------------------------------------------------------------
-- Create table
create table PUBLISHINFO
(
  PUBLISHID   VARCHAR2(20) not null,
  PUBLISHNAME VARCHAR2(30)
)
tablespace USER_OLD
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PUBLISHINFO
  add primary key (PUBLISHID)
  using index 
  tablespace USER_OLD
  pctfree 10
  initrans 2
  maxtrans 255;


-- Create table
create table AATEAT
(
  BOOKID   INTEGER not null,
  BOOKNAME CHAR(1) not null,
  PUBLISH  VARCHAR2(20),
  PUBDATE  VARCHAR2(20),
  PRICE    NUMBER(7,2),
  AUTHOR   CHAR(1),
  STORE    INTEGER default 0,
  READER   INTEGER,
  REMARKS  VARCHAR2(50)
)
tablespace USER_OLD
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table AATEAT
  add constraint UN_BOOKNAME unique (BOOKNAME)
  using index 
  tablespace USER_OLD
  pctfree 10
  initrans 2
  maxtrans 255;
alter table AATEAT
  add constraint FK_PUBLISH foreign key (PUBLISH)
  references PUBLISHINFO (PUBLISHID);
-- Create/Recreate check constraints 
alter table AATEAT
  add constraint CK_PRICE
  check (price>=10 and price<=100);
