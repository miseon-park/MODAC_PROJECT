DROP TABLE BOOKMARK;
DROP TABLE BOARD;
DROP TABLE NATURAL;
DROP TABLE COLLECTION;
DROP TABLE MEMBER;
DROP TABLE REPORT;
DROP TABLE CIRCLE;
DROP TABLE ATTACHMENT;
DROP TABLE USED_PRODUCT;
DROP TABLE CAMP_REVIEW;
DROP TABLE FAQ;
DROP TABLE NOTICE;
DROP TABLE NOTICE_TIP;
DROP TABLE QA;
DROP TABLE CAMP_GRAM;
DROP TABLE CAMP_NATURAL;
DROP TABLE RECIPE;
DROP TABLE REPLY;
DROP TABLE REVIEW_TAG;
DROP TABLE TAG;
DROP TABLE BOARD_LIKE;
DROP TABLE CAMP_INFO;
CREATE SEQUENCE SEQ_RNO
NOCACHE;


--------- ķ���� ��ȣ
CREATE SEQUENCE SEQ_CNO
START WITH 121
NOCACHE;


--------- ��� ��ȣ
CREATE SEQUENCE SEQ_PLYNO
NOCACHE;



--------- ��������, ��������(��ں� �ҽ�) ��ȣ
CREATE SEQUENCE SEQ_NNO
NOCACHE;




--------- ķ���� ����
CREATE SEQUENCE SEQ_TIPNO
NOCACHE;


--------- Q&A �Խ���
CREATE SEQUENCE SEQ_QANO
NOCACHE;



--------- FAQ
CREATE SEQUENCE SEQ_FAQNO
NOCACHE;



--------- ķ���� ����
CREATE SEQUENCE SEQ_REVNO
NOCACHE;



--------- ������ �Խ���
CREATE SEQUENCE SEQ_RECNO
NOCACHE;



--------- ķ�ν�Ÿ�׷�
CREATE SEQUENCE SEQ_STARNO
NOCACHE;


--------- �߰����� �Խ���
CREATE SEQUENCE SEQ_SALENO
NOCACHE;


--------- ���Ƹ� �Խ���
CREATE SEQUENCE SEQ_CIRNO
NOCACHE;



--------- ȸ����ȣ
CREATE SEQUENCE SEQ_MNO
NOCACHE;



--------- �Ű� ����Ʈ ��ȣ
CREATE SEQUENCE SEQ_REPNO
NOCACHE;



--------- ���� �Խ���
CREATE SEQUENCE SEQ_FNO
NOCACHE;












CREATE TABLE MEMBER (
MEMBER_NO VARCHAR2(20) CONSTRAINT MEMBER_PK PRIMARY KEY,
MEMBER_ID VARCHAR2(50) NOT NULL CONSTRAINT MEMBER_ID_UQ UNIQUE,
MEMBER_PWD VARCHAR2(50)NOT NULL,
MEMBER_NAME VARCHAR2(30)NOT NULL,
MEMBER_NIC VARCHAR2(20)NOT NULL,
STATUS CHAR(1) DEFAULT 'N' NOT NULL CHECK(STATUS IN ('Y','N')),
IN_DATE DATE DEFAULT SYSDATE NOT NULL ,
MODI_DATE DATE DEFAULT SYSDATE 
);

ALTER TABLE MEMBER MODIFY STATUS VARCHAR2(1);

CREATE SEQUENCE SEQ_UNO;

COMMENT ON COLUMN MEMBER.MEMBER_NO IS 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN MEMBER.MEMBER_NIC IS 'ȸ�� �г���';
COMMENT ON COLUMN MEMBER.STATUS IS 'Ż�� ����';
COMMENT ON COLUMN MEMBER.IN_DATE IS 'ȸ��������';
COMMENT ON COLUMN MEMBER.MODI_DATE IS 'ȸ������ ������';

