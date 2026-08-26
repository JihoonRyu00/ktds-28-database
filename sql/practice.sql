SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME 
	 , EMAIL
  FROM EMPLOYEES
;

-- DEPARTMENTS 테이블에서
-- DEPARTMENT_ID, MANAGER_ID만 조회
SELECT DEPARTMENT_ID 
     , MANAGER_ID 
  FROM DEPARTMENTS
;

-- COUNTRIES 테이블에서
-- COUNTRY_ID, COUNTRY_NAME, REGION_ID만 조회 
SELECT COUNTRY_ID 
     , COUNTRY_NAME 
     , REGION_ID
  FROM COUNTRIES
;

SELECT *
  FROM COUNTRIES
;


-- 1. 사원의 이름과 성 그리고 급여를 조회한다.
SELECT FIRST_NAME
     , LAST_NAME 
     , SALARY 
  FROM EMPLOYEES
;

-- 2. 부서의 부서장 번호와 부서가 존재하는 지역의 번호를 조회한다.
SELECT DEPARTMENT_ID 
	 , LOCATION_ID 
  FROM DEPARTMENTS
;

-- 3. 국가의 아이디, 이름, 국가가 존재하는 대륙의 번호를 조회한다.
SELECT COUNTRY_ID 
	 , COUNTRY_NAME 
	 , REGION_ID 
  FROM COUNTRIES
;

-- 4. 직무의 이름과 최대급여를 조회한다.
SELECT JOB_TITLE 
     , MAX_SALARY 
  FROM JOBS
;

-- 5. 지역의 도시명과 주소, 우편번호를 조회한다.
SELECT CITY 
	 , STREET_ADDRESS 
	 , POSTAL_CODE 
  FROM LOCATIONS
;

-- 6. 사원의 상사사원번호와 입사일 그리고 연락처를 조회한다.
SELECT MANAGER_ID 
	 , HIRE_DATE 
	 , PHONE_NUMBER 
  FROM EMPLOYEES
;

-- 7. 직무가 변경된 사원의 이전 직무아이디, 이전 직무를 수행한 부서의 아이디, 이전 직무를 시작한 날짜를 조회한다.
SELECT JOB_ID
     , DEPARTMENT_ID 
     , START_DATE 
  FROM JOB_HISTORY
;

-- 8. 대륙의 아이디와 이름을 조회한다.
SELECT REGION_ID 
     , REGION_NAME 
  FROM REGIONS
;


-- 9. 사원의 직무아이디와 부서번호만 조회한다.
SELECT JOB_ID 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
;

-- 10. 사원의 이름, 성, 급여, 입사일, 부서의 이름, 지역의 도시명, 국가명, 대륙의 이름을 조회한다.
SELECT *
  FROM DEPARTMENTS
;

-- 현재 날짜와 시간을 보여준다.
SELECT SYSDATE 
  FROM DUAL
;
-- 현재 날짜에서 하루를 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 1 
  FROM DUAL
;
-- 현재 날짜에서 이틀을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 2 
  FROM DUAL
;
-- 현재 날짜에서 한 달을 더한 날짜와 시간을 보여준다.
SELECT ADD_MONTHS(SYSDATE, 1)  
  FROM DUAL
;
-- 현재 날짜에서 한 달을 뺀 날짜와 시간을 보여준다.
SELECT ADD_MONTHS(SYSDATE, -1)  
  FROM DUAL
;
-- 현재 날짜에서 1년을 더한 날짜와 시간을 보여준다.
SELECT ADD_MONTHS(SYSDATE, 12)  
  FROM DUAL
;
-- 현재 날짜에서 이틀을 뺀 날짜와 시간을 보여준다.
SELECT SYSDATE - 2 
  FROM DUAL
;
-- 현재 날짜에서 하루를 뺸 날짜와 시간을 보여준다.
SELECT SYSDATE - 1 
  FROM DUAL
;
-- 현재 날짜에서 1시간을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 1/24
  FROM DUAL
;
-- 현재 날짜에서 5시간을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 5/24
  FROM DUAL
;
-- 현재 날짜에서 10시간을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 5/12
  FROM DUAL
;
-- 현재 날짜에서 1분을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 1/24/60
  FROM DUAL
;
-- 현재 날짜에서 13분을 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 13/24/60
  FROM DUAL
;
-- 현재 날짜에서 49초를 더한 날짜와 시간을 보여준다.
SELECT SYSDATE + 49/24/60/60
  FROM DUAL
;

-- 현재 날짜와 시간을 "연-월-일 시:분:초" 형식으로 보여준다.
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL
;

-- 모든 사원들의 이름, 성, 급여를 중복 없이 조회한다.
SELECT DISTINCT FIRST_NAME -- DISTINCT는 바로 뒤에 있는 column에만 적용되는 것이 아닌 전체 column 쌍에 적용
     , LAST_NAME 
     , SALARY 
  FROM EMPLOYEES
;

-- 모든 사원들의 급여, 커미션을 중복 없이 조회한다.
SELECT DISTINCT SALARY
     , COMMISSION_PCT 
  FROM EMPLOYEES
;

-- 부서의 이름, 부서장의 번호, 지역의 번호를 조회한다. (부서장 번호 오름차순)
SELECT DEPARTMENT_NAME 
     , MANAGER_ID 
     , LOCATION_ID 
  FROM DEPARTMENTS
 ORDER BY MANAGER_ID ASC
;

-- 부서의 지역의 번호를 중복 없이 조회한다. (지역의 번호 내림차순)
SELECT DISTINCT LOCATION_ID 
  FROM DEPARTMENTS
 ORDER BY LOCATION_ID DESC
;

-- 사원의 급여와 커미션 비율, 이름, 성을 조회한다. (급여 오름차순, 커미션 비율 내림차순)
SELECT SALARY 
     , COMMISSION_PCT 
     , FIRST_NAME 
     , LAST_NAME
  FROM EMPLOYEES
 ORDER BY SALARY ASC
     , COMMISSION_PCT DESC
;

-- 사원 번호가 108인 사원의 사원 번호, 이름, 성을 조회한다.
SELECT EMPLOYEE_ID 
     , FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 108 -- '108'로 해도 작동하지만 query optimizer 실행에 의해 비효율적
; -- WHERE column_name 비교연산자 column_name|value 형식을 따라야 성능 저하가 없음

-- 이름이 'Steven'인 사원의 이름, 성, 급여, 근무부서번호를 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
     , SALARY 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Steven'
;

-- 근무 부서 번호가 50인 사원의 이름, 성, 상사사원번호, 직무 아이디를 조회한다. (상사사원번호 내림차순)
SELECT FIRST_NAME 
     , LAST_NAME 
     , MANAGER_ID 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50
 ORDER BY MANAGER_ID DESC
;

-- 도시의 이름이 'Seattle'인 지역의 지역 번호, 주소, 주, 국가 아이디를 조회한다.
SELECT LOCATION_ID 
     , STREET_ADDRESS 
     , STATE_PROVINCE 
     , COUNTRY_ID 
  FROM LOCATIONS
 WHERE CITY = 'Seattle'
;

