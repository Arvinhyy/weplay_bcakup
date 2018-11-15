INSERT overwrite TABLE weplay.predictmodel_data
SELECT 
mobile,
application_id,
applied_at,
score_card_version,
sv1,
sv2,
sv3,
sv4,
sv5,
sv6,
sv7,
sv8,
sv9,
sv10,
sv11,
sv12,
sv13,
sv14,
sv15,
sv16,
sv17,
sv18,
sv19,
sv20,
sv21,
v1,
v2,
v3,
v4,
v5,
v6,
v7,
v8,
v9,
v10,
v11,
v12,
v13,
v14,
v15,
v16,
v17,
v18,
v19,
v20,
v21,
CAST(score AS STRING) score,
scoreclass,
logtime,
score_interval
FROM
(SELECT 
  st.*,
  CASE WHEN (score_card_version = '3.0' AND (-13 <= score) AND score< 25) THEN 'T1' 
       WHEN (score_card_version = '3.0' AND 25<= score AND score< 63) THEN 'T2' 
       WHEN (score_card_version = '3.0' AND 63<= score AND score< 101) THEN 'T3' 
       WHEN (score_card_version = '3.0' AND 101<= score AND score< 139) THEN 'T4'
   	   WHEN (score_card_version = '3.0' AND 139<= score AND score< 177) THEN 'T5' 
       WHEN (score_card_version = '3.0' AND 177<= score AND score< 215) THEN 'T6' 
       WHEN (score_card_version = '3.0' AND 215<= score AND score< 253) THEN 'T7' 
       WHEN (score_card_version = '3.0' AND 253<= score AND score< 291) THEN 'T8' 
       WHEN (score_card_version = '3.0' AND 291<= score AND score< 329) THEN 'T9' 
       WHEN (score_card_version = '3.0' AND 329<= score AND score<= 369) THEN 'TF' 
       
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 75<= score AND score< 99 THEN 'T1'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 99<= score AND score< 123 THEN 'T2'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 123<= score AND score< 147 THEN 'T3'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 147<= score AND score< 171 THEN 'T4'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 171<= score AND score< 195 THEN 'T5'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 195<= score AND score< 219 THEN 'T6'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 219<= score AND score< 243 THEN 'T7'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 243<= score AND score< 267 THEN 'T8'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 267<= score AND score< 291 THEN 'T9'
       WHEN (score_card_version = '3.2' OR score_card_version = '3.2x') AND 291<= score AND score<= 320 THEN 'TF'
       
       WHEN (score_card_version = '3.3' AND 48<= score AND score< 70) THEN 'T1'
       WHEN (score_card_version = '3.3' AND 70<= score AND score< 92) THEN 'T2'
       WHEN (score_card_version = '3.3' AND 92<= score AND score< 114) THEN 'T3'
       WHEN (score_card_version = '3.3' AND 114<= score AND score< 136) THEN 'T4'
       WHEN (score_card_version = '3.3' AND 136<= score AND score< 158) THEN 'T5'
       WHEN (score_card_version = '3.3' AND 158<= score AND score< 180) THEN 'T6'
       WHEN (score_card_version = '3.3' AND 180<= score AND score< 202) THEN 'T7'
       WHEN (score_card_version = '3.3' AND 202<= score AND score< 224) THEN 'T8'
       WHEN (score_card_version = '3.3' AND 224<= score AND score< 246) THEN 'T9'
       WHEN (score_card_version = '3.3' AND 246<= score AND score<= 276) THEN 'TF'
      
       WHEN (score_card_version = '4.0' AND 279<= score AND score< 321) THEN 'T1'
       WHEN (score_card_version = '4.0' AND 321<= score AND score< 363) THEN 'T2'
       WHEN (score_card_version = '4.0' AND 363<= score AND score< 405) THEN 'T3'
       WHEN (score_card_version = '4.0' AND 405<= score AND score< 447) THEN 'T4'
       WHEN (score_card_version = '4.0' AND 447<= score AND score< 489) THEN 'T5'
       WHEN (score_card_version = '4.0' AND 489<= score AND score< 531) THEN 'T6'
       WHEN (score_card_version = '4.0' AND 531<= score AND score< 573) THEN 'T7'
       WHEN (score_card_version = '4.0' AND 573<= score AND score< 615) THEN 'T8'
       WHEN (score_card_version = '4.0' AND 615<= score AND score< 657) THEN 'T9'
       WHEN (score_card_version = '4.0' AND 657<= score AND score<= 699) THEN 'TF'    

       WHEN (score_card_version = '5.0' AND 90<= score AND score<109) THEN 'T1'
       WHEN (score_card_version = '5.0' AND 109<= score AND score<128) THEN 'T2'
       WHEN (score_card_version = '5.0' AND 128<= score AND score<147) THEN 'T3'
       WHEN (score_card_version = '5.0' AND 147<= score AND score<166) THEN 'T4'
       WHEN (score_card_version = '5.0' AND 166<= score AND score<185) THEN 'T5'
       WHEN (score_card_version = '5.0' AND 185<= score AND score<204) THEN 'T6'
       WHEN (score_card_version = '5.0' AND 204<= score AND score<223) THEN 'T7'
       WHEN (score_card_version = '5.0' AND 223<= score AND score<242) THEN 'T8'
       WHEN (score_card_version = '5.0' AND 242<= score AND score<261) THEN 'T9'
       WHEN (score_card_version = '5.0' AND 261<= score AND score<= 281) THEN 'TF' 

       WHEN (score_card_version = '6.0' AND 70.24<= score AND score<89.629) THEN 'T1'
       WHEN (score_card_version = '6.0' AND 89.629<= score AND score<109.018) THEN 'T2'
       WHEN (score_card_version = '6.0' AND 109.018<= score AND score<128.407) THEN 'T3'
       WHEN (score_card_version = '6.0' AND 128.407<= score AND score<147.796) THEN 'T4'
       WHEN (score_card_version = '6.0' AND 147.796<= score AND score<167.185) THEN 'T5'
       WHEN (score_card_version = '6.0' AND 167.185<= score AND score<186.574) THEN 'T6'
       WHEN (score_card_version = '6.0' AND 186.574<= score AND score<205.963) THEN 'T7'
       WHEN (score_card_version = '6.0' AND 205.963<= score AND score<225.352) THEN 'T8'
       WHEN (score_card_version = '6.0' AND 225.352<= score AND score<244.741) THEN 'T9'
       WHEN (score_card_version = '6.0' AND 244.741<= score AND score<=264.13) THEN 'TF' 
       WHEN (score_card_version = '6.0' AND (264.13 < score OR score <70.24)) THEN scoreclass END score_interval
       
FROM

(
--将不同score_card_version所属数据拼接,注意sv1,sv2,sv3,sv4,sv5数据类型三个表的区别
SELECT 
  account mobile,
  loan_id application_id,
  application_date applied_at ,
  score_card_version,
  sv1 , 
  sv2 ,
  sv3 ,
  --字符截取函数SUBSTRING(value，start，num)start为从哪位开始,num为取多少个字符。字符分割函数split_part(value,symbol,num)，symbol为分割符，num为取第几个字符组
  --SELECT CASE WHEN (CAST(sv4 as DECIMAL(4,2))*100)%10=0 THEN CONCAT(split_part(sv4,'.',1),'.',SUBSTRING(split_part(sv4,'.',2),1,1))  else sv4 END 
  --from weplay.predictmodel_data where  score_card_version = '6.0';
  CASE WHEN (ROUND(CAST(score_card_sv1 AS DECIMAL(7,3)),2) -(CAST(sv1 AS DECIMAL(5,2)) + CAST(sv2 AS DECIMAL(5,2)) + CAST(sv3 AS DECIMAL(5,2)) + CAST(sv5 AS DECIMAL(5,2))))*100%10 = 0
        THEN CAST(CAST(ROUND(CAST(score_card_sv1 AS DECIMAL(7,3)),2) -(CAST(sv1 AS DECIMAL(5,2)) + CAST(sv2 AS DECIMAL(5,2)) + CAST(sv3 AS DECIMAL(5,2)) + CAST(sv5 AS DECIMAL(5,2))) AS DECIMAL(7,1)) 
               AS STRING)
     ELSE
       CAST(ROUND(CAST(score_card_sv1 AS DECIMAL(7,3)),2) -(CAST(sv1 AS DECIMAL(5,2)) + CAST(sv2 AS DECIMAL(5,2)) + CAST(sv3 AS DECIMAL(5,2)) + CAST(sv5 AS DECIMAL(5,2)))as string)  END  SV4,
  sv5,
  score_card_sv2 sv6,
  score_card_sv3 sv7,
  score_card_sv4 sv8,
  score_card_sv5 sv9,
  score_card_sv6 sv10,
  score_card_sv7 sv11,
  score_card_sv8 sv12,
  score_card_sv9 sv13,
  score_card_sv10 sv14,
  score_card_sv11 sv15,
  score_card_sv12 sv16,
  score_card_sv13 sv17,
  score_card_sv14 sv18,
  score_card_sv15 sv19,
  score_card_sv16 sv20,
  score_card_sv17 sv21,
  v1,
  v2,
  v3,
  v4,
  v5,
  score_card_v2 v6,
  score_card_v3 v7,
  score_card_v4 v8,
  score_card_v5 v9,
  score_card_v6 v10,
  score_card_v7 v11,
  score_card_v8 v12,
  score_card_v9 v13,
  score_card_v10 v14,
  score_card_v11 v15,
  score_card_v12 v16,
  score_card_v13 v17,
  score_card_v14 v18,
  score_card_v15 v19,
  score_card_v16 v20,
  score_card_v17 v21, 
  self_score score,
  self_score_class scoreclass,
  log_time logtime

FROM

(
SELECT 
  t1.account,
  t1.loan_id,
  t1.application_date ,
  t1.score_card_version,  
  CASE WHEN (CAST(t2.applyloanstr_m12_id_max_monnum as int) <2  OR t2.applyloanstr_m12_id_max_monnum IS NULL AND score_scorecust IS NOT NULL) THEN CAST(CAST(28.1 AS DECIMAL(3,1)) AS STRING) 
       WHEN 2<= CAST(t2.applyloanstr_m12_id_max_monnum as int) AND CAST(t2.applyloanstr_m12_id_max_monnum as int)<3 THEN CAST(CAST(22.09 AS DECIMAL(4,2)) AS STRING) 
       WHEN 3<= CAST(t2.applyloanstr_m12_id_max_monnum as int) AND CAST(t2.applyloanstr_m12_id_max_monnum as int)<5 THEN CAST(CAST(18.78 AS DECIMAL(4,2)) AS STRING) 
       WHEN 5<= CAST(t2.applyloanstr_m12_id_max_monnum as int) AND CAST(t2.applyloanstr_m12_id_max_monnum as int)<6 THEN CAST(CAST(13.78 AS DECIMAL(4,2)) AS STRING) 
       WHEN 6<= CAST(t2.applyloanstr_m12_id_max_monnum as int) AND CAST(t2.applyloanstr_m12_id_max_monnum as int)<8 THEN CAST(CAST(9.42 AS DECIMAL(3,2)) AS STRING) 
       WHEN CAST(t2.applyloanstr_m12_id_max_monnum as int) >=8 THEN CAST(CAST(-0.57 AS DECIMAL(4,2)) AS STRING) END sv1,
  CASE WHEN (t2.applyloanstr_m3_id_nbank_oth_allnum  IS NULL AND score_scorecust IS NOT NULL) THEN CAST(CAST(22.64 AS DECIMAL(4,2)) AS STRING) 
       WHEN CAST(t2.applyloanstr_m3_id_nbank_oth_allnum as int) <=1 THEN CAST(CAST(15.03 AS DECIMAL(4,2)) AS STRING) 
       WHEN CAST(t2.applyloanstr_m3_id_nbank_oth_allnum as int) >1 THEN CAST(CAST(10.31 AS DECIMAL(4,2)) AS STRING) END sv2,  
  CASE WHEN ((t2.consumption_c_continue IS NULL OR t2.consumption_c_continue = 'M5') AND score_scorecust IS NOT NULL) THEN CAST(CAST(15.94 AS DECIMAL(4,2)) AS STRING) 
       WHEN t2.consumption_c_continue IN ('M1','M2','M3') THEN CAST(CAST(21.03 AS DECIMAL(4,2)) AS STRING) 
       WHEN t2.consumption_c_continue = 'M4' THEN CAST(CAST(27.78 AS DECIMAL(4,2)) AS STRING)  END sv3, 
  CASE WHEN (t2.stability_c_mail_number IS NULL AND score_scorecust IS NOT NULL) THEN CAST(CAST(17.91 AS DECIMAL(4,2)) AS STRING) 
       WHEN CAST(t2.stability_c_mail_number as int) <1 THEN CAST(CAST(19.83 AS DECIMAL(4,2)) AS STRING) 
       WHEN CAST(t2.stability_c_mail_number as int)>=1 AND CAST(t2.stability_c_mail_number as int) <2 THEN CAST(CAST(22.25 AS DECIMAL(4,2)) AS STRING) 
       WHEN CAST(t2.stability_c_mail_number as int) >=2 THEN CAST(CAST(24.37 AS DECIMAL(4,2)) AS STRING)  END sv5,  
  t1.score_card_sv1 ,
  t1.score_card_sv2 ,
  t1.score_card_sv3 ,
  t1.score_card_sv4 ,
  t1.score_card_sv5 ,
  t1.score_card_sv6,
  t1.score_card_sv7,
  t1.score_card_sv8,
  t1.score_card_sv9,
  t1.score_card_sv10,
  t1.score_card_sv11,
  t1.score_card_sv12,
  t1.score_card_sv13,
  t1.score_card_sv14,
  t1.score_card_sv15,
  t1.score_card_sv16,
  t1.score_card_sv17,
  t1.score_card_sv18,
  t1.score_card_sv19,
  t1.score_card_sv20,
  t1.score_card_sv21,
  t2.applyloanstr_m12_id_max_monnum v1,
  t2.applyloanstr_m3_id_nbank_oth_allnum v2,
  t2.consumption_c_continue v3,
  NULL v4,
  t2.stability_c_mail_number v5,
  t1.score_card_v2,
  t1.score_card_v3,
  t1.score_card_v4,
  t1.score_card_v5,
  t1.score_card_v6,
  t1.score_card_v7,
  t1.score_card_v8,
  t1.score_card_v9,
  t1.score_card_v10,
  t1.score_card_v11,
  t1.score_card_v12,
  t1.score_card_v13,
  t1.score_card_v14,
  t1.score_card_v15,
  t1.score_card_v16,
  t1.score_card_v17,
  t1.score_card_v18,
  t1.score_card_v19,
  t1.score_card_v20,
  t1.score_card_v21, 
  t1.self_score,
  t1.self_score_class,
  t1.log_time 
 FROM weplay.merged_data t1
   LEFT JOIN 
    (SELECT * FROM 
	    (SELECT account,
	    	    score_scorecust,
	            log_time,
	            applyloanstr_m12_id_max_monnum,
	            applyloanstr_m3_id_nbank_oth_allnum,
	            consumption_c_continue,
	            stability_c_mail_number,
	            ROW_NUMBER() OVER (PARTITION BY account,score_scorecust order by log_time DESC) ranktime 
		   FROM 
		        weplay_tmp.bairong_data_csi )aa 
	    WHERE ranktime = 1) t2 ON t1.account = t2.account  
	AND  t1.score_card_sv1 = t2.score_scorecust
  WHERE t1.score_card_version = '6.0' 
) smr WHERE to_date(smr.application_date) >= '2017-09-21'


UNION ALL 

SELECT 
  t1.account mobile,
  t1.loan_id application_id,
  t1.application_date applied_at ,
  t1.score_card_version,
  t1.score_card_sv1 sv1,
  t1.score_card_sv2 sv2,
  t1.score_card_sv3 sv3, 
  t1.score_card_sv4 sv4,
  t1.score_card_sv5 sv5,
  t1.score_card_sv6 sv6,
  t1.score_card_sv7 sv7,
  t1.score_card_sv8 sv8,
  t1.score_card_sv9 sv9,
  t1.score_card_sv10 sv10,
  t1.score_card_sv11 sv11,
  t1.score_card_sv12 sv12,
  t1.score_card_sv13 sv13,
  t1.score_card_sv14 sv14,
  t1.score_card_sv15 sv15,
  t1.score_card_sv16 sv16,
  t1.score_card_sv17 sv17,
  t1.score_card_sv18 sv18,
  t1.score_card_sv19 sv19,
  t1.score_card_sv20 sv20,
  t1.score_card_sv21 sv21,
  t1.score_card_v1 v1,
  t1.score_card_v2 v2,
  t1.score_card_v3 v3,
  t1.score_card_v4 v4,
  t1.score_card_v5 v5,
  t1.score_card_v6 v6,
  t1.score_card_v7 v7,
  t1.score_card_v8 v8,
  t1.score_card_v9 v9,
  t1.score_card_v10 v10,
  t1.score_card_v11 v11,
  t1.score_card_v12 v12,
  t1.score_card_v13 v13,
  t1.score_card_v14 v14,
  t1.score_card_v15 v15,
  t1.score_card_v16 v16,
  t1.score_card_v17 v17,
  t1.score_card_v18 v18,
  t1.score_card_v19 v19,
  t1.score_card_v20 v20,
  t1.score_card_v21 v21,
    
  t1.self_score score,
  CASE WHEN t1.score_card_version = '3.3' AND to_date(t1.application_date) > '2018-02-07' THEN t2.score_card_class
  	   ELSE t1.self_score_class END scoreclass,  
  t1.log_time logtime
 FROM weplay.merged_data t1
 LEFT JOIN  weplay.rules_engine_item t2 ON t1.loan_id = t2.loan_id 
   WHERE t1.score_card_version <> '6.0' 
     AND t1.score_card_version <> '3.2' 
     AND t1.score_card_version IS NOT NULL
     AND to_date(t1.application_date) >= '2017-09-21'
  
UNION ALL

SELECT 
  t1.account mobile,
  t1.loan_id application_id,
  t1.application_date applied_at ,
  '3.2x' score_card_version,
  t1.score_card_sv1 sv1,
  t1.score_card_sv2 sv2,
  t1.score_card_sv3 sv3, 
  t1.score_card_sv4 sv4,
  t1.score_card_sv5 sv5,
  t1.score_card_sv6 sv6,
  t1.score_card_sv7 sv7,
  t1.score_card_sv8 sv8,
  t1.score_card_sv9 sv9,
  t1.score_card_sv10 sv10,
  t1.score_card_sv11 sv11,
  t1.score_card_sv12 sv12,
  t1.score_card_sv13 sv13,
  t1.score_card_sv14 sv14,
  t1.score_card_sv15 sv15,
  t1.score_card_sv16 sv16,
  t1.score_card_sv17 sv17,
  t1.score_card_sv18 sv18,
  t1.score_card_sv19 sv19,
  t1.score_card_sv20 sv20,
  t1.score_card_sv21 sv21,
  t1.score_card_v1 v1,
  t1.score_card_v2 v2,
  t1.score_card_v3 v3,
  t1.score_card_v4 v4,
  t1.score_card_v5 v5,
  t1.score_card_v6 v6,
  t1.score_card_v7 v7,
  t1.score_card_v8 v8,
  t1.score_card_v9 v9,
  t1.score_card_v10 v10,
  t1.score_card_v11 v11,
  t1.score_card_v12 v12,
  t1.score_card_v13 v13,
  t1.score_card_v14 v14,
  t1.score_card_v15 v15,
  t1.score_card_v16 v16,
  t1.score_card_v17 v17,
  t1.score_card_v18 v18,
  t1.score_card_v19 v19,
  t1.score_card_v20 v20,
  t1.score_card_v21 v21,
    
  t1.self_score score,
  t1.self_score_class scoreclass,
  t1.log_time logtime
 FROM weplay.merged_data t1
   WHERE t1.score_card_version = '3.2'  
     AND t1.score_card_version IS NOT NULL
     AND to_date(application_date) >= '2017-09-21'    
     
) st)tt