CREATE TABLE NATURAL(
    NATURAL_NO VARCHAR2(10) CONSTRAINT NATURAL_NO_PK PRIMARY KEY,
    NATURAL_TYPE VARCHAR2(20) NOT NULL,
    NATURAL_ATTRI VARCHAR2(50) NOT NULL,
    NATURAL_PIC VARCHAR2(1000) NOT NULL
);

COMMENT ON COLUMN natural.natural_no IS '�ɼǰ�����ȣ';
COMMENT ON COLUMN natural.natural_type IS '�ڿ���� �� ���ǽü� ����';
COMMENT ON COLUMN natural.natural_attri IS '�ڿ���� �� ���ǽü� ��Ī';
COMMENT ON COLUMN natural.naturaL_piC IS '���� ����';

CREATE TABLE CAMP_INFO(
LOCATION_1 VARCHAR2(20) NOT NULL,
LOCATION_2 VARCHAR2(20) NOT NULL,
CAMP_NAME VARCHAR2(40) NOT NULL,
ADDRESS VARCHAR2(100) NOT NULL,
CAMP_NO VARCHAR2(20) CONSTRAINT CAMP_NO_PK PRIMARY KEY,
CAMP_CONTENT VARCHAR2(4000) NOT NULL,
CAMP_CALL VARCHAR2(15),
CAMP_WEB VARCHAR2(20)
);

COMMENT ON COLUMN camp_info.location_1 IS '��ü/�� ��ġ';
COMMENT ON COLUMN camp_info.LOCATION_2 IS '��ü/��/�� ��ġ';
COMMENT ON COLUMN camp_info.CAMP_NAME IS 'ķ���� �̸�';
COMMENT ON COLUMN camp_info.ADDRESS IS 'ķ���� �ּ�';
COMMENT ON COLUMN camp_info.CAMP_NO IS 'ķ���� ������ȣ';
COMMENT ON COLUMN camp_info.CAMP_CONTENT IS 'ķ���� ���� ����';
COMMENT ON COLUMN camp_info.CAMP_CALL IS 'ķ���� ��ȭ��ȣ';
COMMENT ON COLUMN camp_info.CAMP_WEB IS 'ķ���� �� ����Ʈ';

CREATE TABLE BOARD(
    BOARD_NO VARCHAR2(10) CONSTRAINT BOARD_NO_PK PRIMARY KEY,
    BOARD_NAME VARCHAR2(50) NOT NULL
);


COMMENT ON COLUMN BOARD.BOARD_NO IS '�Խ��� ��ȣ';
COMMENT ON COLUMN BOARD.BOARD_NAME IS '�Խ��� �̸�';