-- 101번 사원의 직무변경이력 중 직무 시작일, 직무 종료일, 직무 아이디, 근무 부서 아이디를 조회한다. (직무 시작일 오름차순)
SELECT START_DATE 
	 , END_DATE 
	 , JOB_ID 
	 , DEPARTMENT_ID 
  FROM JOB_HISTORY
 WHERE EMPLOYEE_ID = 101
 ORDER BY START_DATE ASC
;

-- 급여가 10000 이상인 사원의 사원번호, 직무 아이디, 급여, 근무부서 번호를 조회한다. (직무 아이디 오름차순, )
SELECT EMPLOYEE_ID 
     , JOB_ID 
     , SALARY 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE SALARY >= 10000
 ORDER BY 
 ;

-- 커미션 비율이 0.2보다 작은 사원의 급여, 커미션 비율을 조회한다. (급여 오름차순)
SELECT SALARY 
     , COMMISSION_PCT  
  FROM EMPLOYEES
 WHERE COMMISSION_PCT < 0.2
 ORDER BY SALARY ASC
;

-- 근무부서 번호가 50이 아닌 사원들의 부서번호, 직무아이디를 조회한다.
SELECT DEPARTMENT_ID 
     , JOB_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID != 50
;

-- 급여가 8000 이상이면서 커미션을 받는 사원의 급여, 커미션 비율을 조회한다.
SELECT SALARY 
     , COMMISSION_PCT 
  FROM EMPLOYEES
 WHERE SALARY >= 8000 
   AND COMMISSION_PCT IS NOT NULL
;

-- 급여가 10000 이상이거나 커미션을 받는 사원의 급여, 커미션 비율을 조회한다.
SELECT SALARY 
     , COMMISSION_PCT 
  FROM EMPLOYEES
 WHERE SALARY >= 10000 
    OR COMMISSION_PCT IS NOT NULL
;
-- 10, 20, 50번 부서번호에서 근무하는 모든 사원들의 근무부서 번호, 직무 아이디를 조회한다.
SELECT DEPARTMENT_ID 
     , JOB_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (10, 20, 50)
;

-- 급여가 5000 이상 10000 미만이거나 직무 아이디가 IT_PROG인 사원의 급여와 직무 아이디 조회한다.
SELECT SALARY 
     , JOB_ID 
  FROM EMPLOYEES
-- WHERE SALARY >= 5000 
--   AND SALARY < 10000
--    OR JOB_ID = 'IT_PROG'
 WHERE SALARY BETWEEN 5000 AND 10000
   AND SALARY != 10000
    OR JOB_ID = 'IT_PROG'
;

-- 직무 아이디가 IT_PROG, FI_ACCOUNT가 아닌 사원들의 직무 아이디를 중복 없이 조회한다.
SELECT DISTINCT JOB_ID 
  FROM EMPLOYEES
 WHERE JOB_ID NOT IN ('IT_PROG', 'FI_ACCOUNT')
;

-- 급여가 2000 ~ 5000 사이이거나 직무 아이디가 ST_MAN, SA_REP가 아닌 사원들의 급여와 직무 아이디를 조회한다.
SELECT SALARY 
     , JOB_ID 
  FROM EMPLOYEES
-- WHERE SALARY >= 2000 
--   AND SALARY >= 5000
--    OR JOB_ID != 'ST_MAN'
--   AND JOB_ID != 'SA_REP'
 WHERE SALARY BETWEEN 2000 AND 5000
    OR JOB_ID NOT IN ('ST_MAN', 'SA_REP')
;

-- 10, 20, 30, 40번 부서에서 근무하지 않는 사원들의 이름, 근무부서번호를 조회한다.
SELECT FIRST_NAME 
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN (10, 20, 30, 40)
;

-- 이름이 'a'로 끝나는 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%a' 
;
-- 성이 'A'로 시작하는 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE 'A%' 
;
-- 이름과 성에 'e'가 있는(포함되어있는) 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%e%'
   AND LAST_NAME LIKE '%e%'
;
-- 이름 또는 성에 'g'가 있는(포함되어있는) 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%g%'
    OR LAST_NAME LIKE '%g%' 
-- WHERE CONCAT(FIRST_NAME , LAST_NAME ) LIKE '%g%' -- DB CPU 사용량 증가
-- WHERE FIRST_NAME || LAST_NAME LIKE '%g%'-- DB CPU 사용령 증가
;
-- 이름이 5자리인 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_____'
;
-- 이름이 4자리 이상인 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '____%'
;
-- 성이 4자리 이상이며 다섯번째 자리의 글자가 'e'인 사원의 이름과 성을 조회한다.
SELECT FIRST_NAME 
     , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '____e%'
;
-- 도시명이 'S'로 시작하는 도시의 이름을 조회한다.
SELECT CITY
  FROM LOCATIONS
 WHERE CITY LIKE 'S%'
;
-- 부서의 이름에 'r'이 있는(포함되어있는) 부서의 이름을 조회한다.
SELECT DEPARTMENT_NAME 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME LIKE '%r%'
;

-- 전체 사원의 수를 조회한다.
--SELECT COUNT(*) -- 중복 우려 있음
--SELECT COUNT(1) -- 중복 우려 있음
SELECT COUNT( EMPLOYEE_ID ) -- PK를 사용하여 중복 방지
  FROM EMPLOYEES
;
-- 70번 부서에서 근무 중인 사원의 수를 조회한다.
SELECT COUNT( EMPLOYEE_ID )
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 70
;

-- 전체 사원들의 급여 총 합을 조회한다.
SELECT SUM( SALARY )
  FROM EMPLOYEES
;
-- 전체 사원 중 최저 급여를 조회한다.
SELECT MIN( SALARY )
  FROM EMPLOYEES
;
-- 전체 사원 중 최고 급여를 조회한다.
SELECT MAX( SALARY )
  FROM EMPLOYEES
;
-- 전체 사원의 평균 급여를 조회한다.
SELECT AVG( SALARY )
  FROM EMPLOYEES
;
-- 전체 사원 중 가장 일찍 입사한 날짜를 조회한다.
SELECT MIN( HIRE_DATE )
  FROM EMPLOYEES
;
-- 전체 사원 중 가장 늦게 입사한 날짜를 조회한다.
SELECT MAX( HIRE_DATE )
  FROM EMPLOYEES
;
-- 50번 부서에서 근무하는 사원들의 급여 총합을 조회한다.
SELECT SUM( SALARY )
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50
;
-- 60번 부서에서 근무하는 사원들의 평균 급여를 조회한다.
SELECT AVG( SALARY )
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60
;
-- 80번 부서에서 근무하는 사원들의 최고 급여를 조회한다.
SELECT MAX( SALARY )
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 80
;
-- 90번 부서에서 근무하는 사원들의 최저 급여를 조회한다.
SELECT MIN( SALARY )
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
;
SELECT *
  FROM EMPLOYEES
 WHERE SALARY = ( SELECT MIN( SALARY )
                    FROM EMPLOYEES
                   WHERE DEPARTMENT_ID = 90 )
