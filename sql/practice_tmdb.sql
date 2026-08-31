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