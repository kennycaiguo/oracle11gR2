---------------------------------------------------
--�ڴ洢������ִ�еĴ�����䶼������ʾ��Ȩ���紴��������������
--grant create table to user_name;
--�ڴ洢�����в����ִ�Сд���������ֲ���ʱ������javaһ���ô�Сд����
--
--
--
--
--
-----------------------------------------------------





-------------��plsql developer�д����洢���̣����½�>>���򴰿�---------------------------
=======
--�﷨
=======
create or replace procedure test(Name in out type, Name in out type, ...) is --�������ؽ������д���ʹ��������Ĵ洢����
 --�������
 --�����α�
begin
 --�߼�����
exception
  --�쳣����
  when too_many_rows then
    
end test;
===================
--�޲����Ĵ洢���̡�
===================
create procedure in_dept is
begin
 insert into dept values(70,'www','www');
end;
========================
--���ù���,���������
========================
SQL > exec in_dept;
SQL > call in_dept;--�����ø÷�����Ӧ�÷���ͨ�ã������������ݿ�Ҳʹ�ã���JAVA��Ҳ��ʹ������


--ɾ����¼�Ĺ���
create or replace procedure de_dept(in_deptno number) is
begin
  delete from dept where deptno=in_deptno;
end;
--**********************************************************-----
pl/sql ������ʲô��
1 ���Կ�������
2 ��������
3 ������
4 ����������
���ǵĻ������Ե�Ԫ�ǿ顣

ע�� 
���� --
����/**/
������� v_sal
���峣�� c_sql
�����α� emp_cursor;
�������� e_error;

---�飨bock)���﷨-------------------
declare 
  -- Local variables here
  i integer;
begin
  -- Test statements here
exception
  --��ȡ�쳣
end;
---------��򵥵Ŀ�,ֻ��begin��end----
SQL > set serveroutput on;
SQL > begin
       -- Test statements here
       dbms_output.put_line('hello word');
     end;
--��Ĭ������£��������hello word����Ҫset serveroutput on;
----
declare 
  v_ename varchar2(20);
begin
  select ename into v_ename from emp where empno=&empno;
  dbms_output.put_line(v_ename);
end;
--�ĳɹ���--
create procedure pro3(in_empno number) is 
  v_ename varchar2(20);
begin
  select ename into v_ename from emp where empno=in_empno;
  dbms_output.put_line(v_ename);
end;
-------------Java�е��ù���,�洢�����ǿ����з���ֵ�ġ�-----------------------

create or replace procedure insert_dept(
num_deptno in number,
var_ename in varchar2,
var_loc in varchar2) is
begin
  insert into dept values(num_deptno,var_ename,var_loc);
  commit;
end insert_dept;

---
create or replace procedure select_dept(
       num_deptno in number,
       var_dname out dept.dname%type,
       var_loc out dept.loc%type) is
begin
  select dname,loc into var_dname,var_loc from dept where deptno=num_deptno;
exception
  when no_data_found then
    dbms_output.put_line('�ò��Ų�����');
end select_dept;



-------------����--------------------------
create function ������(����)  return ���ص��������� is
--�������
begin
--ִ�����
end;
--����
create or replace function fun1(in_v_ename varchar2) return number is
  v_sal number;
begin
  select sal*13 into v_sal from emp where ename=in_v_ename;
  return v_sal;
end;

--����
SQL> select fun1('SMITH') from dual;


---�������Ը��õĹ����Լ�д�ĺ����͹���---
create package ���� is
	--��������
	function ... return ...;
	--��������
	procedure ;
end;

--��������
create package mypack1 is
       procedure pro1(in_v_ename varchar2,v_in_sal number);
       function fun1(v_in_name varchar2) return number;    
end;

--���壬д����֮ǰӦ���а��������ڰ��������ĺ����͹���ʵ��--

--�쳣�ж�
exception
  when others then
      dbms_output.put_line('�����쳣');
end;



-------------------------------------------------
--���漰�������û��µı����ʱ����ִ�д洢����ʱ�ر������ͼ�����ڵĴ���
 grant select,insert,update,delete on tc.AFRPINT to my;
 grant select any table to userName;