;
-- 100번 부서에서 근무하는 사원들의 최고 급여, 최저 급여, 
-- 가장 일찍 입사한 날짜('YYYY-MM-DD'), 가장 늦게 입사한 날짜('YYYY-MM-DD'), 평균 급여, 급여 총합을 조회한다.
SELECT MAX( SALARY ) AS MAX_SALARY
     , MIN( SALARY ) AS MIN_SALARY
     , TO_CHAR(MIN( HIRE_DATE ), 'YYYY-MM-DD') AS MIN_HIRE_DATE
     , TO_CHAR(MAX( HIRE_DATE ), 'YYYY-MM-DD') AS MAX_HIRE_DATE
     , AVG( SALARY ) AS AVG_SALARY
     , SUM( SALARY ) AS SUM_SALARY
     FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
;
-- 전체 사원들의 최고 급여와 최저 급여의 차를 조회한다.
SELECT MAX( SALARY ) - MIN( SALARY )
  FROM EMPLOYEES
;
-- GROUP BY의 SELECT에는 집계 함수와 GROUP BY에 해당하는 column만 사용 가능
-- 같은 급여를 받는 사원들은 몇 명인지 급여별 사원의 수를 조회한다.
SELECT SALARY
     , COUNT( EMPLOYEE_ID )
  FROM EMPLOYEES
 GROUP BY SALARY 
 ORDER BY SALARY ASC 
;
-- 같은 급여를 받는 사원들은 몇 명인지 급여별 사원의 수를 조회한다. (사원의 수가 1인 경우 제외)
SELECT SALARY
     , COUNT(EMPLOYEE_ID) AS c
  FROM EMPLOYEES
 GROUP BY SALARY 
HAVING COUNT(EMPLOYEE_ID) > 1
 ORDER BY SALARY ASC 
;
-- 직무 아이디별 사원의 수, 급여의 총합, 평균 급여, 최고 급여, 최소 급여, 
--    가장 빠른 입사일, 가장 늦은 입사일을 조회한다.
SELECT JOB_ID 
     , COUNT(EMPLOYEE_ID)
     , SUM(SALARY)
     , AVG(SALARY)
     , MAX(SALARY)
     , MIN(SALARY)
     , MIN(HIRE_DATE)
     , MAX(HIRE_DATE)
  FROM EMPLOYEES
 GROUP BY JOB_ID 
 ORDER BY JOB_ID ASC 
;
-- 부서의 지역번호 별 부서의 개수를 조회한다.
SELECT LOCATION_ID 
     , COUNT (DEPARTMENT_ID)
  FROM DEPARTMENTS
 GROUP BY LOCATION_ID 
 ORDER BY LOCATION_ID 
;
-- 지역의 국가아이디 별 지역의 개수를 조회한다.
SELECT COUNTRY_ID
     , COUNT (LOCATION_ID)
  FROM LOCATIONS
 GROUP BY COUNTRY_ID 
 ORDER BY COUNTRY_ID 
;
-- 부서번호 별 사원의 수, 급여의 총합을 조회한다.
SELECT DEPARTMENT_ID 
     , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 
 ORDER BY DEPARTMENT_ID 
;
-- 부서번호 별 사원의 수, 급여의 총합을 조회한다. (사원의 수가 2 이상이고 급여의 총합이 20000이상인 경우만)
SELECT DEPARTMENT_ID 
     , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 
HAVING COUNT(EMPLOYEE_ID) > 2 AND SUM(SALARY) >= 20000
 ORDER BY DEPARTMENT_ID 
;
-- 평균 급여보다 많은 급여를 받는 사원의 이름, 성, 급여를 조회한다.
-- 1. 특정할 수 없는 데이터는 무엇인지 파악 ==> 평균 급여
SELECT AVG(SALARY)
  FROM EMPLOYEES
;
-- 2. 그 값을 어떤 값과 비교해야하는지 파악
SELECT FIRST_NAME 
     , LAST_NAME
     , SALARY 
  FROM EMPLOYEES
 WHERE SALARY > 6461.831775700934579439252336448598130841
;
-- 3. 합체
SELECT FIRST_NAME 
     , LAST_NAME
     , SALARY 
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
  			       FROM EMPLOYEES)
;
-- IT 부서에서 근무중인 사원들의 부서 번호와 이름을 조회한다.
-- 1
SELECT DEPARTMENT_ID 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME = 'IT' 
;
-- 2
SELECT DEPARTMENT_ID 
     , FIRST_NAME 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60
;
-- 3
SELECT DEPARTMENT_ID 
     , FIRST_NAME 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
  					      FROM DEPARTMENTS
 						 WHERE DEPARTMENT_NAME = 'IT')
;
SELECT DEPARTMENT_ID 
     , FIRST_NAME 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
  					      FROM DEPARTMENTS
 						 WHERE DEPARTMENT_NAME IN ('IT','Shipping'))
;
-- 'Marketing Representative' 이름의 직무를 수행 중인 사원의 직무 아이디, 급여를 조회한다.
-- 1
SELECT JOB_ID 
  FROM JOBS
 WHERE JOB_TITLE = 'Marketing Representative'
;
-- 2
SELECT JOB_ID 
     , SALARY 
  FROM EMPLOYEES
 WHERE JOB_ID = 'MK_REP'
;
-- 3
SELECT JOB_ID
	 , SALARY 
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID 
 				   FROM JOBS
 				  WHERE JOB_TITLE = 'Marketing Representative')	
;
-- 260820
-- 103번 사원이 근무 중인 부서의 이름을 조회한다.
SELECT DEPARTMENT_NAME 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
 						  FROM EMPLOYEES
 						 WHERE EMPLOYEE_ID = 103)
;
-- 118번 사원이 근무 중인 부서의 도시명을 조회한다.
SELECT CITY 
  FROM LOCATIONS
 WHERE LOCATION_ID = (SELECT LOCATION_ID 
						FROM DEPARTMENTS
					   WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
						    				    FROM EMPLOYEES
						 					   WHERE EMPLOYEE_ID = 118))
;
-- 102번 사원이 수행 중인 직무의 이름과 최대 급여, 최소 급여를 조회한다.
SELECT JOB_TITLE 
	 , MAX_SALARY 
     , MIN_SALARY 
  FROM JOBS
 WHERE JOB_ID = (SELECT JOB_ID 
 				   FROM EMPLOYEES
 				  WHERE EMPLOYEE_ID = 102)
;
-- Seattle에 있는 부서의 이름과 부서장의 사원번호를 조회한다.
SELECT DEPARTMENT_NAME 
	 , MANAGER_ID 
  FROM DEPARTMENTS
 WHERE LOCATION_ID = (SELECT LOCATION_ID 
					    FROM LOCATIONS
					   WHERE CITY = 'Seattle')
;
-- Seattle에서 근무 중인 사원들의 직무명을 중복 없이 조회한다.
SELECT DISTINCT JOB_TITLE 
  FROM JOBS
 WHERE JOB_ID IN (SELECT JOB_ID 
					FROM EMPLOYEES
				   WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID 
					   						 FROM DEPARTMENTS
					   						WHERE LOCATION_ID IN (SELECT LOCATION_ID
											   						FROM LOCATIONS
											   					   WHERE CITY = 'Seattle')))
					   						
