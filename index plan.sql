SQL_ID  fju056hgyramn, child number 0
-------------------------------------
SELECT /*teste_IVF*/        text,        JSON_VALUE(metadata, 
'$.source') AS source,        vector_distance(embedding, 
TO_VECTOR(:vec), EUCLIDEAN) as distance FROM "ORACLE_DOCS" ORDER BY 
distance FETCH APPROX FIRST 5 ROWS ONLY
 
Plan hash value: 4242188579
 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
| Id  | Operation                         | Name                                                                       | Starts | E-Rows |E-Bytes| Cost (%CPU)| E-Time   | Pstart| Pstop | A-Rows |   A-Time   | Buffers | Reads  |  OMem |  1Mem | Used-Mem |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                  |                                                                            |      1 |        |       |   350 (100)|          |       |       |      5 |00:00:00.07 |    1220 |    909 |       |       |          |
|   1 |  VIEW                             |                                                                            |      1 |      5 | 20050 |   350   (1)| 00:00:01 |       |       |      5 |00:00:00.07 |    1220 |    909 |       |       |          |
|   2 |   NESTED LOOPS                    |                                                                            |      1 |      5 | 48525 |   350   (1)| 00:00:01 |       |       |      5 |00:00:00.07 |    1220 |    909 |       |       |          |
|   3 |    VIEW                           | VW_IVPSR_11E7D7DE                                                          |      1 |      5 |    80 |   345   (1)| 00:00:01 |       |       |      5 |00:00:00.07 |    1210 |    909 |       |       |          |
|*  4 |     COUNT STOPKEY                 |                                                                            |      1 |        |       |            |          |       |       |      5 |00:00:00.07 |    1210 |    909 |       |       |          |
|   5 |      VIEW                         | VW_IVPSJ_578B79F1                                                          |      1 |    670 | 12060 |   345   (1)| 00:00:01 |       |       |      5 |00:00:00.07 |    1210 |    909 |       |       |          |
|*  6 |       SORT ORDER BY STOPKEY       |                                                                            |      1 |    670 | 16080 |   345   (1)| 00:00:01 |       |       |      5 |00:00:00.07 |    1210 |    909 |  2048 |  2048 | 2048  (0)|
|*  7 |        HASH JOIN                  |                                                                            |      1 |    670 | 16080 |   344   (1)| 00:00:01 |       |       |    808 |00:00:00.01 |    1210 |    909 |  2546K|  2546K| 1232K (0)|
|   8 |         PART JOIN FILTER CREATE   | :BF0000                                                                    |      1 |     13 |    52 |    69   (2)| 00:00:01 |       |       |     13 |00:00:00.01 |     235 |      0 |       |       |          |
|   9 |          VIEW                     | VW_IVCR_B5B87E67                                                           |      1 |     13 |    52 |    69   (2)| 00:00:01 |       |       |     13 |00:00:00.01 |     235 |      0 |       |       |          |
|* 10 |           COUNT STOPKEY           |                                                                            |      1 |        |       |            |          |       |       |     13 |00:00:00.01 |     235 |      0 |       |       |          |
|  11 |            VIEW                   | VW_IVCN_9A1D2119                                                           |      1 |    190 |  2470 |    69   (2)| 00:00:01 |       |       |     13 |00:00:00.01 |     235 |      0 |       |       |          |
|* 12 |             SORT ORDER BY STOPKEY |                                                                            |      1 |    190 |  1900 |    69   (2)| 00:00:01 |       |       |     13 |00:00:00.01 |     235 |      0 |  2048 |  2048 | 2048  (0)|
|  13 |              TABLE ACCESS FULL    | VECTOR$IDX_IVF_ORACLE_DOCS_01$126314_134514_0$IVF_FLAT_CENTROIDS           |      1 |    190 |  1900 |    68   (0)| 00:00:01 |       |       |    190 |00:00:00.01 |     235 |      0 |       |       |          |
|  14 |         PARTITION LIST JOIN-FILTER|                                                                            |      1 |   9792 |   191K|    21   (0)| 00:00:01 |:BF0000|:BF0000|    808 |00:00:00.01 |     975 |    909 |       |       |          |
|  15 |          TABLE ACCESS FULL        | VECTOR$IDX_IVF_ORACLE_DOCS_01$126314_134514_0$IVF_FLAT_CENTROID_PARTITIONS |     13 |   9792 |   191K|    21   (0)| 00:00:01 |:BF0000|:BF0000|    808 |00:00:00.03 |     975 |    909 |       |       |          |
|  16 |    TABLE ACCESS BY USER ROWID     | ORACLE_DOCS                                                                |      5 |      1 |  9689 |     1   (0)| 00:00:01 |       |       |      5 |00:00:00.01 |      10 |      0 |       |       |          |
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$94C0F189 / "from$_subquery$_002"@"SEL$2"
   2 - SEL$94C0F189
   3 - SEL$E731354C / "VW_IVPSR_11E7D7DE"@"SEL$1"
   4 - SEL$E731354C
   5 - SEL$0C00A749 / "VW_IVPSJ_578B79F1"@"SEL$E731354C"
   6 - SEL$0C00A749
   9 - SEL$700CE8F1 / "VW_IVCR_B5B87E67"@"SEL$0C00A749"
  10 - SEL$700CE8F1
  11 - SEL$E5326247 / "VW_IVCN_9A1D2119"@"SEL$700CE8F1"
  12 - SEL$E5326247
  13 - SEL$E5326247 / "VTIX_CENTRD"@"SEL$E5326247"
  15 - SEL$0C00A749 / "VTIX_CNPART"@"SEL$0C00A749"
  16 - SEL$94C0F189 / "ORACLE_DOCS"@"SEL$1"
 