--�ڴ洢�����У�����鲻������ʱ�ı�����
 select (SELECT t.pkid FROM wfdir t where rownum=1)  from dual ;


-----------------------------------------------------------------------------
--�쳣������ִ�д洢��������Ҫ���쳣������ƣ������쳣��Ӧ��ӡ��־

--1��������¼��־�ı�
create table pub_proc_err_log(log_id number,module_name varchar2(100),proc_name varchar2(100),err_time date,sql_code varchar2(50),sql_errm varchar2(100),err_content varchar2(500));
 
--2,��������
create sequence seq_record_proc_err minvalue 1 maxvalue 999999999999999999999 start with 21 increment by 1 cache 20;

--3.ͨ�ü�¼����Ĵ洢����
create or replace procedure record_proc_err_log(module_name varchar2,
                                                proc_name   varchar2,
                                                v_sqlcode   varchar2,
                                                v_sqlerrm   varchar2,
                                                v_err_line  varchar2) is
begin
  insert into pub_proc_err_log
    (log_id,
     module_name,
     proc_name,
     err_time,
     sql_code,
     sql_errm,
     err_content)
  values
    (seq_record_proc_err.nextval,
     module_name,
     proc_name,
     sysdate,
     v_sqlcode,
     v_sqlerrm,
     v_err_line);
  commit;
end record_proc_err_log;

--4����
 

 
 
--------------------------------------------------------------------------
--��ӡ��־����һ��˼·
--����һ�ű�
create table cbct_log(table_name varchar2(50),column_name varchar2(500),column_values varchar2(500),ctype varchar2(50),c_data date);



--------------------------------------------------------------------------
=================================
======��д�洢���̵�˼·=========
=1��Ϊ���������õ���ʱ�洢����  =
=2��������������ʹ�õĴ洢����  =
=3�������е��õĹ��ô洢����    =
=================================

-------------------------------------------------
--�洢���̵Ĳ��ԣ��½�һ�����Դ���
-------------------------------------------------


/*1����ʱ�洢���̵ı�д
		��Ҫ����������Ŀ�Ķ�Ӧ��ϵ������һ��һ�Ĺ�ϵ�迼�ǲ��������û�в�����ݵĴ��������
		����ʱ�Ĵ洢�����в��ܼ򵥵İ��쳣ץȡ����Ͳ���
		ץȡ���쳣�������辫׼����ʾ��
		����ͻ�ѡ�����Ǽ������ǻ���
		��¼��־�����ص�txt�ļ�
*/






/*2�������еĴ洢����
	��Ĳ�����
	��¼��־�������ݿ��еĴ�����־����
	���ͨ�õĴ�����־��ͼ�¼������־�Ĵ洢���̣��Ա����õ����������ܼ�¼������־��
*/






/*3��ƽ��ҵ����õĵĴ洢����
		д��ͨ�õķ������Ա㷽���ĸ���
		�ڲ������д�������ʹ����������Ǳ��裩
		�����쳣���񣬸��辫׼��ʾ
*/












--------------------------------------------------------------------------

====================
==  �洢����ģ��  ==
====================

--ѭ��һ���α�
create or replace test is
   var_oldzh gszh.oldzh%type;
   cursor cur_gszh is select oldzh from gszh;
begin
   open cur_gszh
   fetch cur_gszh into var_oldzh;
   while cur_gszh%found loop    
		--sql����   
     fetch cur_gszh into row_gszh;
   end loop;
   close cur_gszh;
end test;

--��forѭ�������α꣬����ʾ�����α����
create or replace procedure test is
  cursor cur_gszh is select * from gszh;
begin
  for gszh_row in cur_gszh loop
    dbms_output.put(gszh_row.oldzh);
  end loop;
end test;

--forѭ����ʹ��
-- Created on 2016/11/21 by LIANG_MENG 
declare 
begin
   for v_a in -5..5 loop
     dbms_output.put_line(v_a);
   end loop;
end;




execute immediate ʱ��Ҫ������г���DDL�Ĳ�����������ʹ��ǰ����ֵ��޸���������ύ������һ���Ա��ƻ����޷����ˡ�









--------------------------------------------------------------
=======================================================
==					�洢���̰���					 ==
=======================================================