;
-- Asia에서 근무 중인 사원들의 이름과 성, 부서 번호를 조회한다.
SELECT FIRST_NAME 
	 , LAST_NAME 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID  
						   FROM DEPARTMENTS
						  WHERE LOCATION_ID IN (SELECT LOCATION_ID 
												  FROM LOCATIONS
												 WHERE COUNTRY_ID IN (SELECT COUNTRY_ID  
																	    FROM COUNTRIES
																	   WHERE REGION_ID = (SELECT REGION_ID
																	   					    FROM REGIONS
																	    				   WHERE REGION_NAME = 'Asia'))))
;
-- 80번 부서의 부서장으로 근무하는 사원의 직무명을 조회한다.
SELECT JOB_TITLE 
  FROM JOBS
 WHERE JOB_ID =(SELECT JOB_ID 
				  FROM EMPLOYEES
				 WHERE EMPLOYEE_ID =(SELECT MANAGER_ID 
									   FROM DEPARTMENTS
									  WHERE DEPARTMENT_ID = 80))
;
-- 테이블 조인 연습
-- 사원 테이블 + 부서 테이블 ==> 사원_부서 테이블
SELECT *
  FROM EMPLOYEES
 INNER JOIN DEPARTMENTS 
	ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID 
;
-- 사원의 이름, 성, 급여, 부서장의 사원 번호, 부서명
SELECT E.FIRST_NAME 
	 , E.LAST_NAME 
	 , E.SALARY 
	 , D.MANAGER_ID 
	 , D.DEPARTMENT_NAME 
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
;
-- 사원의 이름, 성, 직무 아이디, 직무 이름, 급여, 최대 급여, 최소 급여
SELECT E.FIRST_NAME 
	 , E.LAST_NAME 
	 , J.JOB_ID -- 중복 칼럼일 경우에는 PK인 칼럼으로 사용
	 , J.JOB_TITLE 
	 , E.SALARY 
	 , J.MAX_SALARY 
	 , J.MIN_SALARY 
  FROM EMPLOYEES E
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID 
;
-- 3개 이상의 테이블 조인
-- 사원 + 부서 + 직무
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
;
-- 사원 + 부서 + 직무 + 지역
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
 INNER JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID 
;
-- 사원 + 부서 + 직무 + 지역 + 국가 + 대륙
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
 INNER JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID 
 INNER JOIN COUNTRIES C
    ON L.COUNTRY_ID = C.COUNTRY_ID 
 INNER JOIN REGIONS R
 	ON C.REGION_ID = R.REGION_ID 
;
-- 직무가 변경된 사원들의 사원 번호, 이름, 급여, 현재 수행중인 직무의 이름, 
-- 과거에 근무했던 부서의 이름, 현재 근무 중인 부서의 이름
SELECT E.EMPLOYEE_ID 
	 , E.FIRST_NAME 
	 , J_CUR.JOB_TITLE 
	 , D_PAST.DEPARTMENT_NAME 
	 , D_CUR.DEPARTMENT_NAME 
  FROM EMPLOYEES E
 INNER JOIN JOBS J_CUR
    ON E.JOB_ID = J_CUR.JOB_ID
 INNER JOIN JOB_HISTORY JH
 	ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
 INNER JOIN DEPARTMENTS D_PAST
 	ON JH.DEPARTMENT_ID = D_PAST.DEPARTMENT_ID
 INNER JOIN DEPARTMENTS D_CUR
 	ON E.DEPARTMENT_ID = D_CUR.DEPARTMENT_ID
;

-- 260821
-- 조인 최적화
SELECT *
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID  
   AND E.EMPLOYEE_ID = 108 -- 조인 최적화
;

-- 직무의 아이디가 AD_VP이거나 부서의 번호가 70번인 사원의 이름, 직무명, 부서명을 조회한다.
SELECT E.FIRST_NAME 
	 , J.JOB_ID 
	 , D.DEPARTMENT_NAME  
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 INNER JOIN JOBS J
 	ON E.JOB_ID = J.JOB_ID 
 WHERE J.JOB_ID = 'AD_VP'
 	OR D.DEPARTMENT_ID = 70
 ;

-- 직무명이 'Administration Vice President'이거나 부서의 번호가 70번인 사원의 이름, 부서명을 조회한다.
SELECT E.FIRST_NAME 
	 , D.DEPARTMENT_NAME 
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 WHERE E.JOB_ID = (SELECT JOB_ID
 					 FROM JOBS
 					WHERE JOB_TITLE = 'Administration Vice President')
 	OR D.DEPARTMENT_ID = 70
;

-- Europe에 근무 중인 모든 사람의 이름과 근무도시를 조회한다.
SELECT E.FIRST_NAME 
	 , L.CITY 
  FROM EMPLOYEES E 
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 INNER JOIN LOCATIONS L
 	ON D.LOCATION_ID = L.LOCATION_ID 
 INNER JOIN COUNTRIES C
 	ON L.COUNTRY_ID = C.COUNTRY_ID 
-- INNER JOIN REGIONS R
-- 	ON C.REGION_ID  = R.REGION_ID 
--   AND R.REGION_NAME = 'Europe' -- 최적화가 안 되어 있음
 WHERE L.COUNTRY_ID IN (SELECT COUNTRY_ID 
 						 FROM COUNTRIES 
 						WHERE REGION_ID IN (SELECT REGION_ID 
 											  FROM REGIONS
 											 WHERE REGION_NAME = 'Europe'))
;-- 출력 데이터는 JOIN이 필수지만 조건을 위한 데이터는 subquery로 해야만 한다.

-- 직무명 별 수행 중인 사원의 수를 조회한다.
SELECT J.JOB_TITLE 
	 , COUNT(E.EMPLOYEE_ID)
  FROM EMPLOYEES E
 INNER JOIN JOBS J
 	ON E.JOB_ID = J.JOB_ID 
 GROUP BY J.JOB_TITLE 
;
-- 직무명 별 수행 중인 사원의 수를 조회한다. 직무명 오름차순 정렬
SELECT J.JOB_TITLE 
	 , COUNT(E.EMPLOYEE_ID)
  FROM EMPLOYEES E
 INNER JOIN JOBS J
 	ON E.JOB_ID = J.JOB_ID 
 GROUP BY J.JOB_TITLE 
 ORDER BY J.JOB_TITLE ASC 
;
-- 직무명 별 수행 중인 사원의 수를 조회한다. 사원의 수 내림차순 정렬
SELECT J.JOB_TITLE 
	 , COUNT(E.EMPLOYEE_ID) AS CNT
  FROM EMPLOYEES E
 INNER JOIN JOBS J
 	ON E.JOB_ID = J.JOB_ID 
 GROUP BY J.JOB_TITLE 
 ORDER BY CNT DESC 
