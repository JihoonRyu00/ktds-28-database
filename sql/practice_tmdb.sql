-- 260831
-- UPDATE
UPDATE TABLE_NAME
   SET COLUMN_NAME = NEW VALUE
     , COLUMN_NAME = NEW VALUE
 WHERE CONDITION
;

-- 스파이더맨 브랜드 뉴 데이의 관람 등급을 ALL로 변경한다.
UPDATE MV
   SET MV_RTNG = 'ALL'
-- WHERE CONDITION
;

SELECT *
  FROM MV
;

ROLLBACK;

UPDATE MV
   SET MV_RTNG = 'ALL'
 WHERE MV_ID = '1-spider-man-brand-new-day'
;

SELECT *
  FROM MV
;

ROLLBACK;

-- 스파이더맨 브랜드 뉴 데이의 관람등급을 ALL로, 상영시간을 300분으로 변경한다.
UPDATE MV
   SET MV_RTNG = 'ALL'
     , RNNG_TM = 300
 WHERE MV_ID = '1-spider-man-brand-new-day'
;

SELECT *
  FROM MV
;

ROLLBACK;

-- 스파이더맨 브랜드 뉴 데이의 관람등급을 ALL로, 상영시간을 300분으로, 제목은 NULL로 변경한다.
UPDATE MV
   SET MV_RTNG = 'ALL'
     , RNNG_TM = 300
     , TTL = NULL
 WHERE MV_ID = '1-spider-man-brand-new-day'
; -- SQL Error [1407] [72000]: ORA-01407: NULL로 ("TMDB"."MV"."TTL")을 업데이트할 수 없습니다

SELECT *
  FROM MV
;

ROLLBACK;

-- 스파이더맨 브랜드 뉴 데이의 관람등급을 ALL로, 상영시간을 300분으로, 제목은 'rbefbvbwsbvebvevvrbefbvbwsbvebvevrbefbvbwsbvebvevrbefbvbwsbvebvevrbefbvbwsbvebvevrbefbvbwsbvebvev'로 변경한다.
UPDATE MV
   SET MV_RTNG = 'ALL'
     , RNNG_TM = 300
     , TTL = 'rbefbvbwsbvebvevvrbefbvbwsbvebvevrbefbvbwsbvebvevrbefbvbwsbvebvevrbefbvbwsbvebvevrbefbvbwsbvebvev'
 WHERE MV_ID = '1-spider-man-brand-new-day'
; -- SQL Error [12899] [72000]: ORA-12899: "TMDB"."MV"."TTL" 열에 대한 값이 너무 큼(실제: 97, 최대값: 40)

SELECT *
  FROM MV
;

ROLLBACK;

-- 스파이더맨 브랜드 뉴 데이의 장르를 SF, 액션, 공포로 변경한다.
UPDATE MV_GNR 
   SET GNR_ID = '4-horror'
 WHERE MV_ID = '1-spider-man-brand-new-day'
   AND GNR_ID = '3-adventure'
;

SELECT *
  FROM MV_GNR
;

ROLLBACK;

-- DELETE
-- 1. 실무에서는 데이터가 자산이기 떄문에 절대 delete는 사용하지 않고 개인정보 보호를 위해 update만 한다.
-- 2. 사용자 로그 등을 보존해야한다.
-- 3. 지우기가 힘들다. (제약 등)
DELETE 
  FROM TABLE_NAME
 WHERE CONDITION
;

DELETE 
  FROM MV
; -- SQL Error [2292] [23000]: ORA-02292: 무결성 제약조건(TMDB.FK_MV_TO_STR_1)이 위배되었습니다- 자식 레코드가 발견되었습니다

DELETE 
  FROM MV_GNR
;

SELECT *
  FROM MV_GNR
;

ROLLBACK;

-- 스파이더맨 브랜드 뉴 데이의 장르를 삭제한다.
DELETE 
  FROM MV_GNR
 WHERE MV_ID = '1-spider-man-brand-new-day'
