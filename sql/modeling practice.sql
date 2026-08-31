

-- 새로운 시퀀스 발급하기
SELECT TMDB.TEST_SEQ.NEXTVAL
--	 , TMDB.NO_CYCLE_TEST_SEQ.CURRVAL
	 , TMDB.CACHED_SEQ.NEXTVAL
  FROM DUAL
;

-- 시퀀스들의 현재값 출력해보기
SELECT TMDB.TEST_SEQ.CURRVAL
--	 , TMDB.NO_CYCLE_TEST_SEQ.CURRVAL
	 , TMDB.CACHED_SEQ.CURRVAL
  FROM DUAL
;

CREATE SEQUENCE TMDB.SEQ_MV_PK INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CYCLE NOCACHE NOORDER ;

INSERT INTO MV 
 (MV_ID
, TTL
, MV_RTNG
, RNNG_TM
, SMMR
, RLS_DT
, MAIN_PSTR_URL
, FB_URL
, X_URL
, INSTA_URL
, TGLN
, ORGNL_TTL
, PLYNG
, ORGNL_LNGG
, BDGT
, BX_OFFC_RVN)
VALUES 
 (SEQ_MV_PK.NEXTVAL || '-spider-man-brand-new-day'
, '스파이더맨: 브랜드 뉴 데이'
, '12'
, 145
, '4년 전 소중한 사람들을 지키기 위해 모두의 기억에서 사라진 피터 파커. 친절한 이웃 스파이더맨으로서 뉴욕을 지키며 고독한 삶을 살아가던 피터는 어느 날, 예상치 못한 DNA 변이로 인해 통제 불가능한 힘에 사로잡히고 그의 진짜 정체를 알고 있는 적까지 마주하게 된다. 타인의 의식을 조종하는 정체불명의 존재로 인해 모두가 피터를 노리는 적이 될 수 있는 혼란 속에서 피터는 다시 위협에 빠진 MJ와 모두를 지키기 위해 스파이더맨으로 그들 앞에 서게 되는데...'
, TO_DATE('2026/07/29','YYYY/MM/DD')
, 'POSTER-URL'
, 'https://www.facebook.com/SpiderManMovie'
, 'https://x.com/SpiderManMovie'
, 'https://instagram.com/spidermanmovie/'
, '스파이더맨의 새로운 날을 확인하라!'
, 'Spider-Man: Brand New Day'
, '개봉됨'
, '영어'
, 225000000
, 2219901026
 )
;
ROLLBACK;
SELECT *
FROM MV;

SELECT 'sdsdsd-sdsdsdsd'
  FROM DUAL
;

INSERT INTO GNR 
 (GNR_ID
, NM)
VALUES 
 (SEQ_GNR_PK.NEXTVAL || '-science-fiction' 
, 'SF'
 );
INSERT INTO GNR 
 (GNR_ID
, NM)
VALUES 
 (SEQ_GNR_PK.NEXTVAL || '-action' 
, '액션'
 );
INSERT INTO GNR 
 (GNR_ID
, NM)
VALUES 
 (SEQ_GNR_PK.NEXTVAL || '-adventure' 
, '모험'
 );
SELECT *
FROM GNR g ;
CREATE SEQUENCE TMDB.SEQ_GNR_PK INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CYCLE NOCACHE NOORDER ;


INSERT INTO MV_GNR  
 (MV_GNR_ID
, MV_ID
, GNR_ID2)
VALUES 
 ('MG-' || TO_CHAR(SYSDATE,'YYYYMMDD-') || LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0')
, '1-spider-man-brand-new-day'
, '1-science-fiction'
 );
INSERT INTO MV_GNR  
 (MV_GNR_ID
, MV_ID
, GNR_ID2)
VALUES 
 ('MG-' || TO_CHAR(SYSDATE,'YYYYMMDD-') || LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0')
, '1-spider-man-brand-new-day'
, '2-action'
 );
INSERT INTO MV_GNR  
 (MV_GNR_ID
, MV_ID
, GNR_ID2)
VALUES 
 ('MG-' || TO_CHAR(SYSDATE,'YYYYMMDD-') || LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0')
, '1-spider-man-brand-new-day'
, '3-adventure'
 );

SELECT *
FROM MV_GNR;
CREATE SEQUENCE TMDB.SEQ_MV_GNR_PK INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CYCLE NOCACHE NOORDER ;
CREATE SEQUENCE TMDB.SEQ_KYWRD_PK INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CYCLE NOCACHE NOORDER ;