;
--	MENU 임시테이블 만들기
WITH MENU AS (
	SELECT '1000' AS MENU_ID
		 , '브랜드패션' AS MENU_NAME
		 , NULL AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2000' AS MENU_ID
		 , '패션의류/잡화/뷰티' AS MENU_NAME
		 , NULL AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1100' AS MENU_ID
		 , '브랜드의류' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1200' AS MENU_ID
		 , '브랜드잡화' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1300' AS MENU_ID
		 , '스포츠브랜드' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2100' AS MENU_ID
		 , '패션의류' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2200' AS MENU_ID
		 , '잡화' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2300' AS MENU_ID
		 , '뷰티' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1101' AS MENU_ID
		 , '브랜드 여성의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1102' AS MENU_ID
		 , '브랜드 남성의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1103' AS MENU_ID
		 , '브랜드 캐쥬얼의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1201' AS MENU_ID
		 , '브랜드 잡화' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1202' AS MENU_ID
		 , '브랜드 쥬얼리/시계' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1203' AS MENU_ID
		 , '수입명품' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1301' AS MENU_ID
		 , '브랜드 아웃도어' AS MENU_NAME
		 , '1300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1302' AS MENU_ID
		 , '브랜드 스포츠패션' AS MENU_NAME
		 , '1300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2101' AS MENU_ID
		 , '여성의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2102' AS MENU_ID
		 , '남성의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2103' AS MENU_ID
		 , '언더웨어' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2104' AS MENU_ID
		 , '유아동의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2201' AS MENU_ID
		 , '신발' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2202' AS MENU_ID
		 , '가방/잡화' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2203' AS MENU_ID
		 , '유아동 신발/잡화' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2203' AS MENU_ID
		 , '쥬얼리/시계' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2204' AS MENU_ID
		 , '수입명품' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2301' AS MENU_ID
		 , '화장품/향수' AS MENU_NAME
		 , '2300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2302' AS MENU_ID
		 , '바디/헤어' AS MENU_NAME
		 , '2300' AS TOP_MENU_ID
      FROM DUAL
)
-- Recursive Reference Join 을 이용한 계층 데이터 조회
-- 브랜드패션(1000) 메뉴의 하위 메뉴를 조회한다. (1100, 1200, 1300)
--SELECT *
--  FROM MENU
-- WHERE TOP_MENU_ID = 1000
--;
-- 패션의류/잡화/뷰티(2000) 메뉴의 하위 메뉴를 조회한다. (2100, 2200, 2300)
--SELECT *
--  FROM MENU
-- WHERE TOP_MENU_ID = 2000
--;
-- 브랜드잡화(1200) 메뉴의 하위 메뉴를 조회한다. (1201, 1202, 1203)
--SELECT *
--  FROM MENU
-- WHERE TOP_MENU_ID = 1200
--;
-- 유아동 신발/잡화(2203) 메뉴의 하위 메뉴를 조회한다.
--SELECT *
--  FROM MENU
-- WHERE TOP_MENU_ID = 2203
--;
-- 브랜드 캐쥬얼의류(1103) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드의류(1100))
--SELECT M2.MENU_NAME 
--  FROM MENU M1
-- INNER JOIN MENU M2
-- 	ON M1.MENU_ID = 1103
--   AND M1.TOP_MENU_ID = M2.MENU_ID 
--;
-- 브랜드의류(1100) 메뉴의 부모 메뉴의 이 름을 조회한다. (브랜드패션(1000))
--SELECT M2.MENU_NAME 
--  FROM MENU M1
-- INNER JOIN MENU M2
-- 	ON M1.MENU_ID = 1100
--   AND M1.TOP_MENU_ID = M2.MENU_ID 
--;
-- 브랜드패션(1000) 메뉴의 부모 메뉴의 이름을 조회한다.
--SELECT M2.MENU_NAME 
--  FROM MENU M1
-- INNER JOIN MENU M2
-- 	ON M1.MENU_ID = 1000
--   AND M1.TOP_MENU_ID = M2.MENU_ID
--;
-- Recursive Join 을 이용한 계층 데이터 조회
-- 브랜드패션(1000) 메뉴의 하위 메뉴를 조회한다. (1100, 1200, 1300)
-- SELECT MENU_ID 
--	  , MENU_NAME 
--      , TOP_MENU_ID 
--      , LEVEL
--   FROM MENU
----  START WITH MENU_ID = 1000
--  START WITH TOP_MENU_ID IS NULL 
--CONNECT BY PRIOR MENU_ID = TOP_MENU_ID 
--;
-- 패션의류/잡화/뷰티(2000) 메뉴의 하위 메뉴를 조회한다. (2100, 2200, 2300)
-- 브랜드잡화(1200) 메뉴의 하위 메뉴를 조회한다. (1201, 1202, 1203)
-- 유아동 신발/잡화(2203) 메뉴의 하위 메뉴를 조회한다.
-- 브랜드 캐쥬얼의류(1103) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드의류(1100))
 SELECT MENU_ID 
	  , MENU_NAME 
      , TOP_MENU_ID 
      , LEVEL
   FROM MENU
  START WITH MENU_ID = 1103
CONNECT BY PRIOR TOP_MENU_ID = MENU_ID -- == CONNECT BY TOP_MENU_ID = PRIOR MENU_ID
;
-- 브랜드의류(1100) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드패션(1000))
-- 브랜드패션(1000) 메뉴의 부모 메뉴의 이름을 조회한다.

-- 260824
-- 70, 80, 90, 100 번 부서에서 근무중인 사원의 이름과 부서명을 조회한다.
SELECT E.FIRST_NAME
	 , D.DEPARTMENT_NAME
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 WHERE D.DEPARTMENT_ID IN (70, 80, 90, 100)
 ORDER BY D.DEPARTMENT_ID
;
-- INLINE VIEW를 이용한 성능 향상
SELECT E.FIRST_NAME
	 , D.DEPARTMENT_NAME
  FROM (SELECT FIRST_NAME
  	    	 , DEPARTMENT_ID
  		  FROM EMPLOYEES
  		 WHERE DEPARTMENT_ID IN (70, 80, 90, 100) ) E
 INNER JOIN (SELECT DEPARTMENT_ID
 	   			  , DEPARTMENT_NAME
 			   FROM DEPARTMENTS
 			  WHERE DEPARTMENT_ID IN (70, 80, 90, 100) ) D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 ORDER BY D.DEPARTMENT_ID
;

-- 입사 연도별 최고 급여를 조회한다.
SELECT TO_CHAR(HIRE_DATE, 'YYYY')
	 , MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
;
-- INLINE VIEW를 이용한 성능 향상
SELECT SALARY
	 , TO_CHAR(HIRE_DATE, 'YYYY') AS HIRE_YEAR
  FROM EMPLOYEES
;

SELECT HIRE_YEAR
	 , MAX(SALARY)
  FROM (SELECT SALARY
			 , TO_CHAR(HIRE_DATE, 'YYYY') AS HIRE_YEAR
		  FROM EMPLOYEES)
 GROUP BY HIRE_YEAR
 ORDER BY HIRE_YEAR
;

-- 입사 연도별 사원의 수를 조회한다.
SELECT EMPLOYEE_ID
	 , TO_CHAR(HIRE_DATE, 'YYYY') AS HIRE_YEAR
  FROM EMPLOYEES
;
SELECT HIRE_YEAR
	 , COUNT(EMPLOYEE_ID)
  FROM (SELECT EMPLOYEE_ID
			 , TO_CHAR(HIRE_DATE, 'YYYY') AS HIRE_YEAR
		  FROM EMPLOYEES)
 GROUP BY HIRE_YEAR
 ORDER BY HIRE_YEAR
