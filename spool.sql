conn user_n/n@(DESCRIPTION=(ADDRESS_LIST =(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.202.171)(PORT = 1521)))(CONNECT_DATA =(SERVICE_NAME = xdgl)));

set echo off     --����start�����Ľű��е�ÿ��sql���Ĭ��ֵ��on,��ִ�е�����sql�������ʾ������     
set feedback off --��ʾ����sql�����ļ�¼������Ĭ��Ϊon,�����      
set heading off   --�������⣬Ĭ��ֵΪon     
set verify off        
set trimspool off  --ȥ���ض������ÿ�е���β�ո�Ĭ��ֵΪon
set pagesize 1000 --���ÿҳ������Ĭ��ֵ��24��Ϊ�����ҳ������Ϊ0
set linesize 653 --���һ���ַ��ĸ�����Ĭ��ֵ��80��

spool systime.txt
select value from pmsysparam where code='0001';
spool off
quit