SELECT *
  FROM MV m 
 INNER JOIN MV_GNR mg 
    ON m.MV_ID = mg.MV_ID
 INNER JOIN GNR g
 	ON mg.GNR_ID = g.GNR_ID 
;

ALTER TABLE "MV_GNR" ADD CONSTRAINT "PK_MV_GNR" PRIMARY KEY (
	"MV_GNR_ID"
);
ALTER TABLE MV_GNR DROP CONSTRAINT FK_GNR_TO_MV_GNR_1;
ALTER TABLE MV_GNR RENAME COLUMN GNR_ID TO GNR_ID;
ALTER TABLE MV_GNR ADD CONSTRAINT FK_GNR_TO_MV_GNR_1 
FOREIGN KEY (GNR_ID) REFERENCES GNR(GNR_ID);

INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-insidious-out-of-the-further', '인시디어스: 그들이 넘어왔다', '15', 106, '사후세계의 악령들로부터 딸과 일상을 지키기 위해 사투를 벌이는 이야기', TO_DATE('2026/08/20','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/InsidiousMovie', 'https://x.com/InsidiousMovie', 'https://instagram.com/insidiousmovie/', '악의 문이 열렸다', 'Insidious: Out of the Further', '개봉됨', '영어', 18000000, 62207464 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-spider-man-no-way-home', '스파이더맨: 노 웨이 홈', '12', 148, '미스테리오의 계략으로 세상에 정체가 탄로난 스파이더맨 피터 파커는 하루 아침에 평범한 일상을 잃게 된다. 문제를 해결하기 위해 닥터 스트레인지를 찾아가 도움을 청하지만 뜻하지 않게 멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다. 닥터 옥토퍼스를 비롯해 스파이더맨에게 깊은 원한을 가진 숙적들의 강력한 공격에 피터 파커는 사상 최악의 위기를 맞게 되는데…', TO_DATE('2021/12/15','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/SpiderManMovie', 'https://x.com/spidermanmovie', 'https://instagram.com/spidermanmovie/', '무너진 세계, 차원을 뛰어넘는 위협', 'Spider-Man: No Way Home', '개봉됨', '영어', 200000000, 1921426073 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL, '헌트', '15', 131, '북한 고위 관리가 망명을 요청한 이후, 안기부 해외팀 차장 박평호와 국내팀 차장 김정도는 동림으로 알려진 안기부 내 스파이, 남파간첩 총책임자를 밝혀내는 임무를 맡는다. 이윽고 동림이 국가 안보를 위태롭게 할 1급 비밀 정보를 누설하기 시작하고 안기부의 해외팀과 국내팀은 서로를 조사하기에 이른다. 당장 스파이를 밝혀내지 못하면 자신이 혐의를 받을 수 있는 일촉즉발의 상황에서 평호와 정도는 서서히 진실을 찾아내고, 마침내 대한민국 1호 암살 작전이라는 거대한 사건과 직면하게 되는데...', TO_DATE('2022/08/10','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/huntofficialmovie', 'https://x.com/huntthemovie', 'https://instagram.com/huntthemovie/', '조직 내 침투한 스파이를 색출하라', NULL, '개봉됨', '한국어', 17000000, 25994 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-the-odyssey', '오디세이', '15', 173, '10년간 이어진 트로이 전쟁을 승리로 이끈 영웅 ''오디세우스''는 왕의 부재를 틈타 침탈과 권력 다툼이 벌어진 왕국에서 그를 기다리고 있는 아내 ''페넬로페''와 아들 ''텔레마코스''에게 돌아가기 위한 여정에 나선다. 그러나 신들의 분노를 산 그의 귀환 앞에는 거대한 폭풍과 괴물들, 그리고 거스를 수 없는 운명의 시련이 기다리고 있는데…', TO_DATE('2026/08/05','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/OdysseyMovie', 'https://x.com/odysseymovie', 'https://instagram.com/theodysseymovie/', '신에 맞서다', 'The Odyssey', '개봉됨', '영어', 250000000, 1446194550 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-the-dark-knight', '다크 나이트', '15', 152, '범죄와 부정부패를 제거하여 고담시를 지키려는 배트맨. 그는 짐 고든 형사와 패기 넘치는 고담시 지방 검사 하비 덴트와 함께 도시를 범죄 조직으로부터 영원히 구원하고자 한다. 세 명의 의기투합으로 위기에 처한 악당들이 모인 자리에 보라색 양복을 입고 얼굴에 짙게 화장을 한 괴이한 존재가 나타나 배트맨을 죽이자는 사상 초유의 제안을 한다. 그는 바로 어떠한 룰도, 목적도 없는 사상 최악의 악당 미치광이 살인광대 조커. 배트맨을 죽이고 고담시를 끝장내버리기 위한 조커의 광기 어린 행각에 도시는 혼란에 빠지는데...', TO_DATE('2008/08/06','YYYY/MM/DD'), 'POSTER_URL', NULL, NULL, NULL, '이 도시에 정의는 죽었다', 'The Dark Knight', '개봉됨', '영어', 185000000, 1004558444 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-green-lantern', '그린 랜턴: 반지의 선택', '12', 114, '머나먼 은하계에는 무한한 힘을 지닌 반지로 지구를 포함한 총 3600개 섹터로 구분된 행성들을 수호하는 그린랜턴 군단이 존재하고 있었다. 그러나 우주의 빛이 사라지고 강력해진 악의 기운으로 최악의 위기가 다가오자, 그린랜턴의 수장은 지구에 불시착해 그의 파워 링이 선택하는 대로 할 조던을 후계자로 맞는다. 그린랜턴의 집결지인 오아 행성으로 불려온 할 조던은 훈련을 통해 섹터 2814의 지구를 담당하게 된다. 그 사이, 모든 생명체들을 파괴시킬 가장 어두운 밤이 오리라는 예언이 실현되면서 새롭게 탄생한 악의 존재들 역시 점점 파워를 키워가는데...', TO_DATE('2011/06/16','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/greenlanternmovie', NULL, NULL, '100년의 기다림, 위대한 탄생', 'Green Lantern', '개봉됨', '영어', 200000000, 219851172 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-deadpool', '데드풀', '19', 108, '특수부대 요원 출신의 용병 웨이드 윌슨은 취향과 장난기마저 똑 닮은 바네사를 만나 행복한 나날을 보낸다. 하지만 행복은 광고처럼 짧은 법. 말기 암 선고를 받은 웨이드는 비밀 임상실험에 참여하며 재기를 노린다. 극한의 고문으로 이뤄진 실험 후 웨이드는 암을 치료할뿐더러 무한한 재생 능력을 얻으며 불사의 존재가 된다. 하지만 동시에 부작용으로 호러영화에 어울릴 법한 외양을 갖는다. 스스로 슈트까지 지어 입고 데드풀이 된 웨이드는 자신을 고문한 자를 찾아 제대로 복수한 뒤 당당히 바네사 앞에 나서려 한다.', TO_DATE('2016/02/17','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/DeadpoolMovie', 'https://x.com/deadpoolmovie', 'https://instagram.com/deadpoolmovie/', '마블 역사상 가장 매력 터지는 히어로', 'Deadpool', '개봉됨', '영어', 58000000, 782837347 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-the-dark-knight-rises', '다크 나이트 라이즈', '15', 164, '배트맨이 조커와의 대결을 끝으로 세상에서 모습을 감춘 8년 후, 하비 덴트의 죽음에 대한 책임을 떠안은 배트맨은 모든 것을 희생하며 떠난다. 범죄방지 덴트법으로 인해 한동안 평화가 지속되던 고담시의 파멸을 예고하며 나타난 마스크를 쓴 잔인한 악당, 최강의 적 베인이 등장한다. 베인은 배트맨이 스스로 택한 유배 생활에 종지부를 찍게 하지만, 다시 돌아온 배트맨에게 베인은 만만한 상대가 아니다. 자신을 거부한 사람들의 고통을 지켜볼 것인가, 정의의 수호자로 나설 것인가. 배트맨은 승패를 알 수 없는 마지막 전투를 시작하려 하는데...', TO_DATE('2012/07/19','YYYY/MM/DD'), 'POSTER_URL', NULL, NULL, NULL, '배트맨 vs 베인, 운명을 건 최후의 전투', 'The Dark Knight Rises', '개봉됨', '영어', 250000000, 1081041287 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-venom', '베놈', '15', 112, '진실을 위해서라면 몸을 사리지 않고 사회의 부조리를 취재하는 정의로운 열혈 기자 에디 브록. 거대 기업 라이프 파운데이션의 생체실험에 의혹을 품고 뒤를 쫓던 그는 이들의 사무실에 잠입했다가 실험실에서 외계 생물체 심비오트의 기습 공격을 받게 된다. 심비오트가 숙주의 몸과 정신을 지배할 때 능력을 발휘하는 베놈은 에디의 몸에 기생하며 갖가지 소동을 일으킨다. 한편 비밀리에 인간과 심비오트를 결합해 새로운 생명체를 만들려는 시도를 계속하던 라이프 파운데이션의 회장 드레이크 또한 심비오트의 숙주가 된다.', TO_DATE('2018/10/03','YYYY/MM/DD'), 'POSTER_URL', 'https://www.facebook.com/VenomMovie', 'https://x.com/VenomMovie', 'https://instagram.com/venommovie/', '영웅인가, 악당인가', 'Venom', '개봉됨', '영어', 116000000, 856085151 ); 
INSERT INTO MV(MV_ID, TTL, MV_RTNG, RNNG_TM, SMMR, RLS_DT, MAIN_PSTR_URL, FB_URL, X_URL, INSTA_URL, TGLN, ORGNL_TTL, PLYNG, ORGNL_LNGG, BDGT, BX_OFFC_RVN) VALUES (SEQ_MV_PK.NEXTVAL||'-the-batman-part-ii', '더 배트맨 - 파트 2', '', NULL, 'Sequel to the 2022 film The Batman.', NULL, 'POSTER_URL', 'https://www.facebook.com/TheBatman', 'https://x.com/TheBatman', 'https://instagram.com/thebatman/', NULL, 'The Batman: Part II', '제작 중', '영어', NULL, NULL ); 

