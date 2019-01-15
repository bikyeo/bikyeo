-- 회원권한
ALTER TABLE MEMBER_AUTH
    DROP FOREIGN KEY FK_MEMBER_TO_MEMBER_AUTH; -- 회원 -> 회원권한

-- 회원권한
ALTER TABLE MEMBER_AUTH
    DROP FOREIGN KEY FK_AUTH_TO_MEMBER_AUTH; -- 권한 -> 회원권한

-- 게시판
ALTER TABLE BOARD
    DROP FOREIGN KEY FK_BOARDTYPE_TO_BOARD; -- 게시판종류 -> 게시판

-- 게시판
ALTER TABLE BOARD
    DROP FOREIGN KEY FK_MEMBER_TO_BOARD; -- 회원 -> 게시판

-- 댓글
ALTER TABLE REPLY
    DROP FOREIGN KEY FK_BOARD_TO_REPLY; -- 게시판 -> 댓글

-- 댓글
ALTER TABLE REPLY
    DROP FOREIGN KEY FK_MEMBER_TO_REPLY; -- 회원 -> 댓글

-- 댓글
ALTER TABLE REPLY
    DROP FOREIGN KEY FK_REPLY_TO_REPLY; -- 댓글 -> 댓글

-- 자전거대여
ALTER TABLE SHARE
    DROP FOREIGN KEY FK_MEMBER_TO_SHARE; -- 회원 -> 자전거대여

-- 자전거대여
ALTER TABLE SHARE
    DROP FOREIGN KEY FK_PLACE_TO_SHARE; -- 자전거대여소 -> 자전거대여

-- 자전거
ALTER TABLE CYCLE
    DROP FOREIGN KEY FK_PLACE_TO_CYCLE; -- 자전거대여소 -> 자전거

-- 회원
ALTER TABLE MEMBER
    DROP PRIMARY KEY; -- 회원 기본키

-- 권한
ALTER TABLE AUTH
    DROP PRIMARY KEY; -- 권한 기본키

-- 게시판종류
ALTER TABLE BOARDTYPE
    DROP PRIMARY KEY; -- 게시판종류 기본키

-- 게시판
ALTER TABLE BOARD
    DROP PRIMARY KEY; -- 게시판 기본키

-- 댓글
ALTER TABLE REPLY
    DROP PRIMARY KEY; -- 댓글 기본키

-- 자전거대여
ALTER TABLE SHARE
    DROP PRIMARY KEY; -- 자전거대여 기본키

-- 자전거대여소
ALTER TABLE PLACE
    DROP PRIMARY KEY; -- 자전거대여소 기본키

-- 자전거
ALTER TABLE CYCLE
    DROP PRIMARY KEY; -- 자전거 기본키

-- 회원
DROP TABLE IF EXISTS MEMBER RESTRICT;

-- 회원권한
DROP TABLE IF EXISTS MEMBER_AUTH RESTRICT;

-- 권한
DROP TABLE IF EXISTS AUTH RESTRICT;

-- 게시판종류
DROP TABLE IF EXISTS BOARDTYPE RESTRICT;

-- 게시판
DROP TABLE IF EXISTS BOARD RESTRICT;

-- 댓글
DROP TABLE IF EXISTS REPLY RESTRICT;

-- 자전거대여
DROP TABLE IF EXISTS SHARE RESTRICT;

-- 자전거대여소
DROP TABLE IF EXISTS PLACE RESTRICT;

-- 자전거
DROP TABLE IF EXISTS CYCLE RESTRICT;

-- 회원
CREATE TABLE MEMBER (
    m_Email   VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
    m_Pwd     VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
    m_Name    VARCHAR(20)  NOT NULL COMMENT '이름', -- 이름
    m_Gender  INT(1)       NOT NULL COMMENT '성별', -- 성별
    m_Phone   VARCHAR(30)  NOT NULL COMMENT '전화번호', -- 전화번호
    enabled   INT(1)       NOT NULL COMMENT '회원상태', -- 회원상태
    m_Regdate DATETIME     NOT NULL COMMENT '가입일', -- 가입일
    m_Update  DATETIME     NOT NULL DEFAULT now() COMMENT '수정일' -- 수정일
)
COMMENT '회원';

-- 회원
ALTER TABLE MEMBER
    ADD CONSTRAINT PK_MEMBER -- 회원 기본키
        PRIMARY KEY (
            m_Email -- 이메일
        );

-- 회원권한
CREATE TABLE MEMBER_AUTH (
    m_Email VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
    a_Code  INT         NOT NULL COMMENT '권한코드' -- 권한코드
)
COMMENT '회원권한';

-- 권한
CREATE TABLE AUTH (
    a_Code INT         NOT NULL COMMENT '권한코드', -- 권한코드
    a_Name VARCHAR(30) NOT NULL COMMENT '권한명' -- 권한명
)
COMMENT '권한';

-- 권한
ALTER TABLE AUTH
    ADD CONSTRAINT PK_AUTH -- 권한 기본키
        PRIMARY KEY (
            a_Code -- 권한코드
        );

-- 게시판종류
CREATE TABLE BOARDTYPE (
    bt_Num  INT         NOT NULL COMMENT '게시판종류번호', -- 게시판종류번호
    bt_Name VARCHAR(30) NOT NULL COMMENT '게시판종류이름' -- 게시판종류이름
)
COMMENT '게시판종류';

-- 게시판종류
ALTER TABLE BOARDTYPE
    ADD CONSTRAINT PK_BOARDTYPE -- 게시판종류 기본키
        PRIMARY KEY (
            bt_Num -- 게시판종류번호
        );

-- 게시판
CREATE TABLE BOARD (
    b_Num     INT          NOT NULL COMMENT '게시글번호', -- 게시글번호
    bt_Num    INT          NOT NULL COMMENT '게시판종류번호', -- 게시판종류번호
    m_Email   VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
    b_Subject VARCHAR(300) NOT NULL COMMENT '게시글제목', -- 게시글제목
    b_Content LONGTEXT     NOT NULL COMMENT '게시글내용', -- 게시글내용
    b_Img     VARCHAR(300) NULL     COMMENT '사진이름', -- 사진이름
    b_Regdate DATETIME     NOT NULL DEFAULT now() COMMENT '글작성일', -- 글작성일
    b_hit     INT          NOT NULL DEFAULT 0 COMMENT '조회수' -- 조회수
)
COMMENT '게시판';

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT PK_BOARD -- 게시판 기본키
        PRIMARY KEY (
            b_Num -- 게시글번호
        );

ALTER TABLE BOARD
    MODIFY COLUMN b_Num INT NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- 댓글
CREATE TABLE REPLY (
    r_Num     INT          NOT NULL COMMENT '댓글번호', -- 댓글번호
    b_Num     INT          NOT NULL COMMENT '게시글번호', -- 게시글번호
    m_Email   VARCHAR(40)  NOT NULL COMMENT '댓글작성자', -- 댓글작성자
    r_Pnum    INT          NOT NULL COMMENT '댓글부모', -- 댓글부모
    r_Order   INT(1)       NOT NULL COMMENT '댓글순서', -- 댓글순서
    r_Content VARCHAR(300) NOT NULL COMMENT '댓글내용', -- 댓글내용
    r_Regdate DATETIME     NOT NULL DEFAULT now() COMMENT '댓글작성일' -- 댓글작성일
)
COMMENT '댓글';

-- 댓글
ALTER TABLE REPLY
    ADD CONSTRAINT PK_REPLY -- 댓글 기본키
        PRIMARY KEY (
            r_Num -- 댓글번호
        );

ALTER TABLE REPLY
    MODIFY COLUMN r_Num INT NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 자전거대여
CREATE TABLE SHARE (
    s_Num   INT         NOT NULL COMMENT '자전거대여번호', -- 자전거대여번호
    m_Email VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
    p_Num   INT         NOT NULL COMMENT '자전거대여소번호', -- 자전거대여소번호
    s_Sdate DATETIME    NOT NULL COMMENT '대여일', -- 대여일
    s_Pdate DATETIME    NOT NULL COMMENT '반납예정일', -- 반납예정일
    s_Edate DATETIME    NULL     COMMENT '반납일' -- 반납일
)
COMMENT '자전거대여';

-- 자전거대여
ALTER TABLE SHARE
    ADD CONSTRAINT PK_SHARE -- 자전거대여 기본키
        PRIMARY KEY (
            s_Num -- 자전거대여번호
        );

ALTER TABLE SHARE
    MODIFY COLUMN s_Num INT NOT NULL AUTO_INCREMENT COMMENT '자전거대여번호';

-- 자전거대여소
CREATE TABLE PLACE (
    p_Num    INT NOT NULL COMMENT '자전거대여소번호', -- 자전거대여소번호
    p_Holder INT NOT NULL COMMENT '거치대갯수' -- 거치대갯수
)
COMMENT '자전거대여소';

-- 자전거대여소
ALTER TABLE PLACE
    ADD CONSTRAINT PK_PLACE -- 자전거대여소 기본키
        PRIMARY KEY (
            p_Num -- 자전거대여소번호
        );

-- 자전거
CREATE TABLE CYCLE (
    c_Code   VARCHAR(7) NOT NULL COMMENT '자전거번호', -- 자전거번호
    p_Num    INT        NOT NULL COMMENT '자전거대여소번호', -- 자전거대여소번호
    c_Status INT(1)     NOT NULL COMMENT '자전거상태', -- 자전거상태
    c_Move   INT        NOT NULL COMMENT '자전거이동상태' -- 자전거이동상태
)
COMMENT '자전거';

-- 자전거
ALTER TABLE CYCLE
    ADD CONSTRAINT PK_CYCLE -- 자전거 기본키
        PRIMARY KEY (
            c_Code -- 자전거번호
        );

-- 회원권한
ALTER TABLE MEMBER_AUTH
    ADD CONSTRAINT FK_MEMBER_TO_MEMBER_AUTH -- 회원 -> 회원권한
        FOREIGN KEY (
            m_Email -- 이메일
        )
        REFERENCES MEMBER ( -- 회원
            m_Email -- 이메일
        );

-- 회원권한
ALTER TABLE MEMBER_AUTH
    ADD CONSTRAINT FK_AUTH_TO_MEMBER_AUTH -- 권한 -> 회원권한
        FOREIGN KEY (
            a_Code -- 권한코드
        )
        REFERENCES AUTH ( -- 권한
            a_Code -- 권한코드
        );

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT FK_BOARDTYPE_TO_BOARD -- 게시판종류 -> 게시판
        FOREIGN KEY (
            bt_Num -- 게시판종류번호
        )
        REFERENCES BOARDTYPE ( -- 게시판종류
            bt_Num -- 게시판종류번호
        );

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT FK_MEMBER_TO_BOARD -- 회원 -> 게시판
        FOREIGN KEY (
            m_Email -- 이메일
        )
        REFERENCES MEMBER ( -- 회원
            m_Email -- 이메일
        );

-- 댓글
ALTER TABLE REPLY
    ADD CONSTRAINT FK_BOARD_TO_REPLY -- 게시판 -> 댓글
        FOREIGN KEY (
            b_Num -- 게시글번호
        )
        REFERENCES BOARD ( -- 게시판
            b_Num -- 게시글번호
        );

-- 댓글
ALTER TABLE REPLY
    ADD CONSTRAINT FK_MEMBER_TO_REPLY -- 회원 -> 댓글
        FOREIGN KEY (
            m_Email -- 댓글작성자
        )
        REFERENCES MEMBER ( -- 회원
            m_Email -- 이메일
        );

-- 댓글
ALTER TABLE REPLY
    ADD CONSTRAINT FK_REPLY_TO_REPLY -- 댓글 -> 댓글
        FOREIGN KEY (
            r_Pnum -- 댓글부모
        )
        REFERENCES REPLY ( -- 댓글
            r_Num -- 댓글번호
        );

-- 자전거대여
ALTER TABLE SHARE
    ADD CONSTRAINT FK_MEMBER_TO_SHARE -- 회원 -> 자전거대여
        FOREIGN KEY (
            m_Email -- 이메일
        )
        REFERENCES MEMBER ( -- 회원
            m_Email -- 이메일
        );

-- 자전거대여
ALTER TABLE SHARE
    ADD CONSTRAINT FK_PLACE_TO_SHARE -- 자전거대여소 -> 자전거대여
        FOREIGN KEY (
            p_Num -- 자전거대여소번호
        )
        REFERENCES PLACE ( -- 자전거대여소
            p_Num -- 자전거대여소번호
        );

-- 자전거
ALTER TABLE CYCLE
    ADD CONSTRAINT FK_PLACE_TO_CYCLE -- 자전거대여소 -> 자전거
        FOREIGN KEY (
            p_Num -- 자전거대여소번호
        )
        REFERENCES PLACE ( -- 자전거대여소
            p_Num -- 자전거대여소번호
        );