;

-- 사원 이름의 첫 번째 글자만 가져온다. (ANSI X)
SELECT FIRST_NAME
	 , SUBSTR(FIRST_NAME, 1, 1)
  FROM EMPLOYEES
;
-- 사원 이름의 첫 번째 글자별 급여 합계를 조회한다.
SELECT SUBSTR(FIRST_NAME, 1, 1)
	 , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY SUBSTR(FIRST_NAME, 1, 1)
 ORDER BY SUBSTR(FIRST_NAME, 1, 1)
;
-- INLINE VIEW를 이용한 성능 향상
SELECT FIRST_LETTER
	 , SUM(SALARY)
  FROM (SELECT SALARY
  	         , SUBSTR(FIRST_NAME, 1, 1) AS FIRST_LETTER
  	      FROM EMPLOYEES)
 GROUP BY FIRST_LETTER
 ORDER BY FIRST_LETTER ASC
;
-- SALARY별로 Row 순위 구하기 (가장 높은 SALARY가 1등)
-- RANK() OVER() - ANSI
-- 	공동1등 3명, 2등 2명, 3등 3명, 4등 1명 --> 1 1 1 4 4 6 6 6 9
SELECT SALARY
	 , RANK() OVER( ORDER BY SALARY DESC ) AS RANK
  FROM EMPLOYEES
;

-- DENSE_RANK() OVER() - ANSI
-- 	공동1등 3명, 2등 2명, 3등 3명, 4등 1명 --> 1 1 1 2 2 3 3 3 4
SELECT SALARY
	 , DENSE_RANK() OVER( ORDER BY SALARY DESC ) AS RANK
  FROM EMPLOYEES
;

-- ROW_NUMBER() OVER() - ANSI
-- 	공동1등 3명, 2등 2명, 3등 3명, 4등 1명 --> 1 2 3 4 5 6 7 8 9
SELECT SALARY
	 , ROW_NUMBER() OVER( ORDER BY SALARY DESC ) AS RANK
  FROM EMPLOYEES
;
-- ROWNUM - ANSI X
-- 	공동1등 3명, 2등 1명, 3등 3명, 4등 1명 --> 1 2 3 4 5 6 7 8 9

-- [DENSE_]RANK() OVER(), ROW_NUMBER() OVER() 없이 조회.
-- 사원 중 작은 급여를 받는 10명을 조회한다.
SELECT FIRST_NAME
	 , SALARY
--	 , ROWNUM
  FROM (SELECT FIRST_NAME
			 , SALARY
		  FROM EMPLOYEES
		 ORDER BY SALARY ASC)
 WHERE ROWNUM <= 10
;
-- 사원 중 많은 급여를 받는 10명을 조회한다.
SELECT FIRST_NAME
	 , SALARY
  FROM (SELECT FIRST_NAME
		     , SALARY
		  FROM EMPLOYEES
		 ORDER BY SALARY DESC)
 WHERE ROWNUM <= 10
;
-- 많은 급여를 받는 5 ~ 9 번째 사원을 조회한다.   
SELECT FIRST_NAME
	 , SALARY
  FROM (SELECT FIRST_NAME
		     , SALARY
		  FROM EMPLOYEES
		 ORDER BY SALARY DESC)
 WHERE ROWNUM >= 5
   AND ROWNUM <= 9
; -- 불가능

-- 260825
-- 많은 급여를 받는 5 ~ 9 번째 사원을 조회한다.   
SELECT FIRST_NAME
	 , SALARY
	 , RNUM
  FROM (SELECT FIRST_NAME
	 		 , SALARY
	 		 , ROWNUM AS RNUM
  		  FROM (SELECT FIRST_NAME
		     		 , SALARY
		  		  FROM EMPLOYEES
		 		 ORDER BY SALARY DESC)
 		 WHERE ROWNUM <= 9)
 WHERE RNUM >= 5
;

-- 부서 정보(정렬 없음) 중 6번째부터 12번째 까지의 부서 이름을 조회한다.
SELECT DEPARTMENT_NAME 
	 , RNUM
  FROM (SELECT DEPARTMENT_NAME 
  			 , ROWNUM AS RNUM
          FROM DEPARTMENTS
         WHERE ROWNUM <= 12)
 WHERE RNUM >= 6
;

-- 부서장이 있는 부서를 부서명으로 오름차순 정렬한 결과에서 2~7 의 부서명만 조회한다.
SELECT DEPARTMENT_NAME 
	 , RNUM
  FROM (SELECT DEPARTMENT_NAME 
			 , ROWNUM AS RNUM
		  FROM (SELECT DEPARTMENT_NAME 
				  FROM DEPARTMENTS
				 WHERE MANAGER_ID IS NOT NULL
				 ORDER BY DEPARTMENT_NAME ASC)
		 WHERE ROWNUM <= 7)
 WHERE RNUM >= 2
;

-- 커미션을 포함한 급여순으로 사람들을 정렬하고 그 중 7~16의 사원의 이름과 급여를 조회한다.
-- ROWNUM
SELECT FIRST_NAME 
	 , TOTAL_SAL
  FROM (SELECT FIRST_NAME 
			 , TOTAL_SAL
			 , ROWNUM AS RNUM
		  FROM (SELECT FIRST_NAME   
					 , SALARY * (1+NVL(COMMISSION_PCT,0)) AS TOTAL_SAL
				  FROM EMPLOYEES
				 ORDER BY TOTAL_SAL DESC)
		 WHERE ROWNUM <= 16)
 WHERE RNUM >= 7
;
-- ROW_NUMBER()
SELECT FIRST_NAME 
	 , TOTAL_SAL
  FROM (SELECT FIRST_NAME 
			 , TOTAL_SAL
			 , ROW_NUMBER() OVER(ORDER BY TOTAL_SAL DESC) AS RNUM
		  FROM (SELECT FIRST_NAME   
					 , SALARY * (1+NVL(COMMISSION_PCT,0)) AS TOTAL_SAL
				  FROM EMPLOYEES))
 WHERE RNUM >= 7
   AND RNUM <= 16
;
-- Scalar Query
-- 사원의 이름과 직무명을 조회한다. 이때, 직무 테이블은 INNER JOIN하지 않는다.
SELECT E.FIRST_NAME 
	 , E.JOB_ID 
	 , (SELECT J.JOB_TITLE 
	 	  FROM JOBS J
	 	 WHERE J.JOB_ID = E.JOB_ID) 
  FROM EMPLOYEES E -- scalar query의 결과는 반드시 하나의 column과 하나 이하의 row가 되어야 한다.
;
-- 사원의 이름과 부서명을 조회한다. 이때, 부서 테이블은 INNER JOIN하지 않는다.
SELECT E.FIRST_NAME 
	 , E.DEPARTMENT_ID 
	 , (SELECT D.DEPARTMENT_NAME 
	 	  FROM DEPARTMENTS D
	 	 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) 
  FROM EMPLOYEES E