SELECT *
  FROM MV
;

INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-horror', '공포');
INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-thriller', '스릴러');
INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-mystery', '미스터리');
INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-drama', '드라마');
INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-fantasy', '판타지');
INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-crime', '범죄');
INSERT INTO GNR(GNR_ID, NM) VALUES (SEQ_GNR_PK.NEXTVAL||'-comedy', '코미디');

SELECT *
  FROM GNR
;

INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-tom-holland', 'PRFL_URL', '톰 홀랜드'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-zendaya', 'PRFL_URL', '젠데이아'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-mark-ruffalo', 'PRFL_URL', '마크 러팔로'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-amelia-eve', 'PRFL_URL', '어밀리아 이브'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-island-austin', 'PRFL_URL', '아일랜드 오스틴'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-lin-shaye', 'PRFL_URL', '린 샤예'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-benedict-cumberbatch', 'PRFL_URL', '베네딕트 컴버배치'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL, 'PRFL_URL', '이정재'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL, 'PRFL_URL', '정우성'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL, 'PRFL_URL', '전혜진'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-stan-lee', 'PRFL_URL', '스탠 리'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-steve-ditko', 'PRFL_URL', '스티브 딧코'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-leigh-whannell', 'PRFL_URL', '리 워넬'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-chris-mckenna', 'PRFL_URL', '크리스 맥케나'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-erik-sommers', 'PRFL_URL', '에릭 소머즈'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-jacob-chase', 'PRFL_URL', 'Jacob Chase'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-david-leslie-johnson-mcgoldrick', 'PRFL_URL', '데이비드 레슬리 존슨 맥골드릭'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-destin-daniel-cretton', 'PRFL_URL', '데스틴 대니얼 크레턴'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-jon-watts', 'PRFL_URL', '존 왓츠'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-jo-seung-hee', 'PRFL_URL', 'Jo Seung-hee'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-emily-garretto', 'PRFL_URL', 'Emily Garretto'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-matt-damon', 'PRFL_URL', '맷 데이먼'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-anne-hathaway', 'PRFL_URL', '앤 해서웨이'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-robert-pattinson', 'PRFL_URL', '로버트 패틴슨'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-christopher-nolan', 'PRFL_URL', '크리스토퍼 놀란'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-bob-kane', 'PRFL_URL', '밥 케인'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-jonathan-nolan', 'PRFL_URL', '조나단 놀란'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-david-s-goyer', 'PRFL_URL', '데이비드 S. 고이어'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-christian-bale', 'PRFL_URL', '크리스찬 베일'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-heath-ledger', 'PRFL_URL', '히스 레저'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-aaron-eckhart', 'PRFL_URL', '에런 엑하트'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-martin-campbell', 'PRFL_URL', '마틴 캠벨'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-michael-goldenberg', 'PRFL_URL', 'Michael Goldenberg'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-marc-guggenheim', 'PRFL_URL', 'Marc Guggenheim'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-michael-green', 'PRFL_URL', 'Michael Green'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-greg-berlanti', 'PRFL_URL', 'Greg Berlanti'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-ryan-reynolds', 'PRFL_URL', '라이언 레이놀즈'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-blake-lively', 'PRFL_URL', '블레이크 라이블리'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-mark-strong', 'PRFL_URL', '마크 스트롱'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-tim-miller', 'PRFL_URL', '팀 밀러'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-paul-wernick', 'PRFL_URL', '폴 워닉'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-rhett-reese', 'PRFL_URL', '렛 리스'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-morena-baccarin', 'PRFL_URL', '모레나 바카린'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-karan-soni', 'PRFL_URL', '카란 소니'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-gary-oldman', 'PRFL_URL', '게리 올드만'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-tom-hardy', 'PRFL_URL', '톰 하디'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-todd-mcfarlane', 'PRFL_URL', 'Todd McFarlane'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-david-michelinie', 'PRFL_URL', 'David Michelinie'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-ruben-fleischer', 'PRFL_URL', '루벤 플레셔'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-scott-rosenberg', 'PRFL_URL', '스콧 로젠버그'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-jeff-pinkner', 'PRFL_URL', '제프 핑크너'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-kelly-marcel', 'PRFL_URL', '켈리 마르셸'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-michelle-williams', 'PRFL_URL', '미셸 윌리엄스'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-riz-ahmed', 'PRFL_URL', '리즈 아메드'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-matt-reeves', 'PRFL_URL', '맷 리브스'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-bill-finger', 'PRFL_URL', '빌 핑거'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-mattson-tomlin', 'PRFL_URL', '맷슨 톰린'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-scarlett-johansson', 'PRFL_URL', '스칼렛 요한슨'); 
INSERT INTO INVLVD(INVLVD_ID, PRFL_URL, NM) VALUES (SEQ_INVLVD_PK.NEXTVAL||'-sebastian-stan', 'PRFL_URL', '세바스찬 스탠'); 

