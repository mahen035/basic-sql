CREATE TABLE PRODUCT (PROD_ID VARCHAR2(6),  PROD_NAME VARCHAR2(10), PROD_DESC VARCHAR2(20), PRICE NUMBER(8,2))

DESC PRODUCT;

ALTER TABLE PRODUCT ADD PRIMARY KEY(PROD_ID);

ALTER TABLE PRODUCT MODIFY PRICE NOT NULL;

INSERT INTO PRODUCT (PROD_ID, PROD_NAME, PRICE, PROD_DESC) VALUES('EL103', 'DESKTOP', 350, 'LG');

SELECT * FROM PRODUCT WHERE PRICE BETWEEN 300 AND 600;

--WILD CARD
SELECT * FROM PRODUCT WHERE PROD_NAME LIKE 'L%';

--AGGREGATE FUNCTIONS COUNT,SUM,AVG,MIN,MAX

SELECT COUNT(*) FROM PRODUCT;

SELECT SUM(PRICE) FROM PRODUCT;

SELECT PROD_NAME, SUM(PRICE) FROM PRODUCT GROUP BY PROD_NAME;

--SUBQUERY
SELECT * FROM PRODUCT WHERE PROD_ID IN (SELECT PROD_ID FROM PRODUCT WHERE PROD_NAME='DESKTOP');

CREATE INDEX IDX_PR_NAME
ON PRODUCT(PROD_NAME);

CREATE TABLE ORDER1 (ORD_ID VARCHAR2(6) PRIMARY KEY, ORD_DATE DATE NOT NULL, ORD_TYPE VARCHAR2(10), PR_ID VARCHAR2(6)
                     REFERENCES PRODUCT(PROD_ID))
                     
INSERT INTO ORDER1 VALUES('ORD103', '12-JUL-2022', 'NEW', NULL);          

SELECT * FROM ORDER1;

--NATURAL JOIN
SELECT P.PROD_NAME, P.PRICE, O.ORD_DATE
FROM PRODUCT P, ORDER1 O
WHERE P.PROD_ID = O.PR_ID;

--INNER JOIN
SELECT P.PROD_NAME, P.PRICE, O.ORD_DATE
FROM PRODUCT P INNER JOIN ORDER1 O
ON P.PROD_ID = O.PR_ID;

--LEFT OUTER JOIN
SELECT P.PROD_NAME, P.PRICE, O.ORD_DATE
FROM PRODUCT P LEFT OUTER JOIN ORDER1 O
ON P.PROD_ID = O.PR_ID;

--RIGHT OUTER JOIN
SELECT P.PROD_NAME, P.PRICE, O.ORD_DATE
FROM PRODUCT P RIGHT OUTER JOIN ORDER1 O
ON P.PROD_ID = O.PR_ID;


--SELF JOIN
--FULL OUTER JOIN


------------TRIGGER----------------
create or replace trigger team_id_auto
before insert on team
for each row
begin
    if inserting then
        if :NEW.team_id is null then
            select 'EL' || TO_CHAR(SEQ1.NEXTVAL, 'FM000') into :NEW.team_id from dual;
        end if;
    end if;
end;





