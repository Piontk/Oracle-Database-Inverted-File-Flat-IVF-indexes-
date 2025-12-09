DESC VECTOR.ORACLE_DOCS

alter session set nls_date_format='dd/mm/yyyy hh:mi:ss';
SELECT sql_id, child_number, last_active_time FROM v$sql WHERE sql_text LIKE '%teste_IVF%' AND sql_text NOT LIKE '%v$sql%';

DECLARE
    x varchar2(100);
BEGIN
    x := dbms_sqldiag.create_sql_patch(sql_id=>'fju056hgyramn', 
                                       hint_text=>'GATHER_PLAN_STATISTICS NO_PARALLEL', 
                                       name=> 'patch_gather_stats');
END;
/

SELECT sql_id, child_number, last_active_time FROM v$sql WHERE sql_text LIKE '%teste_IVF%' AND sql_text NOT LIKE '%v$sql%';


SELECT * FROM TABLE (dbms_xplan.display_cursor ('fju056hgyramn',0,'ADVANCED ALLSTATS LAST'));


-- verificar objetos do schema

select segment_name, segment_type, sum(bytes)/1024/1024 as TAM_MB
from   dba_segments
where owner='VECTOR'
group by segment_name, segment_type;

-- verificar lobs 

SELECT owner, table_name, column_name, segment_name, index_name, tablespace_name
FROM dba_lobs
WHERE table_name = 'ORACLE_DOCS';

-- criação do IVF index

CREATE VECTOR INDEX vector.idx_ivf_oracle_docs_01 ON vector.oracle_docs (embedding) 
ORGANIZATION NEIGHBOR PARTITIONS
DISTANCE EUCLIDEAN
WITH TARGET ACCURACY 90;