SELECT *
  FROM INVLVD
;

INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-new-york-city', 'new york city'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-secret-identity', 'secret identity'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-hero', 'hero'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-haunted-house', 'haunted house'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-supernatural', 'supernatural'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-cult', 'cult'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-loss-of-loved-one', 'loss of loved one'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-showdown', 'showdown'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-spy', 'spy'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-assassin', 'assassin'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-intelligence', 'intelligence'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-greek-mythology', 'greek mythology'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-trojan-war', 'trojan war'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-ship', 'ship'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-crime-fighter', 'crime fighter'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-anti-hero', 'anti hero'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-transformation', 'transformation'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-superhero', 'superhero'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-based-on-comic', 'based on comic'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-mercenary', 'mercenary'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-burglar', 'burglar'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-san-francisco-california', 'san francisco, california'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-spacecraft', 'spacecraft'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-vigilante', 'vigilante'); 
INSERT INTO KYWRD(KYWRD_ID, KYWRD) VALUES (SEQ_KYWRD_PK.NEXTVAL||'-sequel', 'sequel'); 

SELECT *
  FROM KYWRD
;

INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', '1-science-fiction');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', '3-adventure');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', '4-horror');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', '5-thriller');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '6', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '6', '6-mystery');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '6', '7-drama');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '7-the-odyssey', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '7-the-odyssey', '3-adventure');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '7-the-odyssey', '8-fantasy');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '8-the-dark-knight', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '8-the-dark-knight', '9-crime');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '8-the-dark-knight', '5-thriller');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '9-green-lantern', '1-science-fiction');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '9-green-lantern', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '9-green-lantern', '3-adventure');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '10-deadpool', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '10-deadpool', '3-adventure');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '10-deadpool', '10-comedy');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', '9-crime');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', '7-drama');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', '5-thriller');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '12-venom', '1-science-fiction');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '12-venom', '2-action');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', '6-mystery');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', '7-drama');
INSERT INTO MV_GNR(MV_GNR_ID, MV_ID, GNR_ID) VALUES ('MG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', '9-crime');

