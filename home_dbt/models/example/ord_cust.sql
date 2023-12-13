{{ config(materialized='table') }} 
 
SELECT  
    C.C_CUSTKEY, 
    C.C_NAME, 
    C.C_NATIONKEY AS NATION, 
    SUM(A.O_TOTALPRICE) AS TOTAL_PRICE  
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER C 
LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS A 
    ON C.C_CUSTKEY = A.O_CUSTKEY 
GROUP BY C.C_CUSTKEY,C.C_NAME,C.C_NATIONKEY