;

SELECT *
  FROM MV_GNR
;

ROLLBACK;

-- 실무에서는 삭제를 위해 delete가 아닌 update를 사용
-- DEL_YN flag column을 사용함.
ALTER TABLE TMDB.MV ADD DEL_YN CHAR(1 CHAR) DEFAULT 'N' NOT NULL;
COMMENT ON COLUMN TMDB.MV.DEL_YN IS 'N: 삭제 안 됨, Y: 삭제 완료';

-- UPDATE를 이용한 논리적 삭제
UPDATE MV
   SET DEL_YN = 'Y'
 WHERE MV_ID = '1-spider-man-brand-new-day'
;

SELECT *
  FROM MV
 WHERE DEL_YN = 'N'
;


SELECT MV_ID
	 , TTL
	 , MV_RTNG
	 , RNNG_TM
	 , SMMR
	 , TO_CHAR(RLS_DT, 'YYYY-MM-DD') AS RLS_DT 
	 , MAIN_PSTR_URL
	 , FB_URL
	 , X_URL
	 , INSTA_URL
	 , TGLN
	 , ORGNL_TTL
	 , PLYNG
	 , ORGNL_LNGG
	 , BDGT
	 , BX_OFFC_RVN
  FROM MV 
 WHERE DEL_YN = 'N'
   AND MV_ID = :mvId -- '1-spider-man-brand-new-day'
;

SELECT G.GNR_ID 
	 , G.NM
  FROM GNR G
 INNER JOIN MV_GNR MG
 	ON G.GNR_ID = MG.GNR_ID
 WHERE MG.MV_ID = :mvId
;

SELECT M.MV_ID
	 , M.TTL
	 , M.MV_RTNG
	 , M.RNNG_TM
	 , M.SMMR
	 , TO_CHAR(M.RLS_DT, 'YYYY-MM-DD') AS RLS_DT 
	 , M.MAIN_PSTR_URL
	 , M.FB_URL
	 , M.X_URL
	 , M.INSTA_URL
	 , M.TGLN
	 , M.ORGNL_TTL
	 , M.PLYNG
	 , M.ORGNL_LNGG
	 , M.BDGT
	 , M.BX_OFFC_RVN
  FROM MV M
 INNER JOIN MV_GNR MG
 	ON M.MV_ID = MG.MV_ID
 WHERE DEL_YN = 'N'
   AND MG.GNR_ID = :gnrId
;

SELECT K.KYWRD_ID 
	 , k.KYWRD 
  FROM MV_KYWRD MK
 INNER JOIN KYWRD K
 	ON MK.KYWRD_ID = K.KYWRD_ID
 WHERE MK.MV_ID = :mvId
;

SELECT VD_ID 
	 , URL 
  FROM VD
 WHERE MV_ID = :mvId
;

SELECT BCKGRND_ID 
	 , URL 
  FROM BCKGRND 
 WHERE MV_ID = :mvId
;

SELECT PSTR_ID 
	 , URL 
  FROM PSTR 
 WHERE MV_ID = :mvId
;

SELECT STR_ID 
	 , MV_ID 
	 , INVLVD_ID 
	 , RL 
  FROM STR 
 WHERE MV_ID = :mvId
;

SELECT FLMMKR_ID 
	 , MV_ID 
	 , INVLVD_ID 
	 , PRT 
	 , RL
  FROM FLMMKR
 WHERE MV_ID = :mvId
;


SELECT INVLVD_ID 
	 , PRFL_URL 
	 , NM
  FROM INVLVD
 WHERE INVLVD_ID = :invlvdId
;

SELECT I.INVLVD_ID 
	 , I.PRFL_URL 
	 , I.NM 
--	 , S.RL 
  FROM INVLVD I
 INNER JOIN STR S
 	ON I.INVLVD_ID = S.INVLVD_ID
 WHERE S.MV_ID = :mvId
;