CREATE TABLE "CAMP_REVIEW" (
    "BOARD_NO"	VARCHAR2(10)		NOT NULL,
	"POST_NO"	VARCHAR2(20)		NOT NULL,
	"POST_TITLE"	VARCHAR2(50)		NOT NULL,
	"POST_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"MEMBER_NO"	VARCHAR2(20)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"TAG_NO"	NUMBER		NOT NULL,
	"STATUS"	VARCHAR2(1)   DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	"REPORT_NO"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "RECIPE" (
    "BOARD_NO"	VARCHAR2(10)		NOT NULL,
	"POST_NO"	VARCHAR2(20)		NOT NULL,
    "POST_TITLE"	VARCHAR2(50)		NOT NULL,
	"POST_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"MEMBER_NO"	VARCHAR2(20)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"TIME"	NUMBER		NOT NULL,
	"DIFFICULTY"	NUMBER		NOT NULL,
	"MAIN_INGRE"	VARCHAR2(100)		NOT NULL,
	"SUB_INGRE"	VARCHAR2(100)		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y', 'N')),
	"REPORT_NO"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "CAMP_GRAM" (
    "BOARD_NO"	VARCHAR2(10)		NOT NULL,
	"POST_NO"	VARCHAR2(20)		NOT NULL,
	"POST_TITLE"	VARCHAR2(50)		NOT NULL,
	"POST_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"MEMBER_NO"	VARCHAR2(20)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y', 'N')) ,
	"REPORT_NO"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "REVIEW_TAG" (
	"POST_NO"	VARCHAR2(20)		NOT NULL,
	"TAG_NO"	NUMBER		NOT NULL
);

CREATE TABLE "BOARD_LIKE" (
	"POST_NO"	VARCHAR2(20)		NOT NULL,
	"MEMBER_NO"	VARCHAR2(20)		NOT NULL
);

CREATE TABLE "TAG" (
	"TAG_NO"	NUMBER		NOT NULL,
	"TAG_NAME"	VARCHAR2(50)		NULL
);

CREATE TABLE "NOTICE" (
   "BOARD_NO"   VARCHAR2(10)      NOT NULL,
   "POST_NO"   VARCHAR2(20)      NOT NULL,
   "NOTICE_TITLE"   VARCHAR2(50)      NOT NULL,
   "NOTICE_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "WRITER"   VARCHAR2(20)   NOT NULL,
   "READ_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "STATUS"   VARCHAR2(1)   DEFAULT 'N'   CHECK("STATUS" IN('Y', 'N')),
   "CATEGORY_NO"   NUMBER   DEFAULT 1   NOT NULL
);

CREATE TABLE "NOTICE_TIP" (
   "BOARD_NO"   VARCHAR2(10)      NOT NULL,
   "POST_NO"   VARCHAR2(20)      NOT NULL,
   "POST_TITLE"   VARCHAR2(50)      NOT NULL,
   "POST_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "WRITER"   VARCHAR2(20)   NOT NULL,
   "URL"   VARCHAR2(1000)      NOT NULL,
   "CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "STATUS"   VARCHAR2(1)   DEFAULT 'N'   CHECK("STATUS" IN('Y', 'N'))
);

CREATE TABLE "QA" (
   "BOARD_NO"   VARCHAR2(10)      NOT NULL,
   "POST_NO"   VARCHAR2(20)      NOT NULL,
   "POST_TITLE"   VARCHAR2(50)      NOT NULL,
   "POST_CONTENT"   VARCHAR2(4000)      NOT NULL,
   "READ_COUNT"   NUMBER   DEFAULT 0   NOT NULL,
   "CREATE_DATE"   DATE   DEFAULT SYSDATE   NOT NULL,
   "STATUS"   VARCHAR2(1)   DEFAULT 'N'   CHECK("STATUS" IN('Y', 'N')),
   "MEMBER_NO"   VARCHAR2(20)      NOT NULL,
   "HIDDEN_POST"   VARCHAR2(1)   DEFAULT 'N'   CHECK("HIDDEN_POST" IN('Y','N')),
   "POST_PWD"   VARCHAR2(20)      NOT NULL
);

CREATE TABLE "FAQ" (
   "BOARD_NO"   VARCHAR2(10)      NOT NULL,
   "POST_NO"   VARCHAR2(20)      NOT NULL,
   "POST_TITLE"   VARCHAR2(50)      NOT NULL,
   "POST_CONTENT"   VARCHAR2(4000)      NOT NULL
);
CREATE TABLE CIRCLE (
	POST_NO	VARCHAR2(10) NOT NULL,
	POST_TITLE	VARCHAR2(20) NOT NULL,
	POST_CONTENT	VARCHAR2(1000) NOT NULL,
	CREATE_DATE	DATE DEFAULT SYSDATE NOT NULL,
	STATUS	VARCHAR2(1)	DEFAULT 'N' CHECK(STATUS IN('Y', 'N')),
	BOARD_NO VARCHAR2(10) NOT NULL,
	MEMBER_NO VARCHAR2(20) NOT NULL,
	REPORT_NO VARCHAR2(20) NOT NULL,
	READ_COUNT NUMBER DEFAULT 0 NOT NULL	
);

CREATE TABLE BOOKMARK(
	MEMBER_NO	VARCHAR2(20)	NOT NULL,
	CAMP_NO	VARCHAR2(20)	NOT NULL
);

CREATE TABLE COLLECTION (
	POST_NO	VARCHAR2(20)	NOT NULL,
	MEMBER_NO	VARCHAR2(20)	NOT NULL,
	BOARD_NO	VARCHAR2(10)	NOT NULL
);

CREATE TABLE ATTACHMENT (
	PHOTO_NO	VARCHAR2(20)	NOT NULL,
	POST_NO	VARCHAR2(20)	NOT NULL,
	ORIGIN_NAME	VARCHAR2(255)	NOT NULL,
	NEW_NAME	VARCHAR2(255)	NOT NULL,
	PATH	VARCHAR2(1000)	NULL,
	UPLOAD_DATE	DATE	DEFAULT SYSDATE NOT NULL,
	STATUS	VARCHAR2(1)	DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	FILE_LEVEL	NUMBER	NULL,
	BOARD_NO	VARCHAR2(10)	NOT NULL
);

CREATE TABLE REPORT (
	REPORT_NO	VARCHAR2(20)	NOT NULL,
	POST_NO	VARCHAR2(20)	NOT NULL,
	REPORT_TITLE	VARCHAR2(50)	NOT NULL,
	REPORT_CONTENT	VARCHAR2(1000)	NOT NULL,
	SENDER_NO	VARCHAR2(20)	NOT NULL,
	RECEIVER_NO	VARCHAR2(20)	NOT NULL,
	CREATE_DATE	DATE	DEFAULT SYSDATE NOT NULL,
	BOARD_NO	VARCHAR2(10)	NOT NULL
);
CREATE TABLE "USED_PRODUCT" (
	"POST_NO"	VARCHAR2(20)		NOT NULL,
	"POST_TITLE"	VARCHAR2(50)		NOT NULL,
	"POST_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N' CHECK(STATUS IN('Y','N')) NOT NULL,
	"SALE"	VARCHAR2(1)	DEFAULT 'Y' CHECK(SALE IN('Y','N')) NOT NULL,
	"REPORT_NO"	VARCHAR2(20)		NOT NULL,
	"MEMBER_NO"	VARCHAR2(20)		NOT NULL,
	"BOARD_NO"	VARCHAR2(10)		NOT NULL
);

CREATE TABLE "CAMP_NATURAL" (
	"CAMP_NO"	VARCHAR2(20)		NOT NULL,
	"NATURAL_NO"	VARCHAR2(10)		NOT NULL
);

CREATE TABLE "REPLY" (
	"REPLY_NO"	VARCHAR2(10)		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(100)		NOT NULL,
	"BOARD_NO"	VARCHAR2(10)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"HIDDEN_REPLY"	VARCHAR2(1)	DEFAULT 'N' CHECK(HIDDEN_REPLY IN('Y','N'))	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N' CHECK(STATUS IN('Y','N')) NULL,
	"WRITER"	VARCHAR2(20)		NOT NULL,
	"POST_NO"	VARCHAR2(20)		NOT NULL
);
ALTER TABLE "CAMP_REVIEW" ADD CONSTRAINT "PK_CAMP_REVIEW" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "RECIPE" ADD CONSTRAINT "PK_RECIPE" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "CAMP_GRAM" ADD CONSTRAINT "PK_CAMP_GRAM" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "REVIEW_TAG" ADD CONSTRAINT "PK_REVIEW_TAG" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "PK_BOARD_LIKE" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "TAG" ADD CONSTRAINT "PK_TAG" PRIMARY KEY (
	"TAG_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
   "POST_NO"
);

ALTER TABLE "NOTICE_TIP" ADD CONSTRAINT "PK_NOTICE_TIP" PRIMARY KEY (
   "POST_NO"
);

ALTER TABLE "QA" ADD CONSTRAINT "PK_QA" PRIMARY KEY (
   "POST_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
   "POST_NO"
);

ALTER TABLE BOOKMARK ADD CONSTRAINT PK_BOOKMARK PRIMARY KEY (
	MEMBER_NO,
	CAMP_NO
);
ALTER TABLE REPORT ADD CONSTRAINT PK_REPORT PRIMARY KEY (
	REPORT_NO
);

ALTER TABLE ATTACHMENT ADD CONSTRAINT PK_ATTACHMENT PRIMARY KEY (
	PHOTO_NO
);

ALTER TABLE CIRCLE ADD CONSTRAINT PK_CIRCLE PRIMARY KEY (
	POST_NO
);
ALTER TABLE COLLECTION ADD CONSTRAINT PK_COLLECTION PRIMARY KEY (
	POST_NO,
	MEMBER_NO
);
ALTER TABLE "USED_PRODUCT" ADD CONSTRAINT "PK_USED_PRODUCT" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "CAMP_NATURAL" ADD CONSTRAINT "PK_CAMP_NATURAL" PRIMARY KEY (
	"CAMP_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"POST_NO"
);

ALTER TABLE "CAMP_REVIEW" ADD CONSTRAINT "FK_BOARD_TO_CAMP_REVIEW_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "CAMP_REVIEW" ADD CONSTRAINT "FK_REPORT_TO_CAMP_REVIEW_1" FOREIGN KEY (
	"REPORT_NO"
)
REFERENCES "REPORT" (
	"REPORT_NO"
);

ALTER TABLE "CAMP_REVIEW" ADD CONSTRAINT "FK_REPLY_TO_CAMP_REVIEW_1" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "REPLY" (
	"POST_NO"
);

ALTER TABLE "CAMP_REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_CAMP_REVIEW_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CAMP_REVIEW" ADD CONSTRAINT "FK_REVIEW_TAG_TO_CAMP_REVIEW_1" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "REVIEW_TAG" (
	"POST_NO"
);

ALTER TABLE "REVIEW_TAG" ADD CONSTRAINT "FK_TAG_TO_REVIEW_TAG_1" FOREIGN KEY (
	"TAG_NO"
)
REFERENCES "TAG" (
	"TAG_NO"
);



ALTER TABLE "RECIPE" ADD CONSTRAINT "FK_BOARD_TO_RECIPE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "RECIPE" ADD CONSTRAINT "FK_REPORT_TO_RECIPE_1" FOREIGN KEY (
	"REPORT_NO"
)
REFERENCES "REPORT" (
	"REPORT_NO"
);

ALTER TABLE "RECIPE" ADD CONSTRAINT "FK_REPLY_TO_RECIPE_1" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "REPLY" (
	"POST_NO"
);

ALTER TABLE "RECIPE" ADD CONSTRAINT "FK_MEMBER_TO_RECIPE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);





ALTER TABLE "CAMP_GRAM" ADD CONSTRAINT "FK_BOARD_TO_CAMP_GRAM_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "CAMP_GRAM" ADD CONSTRAINT "FK_REPORT_TO_CAMP_GRAM_1" FOREIGN KEY (
	"REPORT_NO"
)
REFERENCES "REPORT" (
	"REPORT_NO"
);

