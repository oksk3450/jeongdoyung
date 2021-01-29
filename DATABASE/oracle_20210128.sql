--------------------------------------------------------
--  파일이 생성됨 - 목요일-1월-28-2021   
--------------------------------------------------------
DROP SEQUENCE "XE"."SEQ_BNO";
DROP SEQUENCE "XE"."SEQ_RNO";
DROP TABLE "XE"."TBL_ATTACH";
DROP TABLE "XE"."TBL_BOARD";
DROP TABLE "XE"."TBL_BOARD_TYPE";
DROP TABLE "XE"."TBL_MEMBER";
DROP TABLE "XE"."TBL_REPLY";
DROP PROCEDURE "XE"."PROC_BOARD_INSERT";
DROP PROCEDURE "XE"."PROC_MEMBER_INSERT";
DROP FUNCTION "XE"."CUSTOM_AUTH";
DROP FUNCTION "XE"."CUSTOM_HASH";
--------------------------------------------------------
--  DDL for Sequence SEQ_BNO
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."SEQ_BNO"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RNO
--------------------------------------------------------

   CREATE SEQUENCE  "XE"."SEQ_RNO"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table TBL_ATTACH
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_ATTACH" 
   (	"SAVE_FILE_NAME" VARCHAR2(255 BYTE), 
	"REAL_FILE_NAME" VARCHAR2(255 BYTE), 
	"REG_DATE" DATE, 
	"BNO" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "XE"."TBL_ATTACH"."SAVE_FILE_NAME" IS 'UUID로 만들어지는 폴더에 저장되는 파일이름';
   COMMENT ON COLUMN "XE"."TBL_ATTACH"."REAL_FILE_NAME" IS '예, 한글파일명';
   COMMENT ON COLUMN "XE"."TBL_ATTACH"."REG_DATE" IS '등록일시';
   COMMENT ON COLUMN "XE"."TBL_ATTACH"."BNO" IS '부모테이블 게시물 일련번호';
--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_BOARD" 
   (	"BNO" NUMBER(11,0), 
	"BOARD_TYPE" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" CLOB, 
	"WRITER" VARCHAR2(50 BYTE), 
	"REG_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"VIEW_COUNT" NUMBER(11,0), 
	"REPLY_COUNT" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "XE"."TBL_BOARD"."BOARD_TYPE" IS '게시판종류';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."CONTENT" IS '글 내용';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."REG_DATE" IS '등록일시';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."UPDATE_DATE" IS '수정일시';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."VIEW_COUNT" IS '조회수';
   COMMENT ON COLUMN "XE"."TBL_BOARD"."REPLY_COUNT" IS '댓글수';
--------------------------------------------------------
--  DDL for Table TBL_BOARD_TYPE
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_BOARD_TYPE" 
   (	"BOARD_TYPE" VARCHAR2(45 BYTE), 
	"BOARD_NAME" VARCHAR2(45 BYTE), 
	"BOARD_SUN" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_MEMBER
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_MEMBER" 
   (	"USER_ID" VARCHAR2(50 BYTE), 
	"USER_PW" VARCHAR2(255 BYTE), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(100 BYTE), 
	"POINT" NUMBER(11,0), 
	"ENABLED" NUMBER(1,0), 
	"LEVELS" VARCHAR2(50 BYTE), 
	"REG_DATE" DATE, 
	"UPDATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_REPLY
--------------------------------------------------------

  CREATE TABLE "XE"."TBL_REPLY" 
   (	"RNO" NUMBER(11,0), 
	"REPLY_TEXT" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REG_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	"BNO" NUMBER(11,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "XE"."TBL_REPLY"."RNO" IS '댓글 일련번호';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."REPLY_TEXT" IS '댓글 내용';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."REPLYER" IS '작성자';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."REG_DATE" IS '등록 일시';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."UPDATE_DATE" IS '수정 일시';
   COMMENT ON COLUMN "XE"."TBL_REPLY"."BNO" IS '부모테이블 게시물 일련번호';
REM INSERTING into XE.TBL_ATTACH
SET DEFINE OFF;
REM INSERTING into XE.TBL_BOARD
SET DEFINE OFF;
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (101,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (102,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (103,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (104,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (105,'notice','ㅁㅁㅁ','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/28','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (106,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (107,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (108,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (109,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (110,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (111,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (112,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (113,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (114,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (115,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (116,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (117,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (118,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (119,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (120,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (121,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (122,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (123,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (124,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (125,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (126,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (127,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (128,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (129,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (130,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (131,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (132,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (133,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (134,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (135,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (136,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (137,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (138,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (139,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (140,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (141,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (142,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (143,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (144,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (145,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (146,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (147,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (148,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (149,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (150,'notice','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (151,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (152,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (153,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (154,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (155,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (156,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (157,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (158,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (159,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (160,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (161,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (162,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (163,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (164,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (165,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (166,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (167,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (168,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (169,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (170,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (171,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (172,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (173,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (174,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (175,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (176,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (177,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (178,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (179,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (180,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (181,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (182,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (183,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (184,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (185,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (186,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (187,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (188,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (189,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (190,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (191,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (192,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (193,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (194,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (195,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (196,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (197,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (198,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (199,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
Insert into XE.TBL_BOARD (BNO,BOARD_TYPE,TITLE,WRITER,REG_DATE,UPDATE_DATE,VIEW_COUNT,REPLY_COUNT) values (200,'gallery','게시물테스트','관리자',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'),null,null);
REM INSERTING into XE.TBL_BOARD_TYPE
SET DEFINE OFF;
Insert into XE.TBL_BOARD_TYPE (BOARD_TYPE,BOARD_NAME,BOARD_SUN) values ('notice','공지사항',1);
Insert into XE.TBL_BOARD_TYPE (BOARD_TYPE,BOARD_NAME,BOARD_SUN) values ('gallery','갤러리',2);
REM INSERTING into XE.TBL_MEMBER
SET DEFINE OFF;
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_1','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_2','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_3','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_4','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_5','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_6','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_7','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_8','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_9','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_10','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_11','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_12','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_13','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_14','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_15','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_16','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_17','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_18','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_19','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_20','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_21','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_22','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_23','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_24','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_25','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_26','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_27','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_28','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_29','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_30','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_31','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_32','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_33','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_34','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_35','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_36','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_37','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_38','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_39','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_40','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_41','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_42','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_43','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_44','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_45','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_46','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_47','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_48','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_49','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_50','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_51','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_52','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_53','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_54','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_55','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_56','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_57','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_58','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_59','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_60','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_61','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_62','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_63','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_64','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_65','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_66','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_67','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_68','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_69','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_70','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_71','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_72','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_73','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_74','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_75','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_76','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_77','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_78','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_79','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_80','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_81','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_82','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_83','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_84','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_85','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_86','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_87','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_88','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_89','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_90','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_91','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_92','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_93','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_94','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_95','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_96','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_97','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_98','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('user_99','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_USER',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
Insert into XE.TBL_MEMBER (USER_ID,USER_PW,USER_NAME,EMAIL,POINT,ENABLED,LEVELS,REG_DATE,UPDATE_DATE) values ('admin','$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO','관리자',null,null,1,'ROLE_ADMIN',to_date('21/01/27','RR/MM/DD'),to_date('21/01/27','RR/MM/DD'));
REM INSERTING into XE.TBL_REPLY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index TBL_ATTACH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_ATTACH_PK" ON "XE"."TBL_ATTACH" ("SAVE_FILE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_BOARD_PK" ON "XE"."TBL_BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_BOARD_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_BOARD_TYPE_PK" ON "XE"."TBL_BOARD_TYPE" ("BOARD_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_MEMBER_PK" ON "XE"."TBL_MEMBER" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TBL_REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XE"."TBL_REPLY_PK" ON "XE"."TBL_REPLY" ("RNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure PROC_BOARD_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "XE"."PROC_BOARD_INSERT" 
(
  P_BOARD_TYPE IN VARCHAR2 
, P_COUNT IN NUMBER 
) AS 
BEGIN
  -- 실행방법;쿼리에디터에서 CALL PROC_BOARD_INSERT('notice',50);
  FOR i IN 1..P_COUNT LOOP
        INSERT INTO TBL_BOARD
        (bno,board_type,title,content,writer,reg_date,update_date) 
        VALUES
        (SEQ_BNO.nextval,P_BOARD_TYPE,'게시물테스트','게시물내용테스트','관리자',SYSDATE,SYSDATE);
      END LOOP;
 commit;
END PROC_BOARD_INSERT;


/
--------------------------------------------------------
--  DDL for Procedure PROC_MEMBER_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "XE"."PROC_MEMBER_INSERT" 
(
  P_COUNT IN NUMBER 
, P_ROLE IN VARCHAR2 
) AS 
V_USER varchar2(20):='user';
BEGIN
  if(P_ROLE = 'ROLE_ADMIN') then
    V_USER:='admin'; 
  end if;
  --DELETE FROM TBL_MEMBER WHERE 1 = 1;
  --실행방법: CALL PROC_MEMBER_INSERT(50,'ROLE_ADMIN');
  FOR i IN 1..P_COUNT LOOP
        INSERT INTO TBL_MEMBER
        (user_id,user_pw,user_name,enabled,levels,reg_date,update_date)
        VALUES
        (concat(concat(V_USER,'_'),i) ,'$2a$10$kIqR/PTloYan/MRNiEsy6uYO6OCHVmAKR4kflVKQkJ345nqTiuGeO'
        ,'관리자',1,P_ROLE,sysdate,sysdate);
      END LOOP;
 commit;
END PROC_MEMBER_INSERT;


/
--------------------------------------------------------
--  DDL for Function CUSTOM_AUTH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "XE"."CUSTOM_AUTH" (p_username in VARCHAR2, p_password in VARCHAR2)
return BOOLEAN
is
  l_password varchar2(4000);
  l_stored_password varchar2(4000);
  l_expires_on date;
  l_count number;
begin
-- First, check to see if the user is in the user table
select count(*) into l_count from demo_users where user_name = p_username;
if l_count > 0 then
  -- First, we fetch the stored hashed password & expire date
  select password, expires_on into l_stored_password, l_expires_on
   from demo_users where user_name = p_username;

  -- Next, we check to see if the user's account is expired
  -- If it is, return FALSE
  if l_expires_on > sysdate or l_expires_on is null then

    -- If the account is not expired, we have to apply the custom hash
    -- function to the password
    l_password := custom_hash(p_username, p_password);

    -- Finally, we compare them to see if they are the same and return
    -- either TRUE or FALSE
    if l_password = l_stored_password then
      return true;
    else
      return false;
    end if;
  else
    return false;
  end if;
else
  -- The username provided is not in the DEMO_USERS table
  return false;
end if;
end;


/
--------------------------------------------------------
--  DDL for Function CUSTOM_HASH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "XE"."CUSTOM_HASH" (p_username in varchar2, p_password in varchar2)
return varchar2
is
  l_password varchar2(4000);
  l_salt varchar2(4000) := '8W0YD5BFZ2YYY2X4OBYJJ6LPVOUTGO';
begin

-- This function should be wrapped, as the hash algorhythm is exposed here.
-- You can change the value of l_salt or the method of which to call the
-- DBMS_OBFUSCATOIN toolkit, but you much reset all of your passwords
-- if you choose to do this.

l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5
  (input_string => p_password || substr(l_salt,10,13) || p_username ||
    substr(l_salt, 4,10)));
return l_password;
end;


/
--------------------------------------------------------
--  Constraints for Table TBL_ATTACH
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_ATTACH" MODIFY ("SAVE_FILE_NAME" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_ATTACH" ADD CONSTRAINT "TBL_ATTACH_PK" PRIMARY KEY ("SAVE_FILE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD" MODIFY ("BNO" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD" ADD CONSTRAINT "TBL_BOARD_PK" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_BOARD_TYPE
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_BOARD_TYPE" MODIFY ("BOARD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_BOARD_TYPE" ADD CONSTRAINT "TBL_BOARD_TYPE_PK" PRIMARY KEY ("BOARD_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_MEMBER
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_MEMBER" ADD CONSTRAINT "TBL_MEMBER_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_REPLY" MODIFY ("RNO" NOT NULL ENABLE);
  ALTER TABLE "XE"."TBL_REPLY" ADD CONSTRAINT "TBL_REPLY_PK" PRIMARY KEY ("RNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_ATTACH
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_ATTACH" ADD CONSTRAINT "TBL_ATTACH_TBL_BOARD_FK" FOREIGN KEY ("BNO")
	  REFERENCES "XE"."TBL_BOARD" ("BNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "XE"."TBL_REPLY" ADD CONSTRAINT "TBL_REPLY_TBL_BOARD_FK" FOREIGN KEY ("BNO")
	  REFERENCES "XE"."TBL_BOARD" ("BNO") ENABLE;
