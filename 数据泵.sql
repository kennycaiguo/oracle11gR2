
--�������ݱ�
<<!
LIME 2016-7-6
ִ�нű�ǰ�޸��û��������룬�������ݴ��·��
�ýű�ֻ����oaracle 11G
����·���ļ��б��븳�������û��Ŀ�дȨ��
�޸Ļ�������
!

USERID=tc
PASSWORD=tc
fileName=`date +'%Y%m%d%H%M%S'`
sysDate=`date +'%Y-%m-%d %H:%M:%S'`
schemasUser=tc
dbBakPath=/cmisbatch/oradata_bak/$fileName

export LC__FASTMSG=true
export LOCPATH=/usr/lib/nls/loc
export LOGIN=cmis
export MAILMSG='[YOU HAVE NEW MAIL]'
export NLSPATH=/usr/lib/nls/msg/%L/%N:/usr/lib/nls/msg/%L/%N.cat:/usr/lib/nls/msg/%l.%c/%N:/usr/lib/nls/msg/%l.%c/%N.cat
export ODMDIR=/etc/objrepos
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK
export MAIL=/var/spool/mail/oracle
export ORACLE_BASE=/oracle/app/oracle
export ORACLE_BIN=/oracle/app/oracle/product/11.2.0/db_1/bin
export ORACLE_HOME=/oracle/app/oracle/product/11.2.0/db_1
export ORACLE_SID=xdgl
export PATH=/oracle/app/oracle/product/11.2.0/db_1/bin:/usr/bin:/etc:/usr/sbin:/usr/ucb:/home/oracle/bin:/usr/bin/X11:/sbin:.

if [ ! -d "$dbBakPath" ];
then
	mkdir -p -m 777 $dbBakPath 
else
	chmod 777 $dbBakPath 
fi

sqlplus $USERID/$PASSWORD<<EOF
create or replace directory dump as '$dbBakPath';
grant read,write on directory dump to system;
EOF

expdp $USERID/$PASSWORD directory=dump dumpfile=$fileName.dmp logfile=$fileName.log full=y compression=ALL
--���̵߳���
expdp $USERID/$PASSWORD directory=dump dumpfile=$fileName.dmp logfile=$fileName.log full=y compression=ALL parallel=4


--�����͵��벻�����ݵĿտ�,�ڵ���ʱ��ֻ�����ݿ�ṹ���ڵ���ʱ�ӣ�����dmp�ļ��������ݶ�ֻ�������ݿ�ṹ
content=METADATA_ONLY;


exit 

-----------------------------------------------
#!/bin/bash
#************************************************************#
#�ýű���oracle�˻���ִ��                                    #
#ִ��ǰ�����Ĺ�����                                          #
#1)��������Ŀ¼��mkdir -p -m 766 $dbBakPath                  #
#2)ΪĿ¼���������߼������飺chown -R oracle:dba $dbBakPath  #
#3)�����û��������뼰����Ŀ¼��								 #
#************************************************************#

USERID=user_o
PASSWORD=o
fileName=`date +'%Y%m%d%H%M'`
schemasUser=tt
dbBakPath=/oradata/dump

#mkdir -p -m 766 $dbBakPath

sqlplus / as sysdba<<EOF
create or replace directory dump as '$dbBakPath';
grant read,write on directory dump to $USERID;
EOF

impdp $USERID/$PASSWORD directory=dump dumpfile=20160926230006.dmp remap_tablespace='(INDX:USER_OLD,USERS:USER_OLD)' remap_schema=eximuser:user_o
#remap_tablespace=USERS:TT remap_schema=eximuser:tt
#remap_tablespace=USERS:JYUAT remap_schema=$USERID:$USERID
#content=METADATA_ONLY
exit 




--����Ҫ��197���ݿ��eximuser_yw�û��µ����ݵ��뵽194���te�û���
--�ڱ��ؿⴴ��Զ������
-- Drop existing database link 
drop database link EXIMUSER_YW;
-- Create database link 
create database link EXIMUSER_YW
  connect to EXIMUSER_YW
  using '(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.202.197)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = xdgl197)
    )
  )';
--ΪԶ���û�����Ȩ��
grant exp_full_database to eximuser_yw;





--��������
--��ѯ���ݱõ���������
select * from dba_datapump_jobs;




���뱨��ORA-39151�Ĵ�
ORA-39151: Table "SYSTEM"."REPCAT$_REPSCHEMA" exists. All dependent metadata and data will be skipped due to table_exists_action of skip
�������������
SKIP_UNUSABLE_INDEXES=Y
TABLE_EXISTS_ACTION=TRUNCATE

ORA-39083: Object type TABLESPACE failed to create with error:
���󴴽���������������Ŵ����ԭ��

ORA-02236: invalid file name


ORA-07443: function VERIFY_FUNCTION_11G not found
����û�ҵ�

ORA-31684: Object type USER:"OUTLN" already exists
�����Ѿ�����
