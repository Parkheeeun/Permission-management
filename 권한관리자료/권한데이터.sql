--2. 권한
CREATE TABLE AUTHES
(
    AUTHID      CHAR(7)         NOT NULL PRIMARY KEY,
    AUTHNAME    VARCHAR2(30)    NOT NULL
    
);

INSERT INTO AUTHES VALUES('AUTH001','전체권한 - 관리자권한');
INSERT INTO AUTHES VALUES('AUTH002','일부권한01');
INSERT INTO AUTHES VALUES('AUTH003','일부권한02');
INSERT INTO AUTHES VALUES('AUTH004','조회권한');

--COMMIT;