;
-- 사원의 이름과 상사의 이름을 조회한다. 이때, 사원(상사) 테이블은 INNER JOIN하지 않는다.
SELECT E.FIRST_NAME 
	 , E.MANAGER_ID 
	 , (SELECT EM.FIRST_NAME
	 	  FROM EMPLOYEES EM
	 	 WHERE E.MANAGER_ID = EM.EMPLOYEE_ID)
  FROM EMPLOYEES E
;
-- 사원의 이름과 급여, 전체 사원들의 평균 급여를 조회한다.
SELECT E.FIRST_NAME 
	 , E.SALARY 
	 , (SELECT AVG(SALARY)
	 	  FROM EMPLOYEES) AS AVG_SAL
  FROM EMPLOYEES E
; -- scalar query는 각 row 패치마다 실행되기 때문에 row 수만큼 집계가 실행되므로 비효율적 

-- Sub query join
-- 사원이 근무중인 부서에서 최저 급여을 받는 사원의 이름, 급여, 부서번호를 조회한다.
SELECT FIRST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES E1
 WHERE SALARY = (SELECT MIN(SALARY)
 		 		   FROM EMPLOYEES E2
 		 		  WHERE E2.DEPARTMENT_ID = E1.DEPARTMENT_ID)
; -- WHERE에서 FROM의 데이터가 사용될 경우에는 기존 처럼 가장 먼저 단 한 번 실행되는 것이 아닌 fetch 마다 실행됨
-- 사원이 수행중인 직무에서 최저 급여를 받는 사원의 이름, 급여, 직무아이디를 조회한다.
SELECT FIRST_NAME 
	 , SALARY 
	 , JOB_ID 
  FROM EMPLOYEES E1
 WHERE SALARY = (SELECT MIN(SALARY)
 					 FROM EMPLOYEES E2
 					WHERE E2.JOB_ID = E1.JOB_ID)
;
-- 사원이 근무중인 부서에서 부서장으로 근무하는 사원의 이름, 급여, 부서번호를 조회한다.
SELECT FIRST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES E
 WHERE E.EMPLOYEE_ID = (SELECT D.MANAGER_ID 
 		 		          FROM DEPARTMENTS D
 		 		  		 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID)
;
 					
-- Oracle Concat : 복수개의 column을 하나의 column으로 합침, concat 함수는 사용하지 않음
-- 사원의 이름과 성을 한 컬럼으로 조회한다.
SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME
  FROM EMPLOYEES
;
-- 사원의 이름, 사원이 근무중인 부서의 이름, 부서장 사원 번호를 한 컬럼으로 조회한다.
SELECT E.FIRST_NAME || ' ' || D.DEPARTMENT_NAME || ' ' || D.MANAGER_ID AS INFO
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
;
-- 사원의 이름, 사원이 근무중인 부서의 이름과 부서장 사원의 이름을 한 컬럼으로 조회한다. 
SELECT E.FIRST_NAME || ' ' || D.DEPARTMENT_NAME || ' ' || EM.FIRST_NAME AS INFO
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 INNER JOIN EMPLOYEES EM
 	ON D.MANAGER_ID = EM.EMPLOYEE_ID 
;
-- 사원의 이름, 사원이 근무중인 부서의 이름과 부서장 사원의 이름을 한 컬럼으로 조회한다. (scalar query)
SELECT E.FIRST_NAME 
	|| ' ' 
	|| (SELECT D.DEPARTMENT_NAME 
		  FROM DEPARTMENTS D
		 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID)
	|| ' ' 
	|| (SELECT (SELECT E2.FIRST_NAME 
				  FROM EMPLOYEES E2
				 WHERE D.MANAGER_ID = E2.EMPLOYEE_ID)
		  FROM DEPARTMENTS D
		 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID)
	AS INFO
  FROM EMPLOYEES E
;
-- OUTER JOIN
-- 모든 사원들의 이름과 부서의 이름을 조회한다.
--   근무중인 부서가 없다면 null로 조회한다.
SELECT E.FIRST_NAME 
	 , D.DEPARTMENT_NAME 
  FROM EMPLOYEES E
  LEFT OUTER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
;
-- 모든 부서명별 근무중인 사원의 수를 조회한다.
--   근무중인 사원이 없다면 사원의 수를 0으로 조회한다.
SELECT D.DEPARTMENT_NAME
	 , COUNT(E.EMPLOYEE_ID)
  FROM DEPARTMENTS D
  LEFT OUTER JOIN EMPLOYEES E
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 GROUP BY D.DEPARTMENT_NAME 
;
SELECT D.DEPARTMENT_NAME
	 , COUNT(E.EMPLOYEE_ID)
  FROM EMPLOYEES E
 RIGHT OUTER JOIN DEPARTMENTS D
 	ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 GROUP BY D.DEPARTMENT_NAME 
;
-- 모든 도시의 이름과 부서의 이름을 조회한다.
--   존재하는 부서가 없다면 null로 조회한다.
SELECT L.CITY 
	 , D.DEPARTMENT_NAME 
  FROM LOCATIONS L
  LEFT OUTER JOIN DEPARTMENTS D
 	ON L.LOCATION_ID = D.LOCATION_ID
;
-- 모든 국가의 이름과 도시의 이름을 조회한다.
--   존재하는 도시가 없다면 null로 조회한다.
SELECT C.COUNTRY_NAME 
	 , L.CITY 
  FROM COUNTRIES C
  LEFT OUTER JOIN LOCATIONS L
 	ON C.COUNTRY_ID = L.COUNTRY_ID
;
-- 모든 국가별 사원들의 평균 급여를 조회한다.
--   근무하는 사원이 없다면 평균급여를 0으로 조회한다.
SELECT C.COUNTRY_NAME 
	 , T.AVG_SAL
  FROM COUNTRIES C
  LEFT OUTER JOIN (SELECT C2.COUNTRY_ID 
  						, AVG(E.SALARY) AS AVG_SAL
  					 FROM EMPLOYEES E
  					INNER JOIN DEPARTMENTS D
  					   ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
  					INNER JOIN LOCATIONS L
  					   ON D.LOCATION_ID = L.LOCATION_ID 
  					INNER JOIN COUNTRIES C2
  					   ON L.COUNTRY_ID = C2.COUNTRY_ID 
  					GROUP BY C2.COUNTRY_ID) T
 	ON C.COUNTRY_ID = T.COUNTRY_ID 
; 	
SELECT C.COUNTRY_ID 
	 , AVG(E.SALARY) AS AVG_SAL
  FROM EMPLOYEES E
 INNER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
 INNER JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID 
 RIGHT OUTER JOIN COUNTRIES C
    ON L.COUNTRY_ID = C.COUNTRY_ID 
 GROUP BY C.COUNTRY_ID
;
-- 모든 도시의 이름, 도시에 존재하는 부서명, 부서에서 근무중인 사원명, 사원이 수행하는 직무명을 조회
-- 부서명, 사원명, 직무명이 없을 경우 null
SELECT L.CITY 
	 , D.DEPARTMENT_NAME 
	 , E.FIRST_NAME 
	 , J.JOB_TITLE 
  FROM LOCATIONS L
  LEFT OUTER JOIN DEPARTMENTS D
 	ON L.LOCATION_ID = D.LOCATION_ID
  LEFT OUTER JOIN EMPLOYEES E
 	ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
  LEFT OUTER JOIN JOBS J
 	ON E.JOB_ID = J.JOB_ID