SELECT *
  FROM MV_GNR
;

INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '1-tom-holland', '1-spider-man-brand-new-day', 'Peter Parker');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '1-tom-holland', '1-spider-man-brand-new-day', 'Spider-Man');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '2-zendaya', '1-spider-man-brand-new-day', 'MJ');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '3-mark-ruffalo', '1-spider-man-brand-new-day', 'Bruce Banner');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '3-mark-ruffalo', '1-spider-man-brand-new-day', 'Hulk');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '4-amelia-eve', '4-insidious-out-of-the-further', 'Gemma Hall');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '5-island-austin', '4-insidious-out-of-the-further', 'Maya Hall');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '6-lin-shaye', '4-insidious-out-of-the-further', 'Elise Rainier');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '1-tom-holland', '5-spider-man-no-way-home', 'Peter Parker');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '1-tom-holland', '5-spider-man-no-way-home', 'Spider-Man');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '2-zendaya', '5-spider-man-no-way-home', 'MJ');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '7-benedict-cumberbatch', '5-spider-man-no-way-home', 'Doctor Strange');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '8', '6', 'Park Pyong-ho');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '9', '6', 'Kim Jung-do');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '10', '6', 'Bang Ju-kyung');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '22-matt-damon', '7-the-odyssey', 'Odysseus');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '23-anne-hathaway', '7-the-odyssey', 'Penelope');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '24-robert-pattinson', '7-the-odyssey', 'Antinous');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '1-tom-holland', '7-the-odyssey', 'Telemachus');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '30-heath-ledger', '8-the-dark-knight', 'Joker');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '31-aaron-eckhart', '8-the-dark-knight', 'Harvey Dent');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '37-ryan-reynolds', '9-green-lantern', 'Hal Jordan');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '37-ryan-reynolds', '9-green-lantern', 'Green Lantern');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '38-blake-lively', '9-green-lantern', 'Carol Ferris');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '39-mark-strong', '9-green-lantern', 'Sinestro');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '37-ryan-reynolds', '10-deadpool', 'Wade');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '37-ryan-reynolds', '10-deadpool', 'Deadpool');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '43-morena-baccarin', '10-deadpool', 'Vanessa');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '44-karan-soni', '10-deadpool', 'Dopinder');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '29-christian-bale', '11-the-dark-knight-rises', 'Bruce Wayne');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '45-gary-oldman', '11-the-dark-knight-rises', 'Commissioner Gordon');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '46-tom-hardy', '11-the-dark-knight-rises', 'Bane');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '23-anne-hathaway', '11-the-dark-knight-rises', 'Selina');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '46-tom-hardy', '12-venom', 'Eddie Brock');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '46-tom-hardy', '12-venom', 'Venom');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '53-michelle-williams', '12-venom', 'Anne Weying');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '54-riz-ahmed', '12-venom', 'Carlton Drake');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '54-riz-ahmed', '12-venom', 'Riot');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '24-robert-pattinson', '13-the-batman-part-ii', 'Bruce Wayne');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '24-robert-pattinson', '13-the-batman-part-ii', 'The Batman');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '58-scarlett-johansson', '13-the-batman-part-ii', 'Gilda Dent');
INSERT INTO STR(STR_ID, INVLVD_ID, MV_ID, RL) VALUES ('STR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_STR_PK.NEXTVAL,6,'0'), '59-sebastian-stan', '13-the-batman-part-ii', 'Harvey Dent');

SELECT *
  FROM STR
;

INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '11-stan-lee', '1-spider-man-brand-new-day', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '11-stan-lee', '5-spider-man-no-way-home', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '12-steve-ditko', '1-spider-man-brand-new-day', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '12-steve-ditko', '5-spider-man-no-way-home', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '13-leigh-whannell', '4-insidious-out-of-the-further', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '14-chris-mckenna', '1-spider-man-brand-new-day', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '14-chris-mckenna', '5-spider-man-no-way-home', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '15-erik-sommers', '1-spider-man-brand-new-day', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '15-erik-sommers', '5-spider-man-no-way-home', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '16-jacob-chase', '4-insidious-out-of-the-further', '각본', 'Strory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '17-david-leslie-johnson-mcgoldrick', '4-insidious-out-of-the-further', '각본', 'Strory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '18-destin-daniel-cretton', '1-spider-man-brand-new-day', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '19-jon-watts', '5-spider-man-no-way-home', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '16-jacob-chase', '4-insidious-out-of-the-further', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '16-jacob-chase', '4-insidious-out-of-the-further', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '8', '6', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '8', '6', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '20-jo-seung-hee', '6', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '21-emily-garretto', '4-insidious-out-of-the-further', '미술', 'Art Department Coordinator');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '7-the-odyssey', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '7-the-odyssey', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '7-the-odyssey', '제작', 'Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '7-the-odyssey', '음향', 'Songs');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '8-the-dark-knight', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '8-the-dark-knight', '제작', 'Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '8-the-dark-knight', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '8-the-dark-knight', '각본', 'Strory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '26-bob-kane', '8-the-dark-knight', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '27-jonathan-nolan', '8-the-dark-knight', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '28-david-s-goyer', '8-the-dark-knight', '각본', 'Strory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '32-martin-campbell', '9-green-lantern', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '33-michael-goldenberg', '9-green-lantern', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '34-marc-guggenheim', '9-green-lantern', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '34-marc-guggenheim', '9-green-lantern', '각본', 'Screenstory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '35-michael-green', '9-green-lantern', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '35-michael-green', '9-green-lantern', '각본', 'Screenstory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '36-greg-berlanti', '9-green-lantern', '제작', 'Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '36-greg-berlanti', '9-green-lantern', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '36-greg-berlanti', '9-green-lantern', '각본', 'Screenstory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '37-ryan-reynolds', '10-deadpool', '제작', 'Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '40-tim-miller', '10-deadpool', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '41-paul-wernick', '10-deadpool', '제작', 'Executive Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '41-paul-wernick', '10-deadpool', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '42-rhett-reese', '10-deadpool', '제작', 'Executive Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '42-rhett-reese', '10-deadpool', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '11-the-dark-knight-rises', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '11-the-dark-knight-rises', '제작', 'Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '11-the-dark-knight-rises', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '25-christopher-nolan', '11-the-dark-knight-rises', '각본', 'Strory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '26-bob-kane', '11-the-dark-knight-rises', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '27-jonathan-nolan', '11-the-dark-knight-rises', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '28-david-s-goyer', '11-the-dark-knight-rises', '각본', 'Strory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '47-todd-mcfarlane', '12-venom', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '47-todd-mcfarlane', '12-venom', '각본', 'Original Film Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '48-david-michelinie', '12-venom', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '49-ruben-fleischer', '12-venom', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '50-scott-rosenberg', '12-venom', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '50-scott-rosenberg', '12-venom', '각본', 'Screenstrory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '51-jeff-pinkner', '12-venom', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '51-jeff-pinkner', '12-venom', '각본', 'Screenstrory');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '52-kelly-marcel', '12-venom', '제작', 'Executive Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '52-kelly-marcel', '12-venom', '각본', 'Screenplay');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '46-tom-hardy', '12-venom', '제작', 'Executive Producer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '55-matt-reeves', '13-the-batman-part-ii', '연출', 'Director');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '55-matt-reeves', '13-the-batman-part-ii', '각본', 'Writer');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '26-bob-kane', '13-the-batman-part-ii', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '56-bill-finger', '13-the-batman-part-ii', '각본', 'Characters');
INSERT INTO FLMMKR(FLMMKR_ID, INVLVD_ID, MV_ID, PRT, RL) VALUES ('FM-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_FLMMKR_PK.NEXTVAL,6,'0'), '57-mattson-tomlin', '13-the-batman-part-ii', '각본', 'Writer');

SELECT *
  FROM FLMMKR
;

INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '1-new-york-city', '1-spider-man-brand-new-day');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '2-secret-identity', '1-spider-man-brand-new-day');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '3-hero', '1-spider-man-brand-new-day');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '4-haunted-house', '4-insidious-out-of-the-further');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '5-supernatural', '4-insidious-out-of-the-further');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '6-cult', '4-insidious-out-of-the-further');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '1-new-york-city', '5-spider-man-no-way-home');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '7-loss-of-loved-one', '5-spider-man-no-way-home');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '8-showdown', '5-spider-man-no-way-home');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '9-spy', '6');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '10-assassin', '6');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '11-intelligence', '6');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '12-greek-mythology', '7-the-odyssey');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '13-trojan-war', '7-the-odyssey');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '14-ship', '7-the-odyssey');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '15-crime-fighter', '8-the-dark-knight');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '2-secret-identity', '8-the-dark-knight');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '16-anti-hero', '8-the-dark-knight');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '17-transformation', '9-green-lantern');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '18-superhero', '9-green-lantern');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '19-based-on-comic', '9-green-lantern');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '16-anti-hero', '10-deadpool');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '20-mercenary', '10-deadpool');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '18-superhero', '10-deadpool');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '15-crime-fighter', '11-the-dark-knight-rises');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '2-secret-identity', '11-the-dark-knight-rises');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '21-burglar', '11-the-dark-knight-rises');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '16-anti-hero', '12-venom');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '22-san-francisco-california', '12-venom');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '23-spacecraft', '12-venom');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '15-crime-fighter', '13-the-batman-part-ii');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '24-vigilante', '13-the-batman-part-ii');
INSERT INTO MV_KYWRD(MV_KYWRD_ID, KYWRD_ID, MV_ID) VALUES ('MK-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_MV_KYWRD_PK.NEXTVAL,6,'0'), '25-sequel', '13-the-batman-part-ii');

SELECT *
  FROM MV_KYWRD 
;
CREATE SEQUENCE TMDB.SEQ_MV_KYWRD_PK INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999 CYCLE NOCACHE NOORDER ;


INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'https://www.themoviedb.org/video/play?key=Bxe7u3gm6Sc');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'https://www.themoviedb.org/video/play?key=VyQXAgM9VkQ');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'https://www.themoviedb.org/video/play?key=1DgO-xiLfss');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'https://www.themoviedb.org/video/play?key=yFIGDrlxOZs');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'https://www.themoviedb.org/video/play?key=e55RhEQfszo');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'https://www.themoviedb.org/video/play?key=jxU8FU3o75A');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', 'https://www.themoviedb.org/video/play?key=W7edvITC9g4');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', 'https://www.themoviedb.org/video/play?key=yFZh-Wqi7RI');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '6', 'https://www.themoviedb.org/video/play?key=8naTbkHmMr4');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '6', 'https://www.themoviedb.org/video/play?key=vAUw7ILRpiY');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '6', 'https://www.themoviedb.org/video/play?key=HxThR3wLhXo');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'https://www.themoviedb.org/video/play?key=_n2UiOqW0ZQ');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'https://www.themoviedb.org/video/play?key=B4eyflYKrx0');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'https://www.themoviedb.org/video/play?key=oauTdNtbqdU');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'https://www.themoviedb.org/video/play?key=k6Bg9FROE4o');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '10-deadpool', 'https://www.themoviedb.org/video/play?key=MhylrGLoe2w');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'https://www.themoviedb.org/video/play?key=gXU0eB47YlY');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '12-venom', 'https://www.themoviedb.org/video/play?key=8dKsp_Kswwo');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '12-venom', 'https://www.themoviedb.org/video/play?key=hyetTJz-0AY');
INSERT INTO VD(VD_ID, MV_ID, URL) VALUES ('VD-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_VD_PK.NEXTVAL,6,'0'), '12-venom', 'https://www.themoviedb.org/video/play?key=KI322kD7lNk');

SELECT *
  FROM VD
;

INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '6', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '6', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '6', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '9-green-lantern', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '9-green-lantern', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '9-green-lantern', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '10-deadpool', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '10-deadpool', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '10-deadpool', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '12-venom', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '12-venom', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '12-venom', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', 'BG_URL');
INSERT INTO BCKGRND(BCKGRND_ID, MV_ID, URL) VALUES ('BG-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_BCKGRND_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', 'BG_URL');

SELECT *
  FROM BCKGRND
;

INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '1-spider-man-brand-new-day', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '4-insidious-out-of-the-further', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '5-spider-man-no-way-home', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '6', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '6', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '6', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '7-the-odyssey', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '8-the-dark-knight', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '9-green-lantern', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '9-green-lantern', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '9-green-lantern', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '10-deadpool', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '10-deadpool', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '10-deadpool', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '11-the-dark-knight-rises', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '12-venom', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '12-venom', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '12-venom', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', 'PSTR_URL');
INSERT INTO PSTR(PSTR_ID, MV_ID, URL) VALUES ('PSTR-'||TO_CHAR(SYSDATE,'YYYYMMDD-')||LPAD(SEQ_PSTR_PK.NEXTVAL,6,'0'), '13-the-batman-part-ii', 'PSTR_URL');

SELECT *
  FROM PSTR
;
