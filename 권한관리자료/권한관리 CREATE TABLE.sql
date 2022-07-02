
--1. 회원
CREATE TABLE MEMBERS
(
    MID         CHAR(7)         NOT NULL PRIMARY KEY,
    MNAME       VARCHAR2(30)    NOT NULL
);

--2. 권한
CREATE TABLE AUTHES
(
    AUTHID      CHAR(7)         NOT NULL PRIMARY KEY,
    AUTHNAME    VARCHAR2(30)    NOT NULL
    
);

--3 메뉴
CREATE TABLE MENUS
(
    MENUID      CHAR(7)         NOT NULL PRIMARY KEY,
    MENUNAME    VARCHAR2(50)    NOT NULL,
    MENUSEQ     NUMBER(5)       NOT NULL,
    MENULVL     NUMBER(5)       NOT NULL,
    PARENTID    CHAR(7)         NOT NULL
);

--4. 프로그램
CREATE TABLE PROGRAMS
(
    PID         CHAR(7)         NOT NULL,
    MENUID      CHAR(7)         NOT NULL,
    PNAME       VARCHAR2(50)    NOT NULL,
    PFILENAME   VARCHAR2(50)    NOT NULL,
    
    CONSTRAINT PROGRAMS_PK PRIMARY KEY(PID, MENUID)
);

--5.회원별 권한
CREATE TABLE MEMBER_AUTH
(
    MTHID       CHAR(7)         NOT NULL,
    MID         CHAR(7)         NOT NULL,
    AUTHID      CHAR(7)         NOT NULL,
    
    CONSTRAINT MEMBER_AUTH_PK PRIMARY KEY (MTHID, MID, AUTHID)
);

--6.권한별 메뉴
CREATE TABLE AUTH_MENUS
(
    AMID            CHAR(7)         NOT NULL,
    AUTHID          CHAR(7)         NOT NULL,
    MENUID          CHAR(7)         NOT NULL,
    
    --역정규화
    AUTH_SEL        CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_INS        CHAR(1)     DEFAULT 'N'   NOT NULL, 
    AUTH_UP         CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_DEL        CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_FILEUP     CHAR(1)     DEFAULT 'N'   NOT NULL,
    AUTH_FILEDN     CHAR(1)     DEFAULT 'N'   NOT NULL,
    
    CONSTRAINT MEMBER_AUTH_PK PRIMARY KEY (AMID, AUTHID, MENUID)
);



