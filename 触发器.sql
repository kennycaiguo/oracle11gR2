---------------------------------------------------------------------
grant create any trigger to my;--���û�������������Ȩ��

---------------------------------------------------------------------
--׼������������������Ҫ�����ı�����������д�����־��


CREATE TABLE T3 (NAME VARCHAR2(20),MONEY NUMBER);
INSERT INTO T3 VALUES ('A',10);
INSERT INTO T3 VALUES ('B',20);
CREATE TABLE T4 (NAME VARCHAR2(20),MONEY NUMBER);
INSERT INTO T4 VALUES ('A',30);
INSERT INTO T4 VALUES ('C',20);
COMMIT;

create table dep_log(operate_tag varchar2(10),operate_tab varchar2(30),operate_time date); 
  
--������伶���м���������,�����ڱ���
create or replace trigger tri_my  before insert or update or delete on t3  
  for each row --ȥ��for each row��ͻ���ֻ����һ�Ρ�
declare
  var_tag varchar2(10);
begin
   if inserting then --����д��inserting(name)���������Ƕ�name����ֶμ�ظ��¡�
     var_tag:='����';
   elsif updating then
     var_tag:='�޸�';
   elsif deleting then
     var_tag:='ɾ��';
   end if;
   insert into dep_log values(var_tag,sysdate);
end tri_my;
-------------------------------------------------------------------
--�û��¼�����������׼����
create table ddl_log(
dname varchar2(20),
dtype varchar2(20),
daction varchar2(20),
duser varchar2(20),
ddate date
);
--�����û��¼����������������û��ϡ�
create or replace trigger tri_ddl
  before create or alter or drop
  on my.schema
begin
  insert into ddl_log values
  (ora_dict_obj_name,--���������ݶ������ƣ�
  ora_dict_obj_type,--���������ݶ������ͣ�
  ora_sysevent,--ϵͳ�¼����ƣ�
  ora_login_user,--��½�û���
  sysdate);--ϵͳʱ�䡣
end;
---------------------------------------------------------------------
--�滻����������������ͼ�ϡ�




---------------------------------------------------------------------

--ɾ��������
drop trigger TRI_DEP_LOG;

--���ñ��ϵ����д�����
alter table table_name disable all triggers;

--�ر��ض��Ĵ�������
alter trigger tri_my disable;
--�����ض��Ĵ�����
alter trigger tri_my enable;

--��ѯ���еĴ�����
select * from all_triggers;
--��ѯ�ض���Ĵ�������
select * from all_triggers t where t.TABLE_NAME='MI';

------------------------------------------------------------------------
--�������ɴ����������ű�
select
'create or replace trigger tri_'||tb.tname||'  before insert or update or delete on '||tb.tname||
' declare
  var_tag varchar2(10);'||
'begin
   if inserting then 
     var_tag:='||chr(39)||'����'||chr(39)||';'||
   'elsif updating then
     var_tag:='||chr(39)||'�޸�'||chr(39)||';'||
   'elsif deleting then
     var_tag:='||chr(39)||'ɾ��'||chr(39)||';'||
   'end if;'||
   'insert into dep_log values(var_tag,sysdate);'||
'end tri_'||tb.tname||';'
from (select T.TABLE_NAME tname from all_tables t where t.OWNER='MY') tb;

--���������������Ĵ洢����
create or replace procedure create_trigger is
 v_tablename varchar2(30);
 v_sql varchar2(1000);
 cursor cur_table is select t.TABLE_NAME from all_tables t where t.OWNER='MY' and t.TABLE_NAME<>'DEP_LOG';
begin
  open cur_table;
  fetch cur_table into v_tablename;
  while cur_table%found 
     loop          
          v_sql:='create or replace trigger tri_'||v_tablename||'  before insert or update or delete on '||v_tablename||
                ' declare
                  var_tag varchar2(10);'||
                'begin
                   if inserting then 
                     var_tag:='||chr(39)||'����'||chr(39)||';'||
                   'elsif updating then
                     var_tag:='||chr(39)||'�޸�'||chr(39)||';'||
                   'elsif deleting then
                     var_tag:='||chr(39)||'ɾ��'||chr(39)||';'||
                   'end if;'||
                   'insert into dep_log values(var_tag,sysdate);'||
                'end tri_'||v_tablename||';';
          execute immediate v_sql;
          fetch cur_table into v_tablename;
     end loop;
end create_trigger;




--���������رմ������Ľű�
select 'alter trigger tri_'||tb.tname|| ' disable;'
from (select T.TABLE_NAME tname from all_tables t where t.OWNER='TC') tb;
--�����رմ������Ĵ洢����
create or replace procedure alter_trigger_disable is
 v_tablename varchar2(30);
 v_drop_sql varchar2(1000);
 cursor cur_table is select t.TABLE_NAME from all_tables t where t.OWNER='MY' and t.TABLE_NAME<>'DEP_LOG';
begin
  --dbms_output.enable(buffer_size=>null);
  open cur_table;
  fetch cur_table into v_tablename;
  while cur_table%found 
     loop          
          v_drop_sql:='alter trigger TRI_'||v_tablename||' disable';
          dbms_output.put_line(v_drop_sql);
          execute immediate v_drop_sql;
          fetch cur_table into v_tablename;
     end loop;
end alter_trigger_disable;

--�������������������Ľű�
select
'alter trigger tri_'||tb.tname|| ' enable;'
from (select T.TABLE_NAME tname from all_tables t where t.OWNER='MY') tb;
--���������������Ĵ洢����
create or replace procedure alter_trigger_disable is
 v_tablename varchar2(30);
 v_drop_sql varchar2(1000);
 cursor cur_table is select t.TABLE_NAME from all_tables t where t.OWNER='MY' and t.TABLE_NAME<>'DEP_LOG';
begin
  --dbms_output.enable(buffer_size=>null);
  open cur_table;
  fetch cur_table into v_tablename;
  while cur_table%found 
     loop          
          v_drop_sql:='alter trigger TRI_'||v_tablename||' enable';
          dbms_output.put_line(v_drop_sql);
          execute immediate v_drop_sql;
          fetch cur_table into v_tablename;
     end loop;
end alter_trigger_disable;
--��������ɾ���������Ľű�
select
'drop trigger tri_'||tb.tname|| ';'
from (select T.TABLE_NAME tname from all_tables t where t.OWNER='MY') tb;
--ɾ���������Ĵ洢����
create or replace procedure drop_trigger is
 v_tablename varchar2(30);
 v_drop_sql varchar2(1000);
 cursor cur_table is select t.TABLE_NAME from all_tables t where t.OWNER='MY' and t.TABLE_NAME<>'DEP_LOG';
begin
  open cur_table;
  fetch cur_table into v_tablename;
  while cur_table%found 
     loop          
          v_drop_sql:='drop trigger TRI_'||v_tablename;
          dbms_output.put_line(v_drop_sql);
          execute immediate v_drop_sql;
          fetch cur_table into v_tablename;
     end loop;
end drop_trigger;


-------------------------------------------------------------------------