ALTER TABLE "CAMP_GRAM" ADD CONSTRAINT "FK_REPLY_TO_CAMP_GRAM_1" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "REPLY" (
	"POST_NO"
);

ALTER TABLE "CAMP_GRAM" ADD CONSTRAINT "FK_MEMBER_TO_CAMP_GRAM_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);


ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_CAMP_GRAM_TO_BOARD_LIKE_1" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "CAMP_GRAM" (
	"POST_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_BOARD_TO_NOTICE" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "NOTICE_TIP" ADD CONSTRAINT "FK_BOARD_TO_NOTICE_TIP" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "QA" ADD CONSTRAINT "FK_BOARD_TO_QA" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "QA" ADD CONSTRAINT "FK_MEMBER_TO_QA" FOREIGN KEY (
    "MEMBER_NO"
)
REFERENCES "MEMBER" (
    "MEMBER_NO"
);

ALTER TABLE "QA" ADD CONSTRAINT "FK_REPLY_TO_QA" FOREIGN KEY (
    "POST_NO"
)
REFERENCES "REPLY" (
    "POST_NO"
);


ALTER TABLE "FAQ" ADD CONSTRAINT "FK_BOARD_TO_FAQ" FOREIGN KEY (
   "BOARD_NO"
)
REFERENCES "BOARD" (
   "BOARD_NO"
);