Outline Data
-------------
 
  /*+
      BEGIN_OUTLINE_DATA
      IGNORE_OPTIM_EMBEDDED_HINTS
      OPTIMIZER_FEATURES_ENABLE('23.1.0')
      DB_VERSION('23.1.0')
      OPT_PARAM('_fix_control' '20648883:0 26552730:1 27175987:0 29972495:0 22387320:0 30195773:0 31945701:1 32108311:1 33659818:3 34092979:1 35495824:1 33792497:1 36554842:1 36283175:1 31720959:1 36004220:1 36635255:1 36675198:1 36868551:1 37400112:1 
              37346200:0 37626161:1')
      ALL_ROWS
      FORCE_XML_QUERY_REWRITE
      FORCE_JSON_TABLE_TRANSFORM
      XML_DML_RWT_STMT
      XMLINDEX_REWRITE
      XMLINDEX_REWRITE_IN_SELECT
      NO_COST_XML_QUERY_REWRITE
      OUTLINE_LEAF(@"SEL$E5326247")
      OUTLINE_LEAF(@"SEL$700CE8F1")
      OUTLINE_LEAF(@"SEL$0C00A749")
      OUTLINE_LEAF(@"SEL$E731354C")
      OUTLINE_LEAF(@"SEL$94C0F189")
      VECTOR_INDEX_TRANSFORM(@"SEL$1" "ORACLE_DOCS"@"SEL$1" "IDX_IVF_ORACLE_DOCS_01" PRE_FILTER_WITHOUT_JOIN_BACK)
      OUTLINE_LEAF(@"SEL$2")
      OUTLINE(@"SEL$1")
      NO_ACCESS(@"SEL$2" "from$_subquery$_002"@"SEL$2")
      NO_ACCESS(@"SEL$94C0F189" "VW_IVPSR_11E7D7DE"@"SEL$1")
      ROWID(@"SEL$94C0F189" "ORACLE_DOCS"@"SEL$1")
      LEADING(@"SEL$94C0F189" "VW_IVPSR_11E7D7DE"@"SEL$1" "ORACLE_DOCS"@"SEL$1")
      USE_NL(@"SEL$94C0F189" "ORACLE_DOCS"@"SEL$1")
      NO_ACCESS(@"SEL$E731354C" "VW_IVPSJ_578B79F1"@"SEL$E731354C")
      NO_ACCESS(@"SEL$0C00A749" "VW_IVCR_B5B87E67"@"SEL$0C00A749")
      FULL(@"SEL$0C00A749" "VTIX_CNPART"@"SEL$0C00A749")
      LEADING(@"SEL$0C00A749" "VW_IVCR_B5B87E67"@"SEL$0C00A749" "VTIX_CNPART"@"SEL$0C00A749")
      USE_HASH(@"SEL$0C00A749" "VTIX_CNPART"@"SEL$0C00A749")
      NO_ACCESS(@"SEL$700CE8F1" "VW_IVCN_9A1D2119"@"SEL$700CE8F1")
      FULL(@"SEL$E5326247" "VTIX_CENTRD"@"SEL$E5326247")
      END_OUTLINE_DATA
  */
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   4 - filter(ROWNUM<=5)
   6 - filter(ROWNUM<=5)
   7 - access("VW_IVCR_B5B87E67"."CENTROID_ID"="VTIX_CNPART"."CENTROID_ID")
  10 - filter(ROWNUM<=13)
  12 - filter(ROWNUM<=13)
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - "from$_subquery$_002"."TEXT"[LOB,4000], "from$_subquery$_002"."SOURCE"[VARCHAR2,4000], "from$_subquery$_002"."DISTANCE"[BINARY_DOUBLE,8]
   2 - "VW_IVPSR_11E7D7DE"."VEC_DIST"[BINARY_DOUBLE,8], "ORACLE_DOCS"."TEXT"[LOB,4000], "METADATA" /*+ LOB_BY_VALUE */ [JSON,8200]
   3 - "BASE_TABLE_ROWID"[ROWID,10], "VW_IVPSR_11E7D7DE"."VEC_DIST"[BINARY_DOUBLE,8]
   4 - "VW_IVPSJ_578B79F1"."BASE_TABLE_ROWID"[ROWID,10], "VW_IVPSJ_578B79F1"."VEC_DIST"[BINARY_DOUBLE,8]
   5 - "VW_IVPSJ_578B79F1"."BASE_TABLE_ROWID"[ROWID,10], "VW_IVPSJ_578B79F1"."VEC_DIST"[BINARY_DOUBLE,8]
   6 - (#keys=1) VECTOR_DISTANCE("VTIX_CNPART"."DATA_VECTOR" /*+ LOB_BY_VALUE */  /*+ LOB_INLINE */ , VECTOR(:VEC, *, *, * /*+  USEBLOBPCW_QVCGMD */ ), EUCLIDEAN)[8], "VTIX_CNPART"."BASE_TABLE_ROWID"[ROWID,10]
   7 - (#keys=1) "VTIX_CNPART"."BASE_TABLE_ROWID"[ROWID,10], VECTOR_DISTANCE("VTIX_CNPART"."DATA_VECTOR" /*+ LOB_BY_VALUE */  /*+ LOB_INLINE */ , VECTOR(:VEC, *, *, * /*+  USEBLOBPCW_QVCGMD */ ), EUCLIDEAN)[8]
   8 - "VW_IVCR_B5B87E67"."CENTROID_ID"[NUMBER,22], "VW_IVCR_B5B87E67"."CENTROID_ID"[NUMBER,22]
   9 - "CENTROID_ID"[NUMBER,22]
  10 - "VW_IVCN_9A1D2119"."CENTROID_ID"[NUMBER,22]
  11 - "VW_IVCN_9A1D2119"."CENTROID_ID"[NUMBER,22]
  12 - (#keys=2) VECTOR_DISTANCE("VECTOR$IDX_IVF_ORACLE_DOCS_01$126314_134514_0$IVF_FLAT_CENTROIDS"."CENTROID_VECTOR" /*+ LOB_BY_VALUE */  /*+ LOB_INLINE */ , VECTOR(:VEC, *, *, * /*+  USEBLOBPCW_QVCGMD */ ), EUCLIDEAN)[8], 
       "VTIX_CENTRD"."CENTROID_ID"[NUMBER,22]
  13 - "VTIX_CENTRD"."CENTROID_ID"[NUMBER,22], VECTOR_DISTANCE("VECTOR$IDX_IVF_ORACLE_DOCS_01$126314_134514_0$IVF_FLAT_CENTROIDS"."CENTROID_VECTOR" /*+ LOB_BY_VALUE */  /*+ LOB_INLINE */ , VECTOR(:VEC, *, *, * /*+  USEBLOBPCW_QVCGMD */ ), 
       EUCLIDEAN)[8]
  14 - "VTIX_CNPART"."BASE_TABLE_ROWID"[ROWID,10], "VTIX_CNPART"."CENTROID_ID"[NUMBER,22], VECTOR_DISTANCE("VTIX_CNPART"."DATA_VECTOR" /*+ LOB_BY_VALUE */  /*+ LOB_INLINE */ , VECTOR(:VEC, *, *, * /*+  USEBLOBPCW_QVCGMD */ ), EUCLIDEAN)[8]
  15 - "VTIX_CNPART"."BASE_TABLE_ROWID"[ROWID,10], "VTIX_CNPART"."CENTROID_ID"[NUMBER,22], VECTOR_DISTANCE("VTIX_CNPART"."DATA_VECTOR" /*+ LOB_BY_VALUE */  /*+ LOB_INLINE */ , VECTOR(:VEC, *, *, * /*+  USEBLOBPCW_QVCGMD */ ), EUCLIDEAN)[8]
  16 - "ORACLE_DOCS"."TEXT"[LOB,4000], "METADATA" /*+ LOB_BY_VALUE */ [JSON,8200]
 
Hint Report (identified by operation id / Query Block Name / Object Alias):
Total hints for statement: 1
---------------------------------------------------------------------------
 
   0 -  STATEMENT
           -  NO_PARALLEL
 
Note
-----
   - Degree of Parallelism is 1 because of hint
   - SQL patch "patch_gather_stats" used for this statement
 
Query Block Registry:
---------------------
 
  SEL$1 (PARSER)
    SEL$94C0F189 (IVF VECTOR INDEX PRE-FILTER WITHOUT JOIN-BACK SEL$1) [FINAL]
      SEL$E731354C (IVF VECTOR INDEX NO-FILTER JOIN ROWNUM VIEW SEL$94C0F189) [FINAL]
        SEL$0C00A749 (IVF VECTOR INDEX NO-FILTER JOIN VIEW SEL$E731354C) [FINAL]
          SEL$700CE8F1 (IVF VECTOR INDEX CENTROID ROWNUM VIEW SEL$0C00A749) [FINAL]
            SEL$E5326247 (IVF VECTOR INDEX CENTROID VIEW SEL$700CE8F1) [FINAL]
  SEL$2 (PARSER) [FINAL]
 
 