; -- 테이블 constraints 보면서 not null을 확인하여 최대한 outer join을 줄여야함
SELECT L.CITY 
	 , D.DEPARTMENT_NAME 
	 , E.FIRST_NAME 
	 , J.JOB_TITLE 
  FROM EMPLOYEES E
 INNER JOIN JOBS J
 	ON E.JOB_ID = J.JOB_ID
 RIGHT OUTER JOIN DEPARTMENTS D
 	ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 RIGHT OUTER JOIN LOCATIONS L
 	ON D.LOCATION_ID = L.LOCATION_ID 
;

-- 260826
SELECT EMPLOYEE_ID 
	 , TRUNC(SALARY/1000)*1000 -- 소수점 drop
  FROM EMPLOYEES
;

SELECT 'A' AS LETTER
	 , 10 AS NUM
	 , LPAD('A',10,'1')
	 , LPAD(10,10,'-')
	 , RPAD('A',10,'1')
	 , RPAD(10,10,'1')
	 , 'ABCDEFGHIJKLMNOP' -- 16자리
	 , LPAD('ABCDEFGHIJKLMNOP',10,'!')
	 , RPAD('ABCDEFGHIJKLMNOP',10,'!')
	 , LPAD('ABCDEFGHIJ',10,'@')
  FROM DUAL
;

-- CASE WHEN ELSE END
-- 비교 연산 (if ~ else if ~ else)
WITH TEMP AS (
	SELECT 'Y' AS FLAG
	  FROM DUAL
	 UNION 
	SELECT 'N'
	  FROM DUAL
	 UNION 
	SELECT 'R'
	  FROM DUAL
	 UNION 
	SELECT NULL
	  FROM DUAL
)
-- TEMP 테이블의 FLAG 칼럼의 값이 'Y'라면 'On'으로 조회하고, 
-- 'R'이라면 'Ready'
-- NULL이라면 'Error'
-- 아니라면 'Off'로 조회한다.
SELECT FLAG
	 , CASE
		 WHEN FLAG = 'Y' THEN
		 	'On'
		 WHEN FLAG = 'R' THEN
		 	'Ready'
		 WHEN FLAG IS NULL THEN
		 	'Error'
		 ELSE
		 	'Off'
	   END || '!' AS ON_OFF
	 , CASE NVL(FLAG,'NULL') -- 같은 칼럼으로 equal 비교 할 때만 칼럼 명시 가능
		 WHEN 'Y' THEN
		 	'On'
		 WHEN 'R' THEN
		 	'Ready'
--		 WHEN NULL THEN
--		 	'Error' -- 불가
--		 WHEN IS NULL THEN
--		 	'Error' -- 불가
		 WHEN 'NULL' THEN
		 	'Error'
		 ELSE
		 	'Off'
	   END || '!' AS ON_OFF
  FROM TEMP
;
WITH NUMBERS AS (
	SELECT 10 AS NUM
	  FROM DUAL
	 UNION
	SELECT 20
	  FROM DUAL
	 UNION
	SELECT 30
	  FROM DUAL
)
-- NUM 값이 30 이상이면 "3", 20 이상이면 "2", 10 이상이면 "1", 아니면 "0" 으로 조회
SELECT NUM
	 , CASE 
		WHEN NUM >= 30 THEN 
			'3'
		WHEN NUM >= 20 THEN 
			'2'
		WHEN NUM >= 10 THEN 
			'1'
		ELSE 
			'0'
	   END AS RESULT
  FROM NUMBERS 
;
-- 1. 사원의 사원 번호, 부서 번호, 근무 현황을 조회
-- 			근무 현황: 근무하는 부서가 있을 경우 '근무 중', 아닐 경우 '발령 대기'
SELECT EMPLOYEE_ID 
	 , DEPARTMENT_ID 
	 , CASE 
	 	WHEN DEPARTMENT_ID IS NULL THEN 
	 		'근무 중'
	 	ELSE 
	 		'발령 대기'
	   END AS "근무 현황"
  FROM EMPLOYEES
;
-- 2. 사원의 사원 번호, 입사일, 입사 순서 조회
-- 			입사 순서: 가장 빨리 입사한 사원은 '원년 사원', 가장 늦게 입사한 사원은 '신규 사원', 아닐 경우 '사원'
SELECT E.EMPLOYEE_ID 
	 , E.HIRE_DATE 
--	 , (SELECT ROWNUM
--	 	  FROM (SELECT ROWNUM
--	 	  			 , EMPLOYEE_ID
--	 	  		  FROM (SELECT EMPLOYEE_ID 
--	 	  		  		  FROM EMPLOYEES
--	 	  		 		 ORDER BY HIRE_DATE ASC)) E_HD
--	 	 WHERE E.EMPLOYEE_ID = E_HD.EMPLOYEE_ID) RANK
  FROM EMPLOYEES E
;

SELECT EMPLOYEE_ID 
	 , HIRE_DATE 
	 , CASE HIRE_DATE 
	 	WHEN HD.MAX_HD THEN 
	 		'신규 사원'
	 	WHEN HD.MIN_HD THEN 
	 		'원년 사원'
	 	ELSE 
	 		'사원'
	   END AS "입사 순서"
  FROM EMPLOYEES 
 CROSS JOIN (SELECT MAX(HIRE_DATE) AS MAX_HD
 				  , MIN(HIRE_DATE) AS MIN_HD
 			   FROM EMPLOYEES) HD -- CROSS JOIN은 거의 쓰지 않음
;
-- UNION	 	: 중복 row 존재 시 중복 제거
-- UNION ALL	: 중복 row 존재 시 중복 유지
-- 집합 간의 모든 칼럼의 수와 타입이 일치해야함
SELECT 1 AS NUM
	 , 'A' AS STR -- 가장 상단 집합의 칼럼명을 따라감 
  FROM DUAL
 UNION
SELECT 2
	 , 'B'
  FROM DUAL
;
SELECT 1 AS NUM
  FROM DUAL
 UNION ALL 
SELECT 2
  FROM DUAL
 UNION ALL 
SELECT *
  FROM (SELECT -1 AS NUM2
  		  FROM DUAL
  		 UNION ALL
  		SELECT 0 AS NUM2
  		  FROM DUAL
  		 UNION ALL
  		 SELECT -7 AS NUM2
  		  FROM DUAL
		  ORDER BY NUM2 ASC)
;
-- 150. 사원번호가 100번인 사원의 사원번호, 이름과 사원번호로 내림차순 정렬된 사원의 사원번호, 이름 조회한다.(중복 제거)
SELECT EMPLOYEE_ID 
	 , FIRST_NAME 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100
 UNION ALL 
 SELECT EMPLOYEE_ID 
 	  , FIRST_NAME FROM(SELECT EMPLOYEE_ID 
							 , FIRST_NAME 
						  FROM EMPLOYEES
						 WHERE EMPLOYEE_ID != 100
						 ORDER BY FIRST_NAME DESC
						 	 , EMPLOYEE_ID DESC)
; -- union은 정렬이 풀림