ALTER TABLE "USED_PRODUCT" ADD CONSTRAINT "FK_REPORT_TO_USED_PRODUCT_1" FOREIGN KEY (
	"REPORT_NO"
)
REFERENCES "REPORT" (
	"REPORT_NO"
);

ALTER TABLE "USED_PRODUCT" ADD CONSTRAINT "FK_MEMBER_TO_USED_PRODUCT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "USED_PRODUCT" ADD CONSTRAINT "FK_BOARD_TO_USED_PRODUCT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "USED_PRODUCT" ADD CONSTRAINT "FK_REPLY_TO_REPLY_9" FOREIGN KEY (
	"POST_NO"
)
REFERENCES "REPLY" (
	"POST_NO"
);

ALTER TABLE "CAMP_NATURAL" ADD CONSTRAINT "FK_CAMP_INFO_TO_CAMP_NATURAL_1" FOREIGN KEY (
	"CAMP_NO"
)
REFERENCES "CAMP_INFO" (
	"CAMP_NO"
);

ALTER TABLE "CAMP_NATURAL" ADD CONSTRAINT "FK_NATURAL_TO_CAMP_NATURAL_1" FOREIGN KEY (
	"NATURAL_NO"
)
REFERENCES "NATURAL" (
	"NATURAL_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY (
	"WRITER"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARD_TO_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);






ALTER TABLE REPORT ADD CONSTRAINT FK_BOARD_TO_REPORT_1 FOREIGN KEY (
	BOARD_NO
)
REFERENCES BOARD (
	BOARD_NO
);

ALTER TABLE ATTACHMENT ADD CONSTRAINT FK_BOARD_TO_ATTACHMENT_1 FOREIGN KEY (
	BOARD_NO
)
REFERENCES BOARD (
	BOARD_NO
);

ALTER TABLE CIRCLE ADD CONSTRAINT FK_BOARD_TO_CIRCLE_1 FOREIGN KEY (
	BOARD_NO
)
REFERENCES BOARD (
	BOARD_NO
);

ALTER TABLE CIRCLE ADD CONSTRAINT FK_MEMBER_TO_CIRCLE_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	MEMBER_NO
);
ALTER TABLE CIRCLE ADD CONSTRAINT FK_REPLY_TO_CIRCLE_1 FOREIGN KEY (
	POST_NO
)
REFERENCES REPLY (
	POST_NO
);
ALTER TABLE CIRCLE ADD CONSTRAINT FK_REPORT_TO_CIRCLE_1 FOREIGN KEY (
	REPORT_NO
)
REFERENCES REPORT (
	REPORT_NO
);
ALTER TABLE COLLECTION ADD CONSTRAINT FK_MEMBER_TO_COLLECTION_1 FOREIGN KEY (
	MEMBER_NO
)
REFERENCES MEMBER (
	MEMBER_NO
);

ALTER TABLE COLLECTION ADD CONSTRAINT FK_BOARD_TO_COLLECTION_1 FOREIGN KEY (
	BOARD_NO
)
REFERENCES BOARD (
	BOARD_NO
);



