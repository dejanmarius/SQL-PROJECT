
                                    /* THE CREATION OF TABLES */
CREATE TABLE Instructori
(id_instructor NUMBER(5) NOT NULL CONSTRAINT pk_instructor PRIMARY KEY,
 nume VARCHAR2(25) NOT NULL,
 prenume VARCHAR2(25) NOT NULL,
 telefon VARCHAR2(20) NOT NULL,
 email VARCHAR2(25) UNIQUE,
 salariul NUMBER(8,2) NOT NULL CONSTRAINT SALARIUL_CK CHECK(salariul>0),
 data_angajare DATE NOT NULL
 );

CREATE TABLE CURSANTI
 (id_cursant NUMBER(5) NOT NULL CONSTRAINT pk_cursant PRIMARY KEY,
 nume VARCHAR2(25) NOT NULL,
 prenume VARCHAR2(25) NOT NULL,
 telefon VARCHAR2(20),
 email VARCHAR2(25)UNIQUE NOT NULL,
 varsta NUMBER(4) NOT NULL CONSTRAINT VARSTA_CK check(varsta>=18),
 data_incepere DATE NOT NULL,
 data_finalizare DATE NOT NULL 
 );
 
 CREATE TABLE GARAJ
 (id_garaj NUMBER(3) NOT NULL CONSTRAINT pk_garaj PRIMARY KEY,
 adresa VARCHAR2(30) NOT NULL,
 capacitate NUMBER(3)
 );

CREATE TABLE VEHICULE
 (id_vehicul NUMBER(5) NOT NULL CONSTRAINT pk_vehicul PRIMARY KEY,
model VARCHAR2(15) NOT NULL,
nr_inmatriculare VARCHAR(15) NOT NULL,
kilometraj NUMBER(6),
an_fabricatie NUMBER(4),
id_garaj NUMBER(3),
CONSTRAINT fk_vehicule FOREIGN KEY (id_garaj) REFERENCES GARAJ(id_garaj)
);

CREATE TABLE LECTII
 (id_lectie NUMBER(5) NOT NULL CONSTRAINT pk_lectie PRIMARY KEY,
 data_lectiei DATE NOT NULL,
 locatie VARCHAR2(25) NOT NULL,
 id_instructor NUMBER(5) ,
 id_vehicul NUMBER(5),
 id_cursant NUMBER(5),
 CONSTRAINT fk_id_instructor FOREIGN KEY(id_instructor) REFERENCES Instructori(id_instructor),
 CONSTRAINT fk_id_vehicul FOREIGN KEY(id_vehicul) REFERENCES Vehicule(id_vehicul),
 CONSTRAINT fk_id_cursant FOREIGN KEY(id_cursant) REFERENCES Cursanti(id_cursant)
 );


/* UPDATING THE STRUCTURE OF TABLES AND MODIFYING INTEGRITY CONSTRAINTS. */

/* 1. Modify the data type of the 'phone' column in the 'INSTRUCTORI' table */
ALTER TABLE INSTRUCTORI
MODIFY (telefon VARCHAR2(15));

/* 2. Adding a new restriction on the 'data_finalizare' column from the 'CURSANTI' table */
alter table CURSANTI
add CONSTRAINT DATA_CK
check(data_finalizare>data_incepere);

/* 3. Adding a new restriction on the 'an_fabricatie' column from the 'VEHICULE' table */
ALTER TABLE VEHICULE
ADD CONSTRAINT an_fabr_ck CHECK(an_fabricatie>2005);

/* 4. Disabling the previously created restriction */
ALTER TABLE VEHICULE
DISABLE CONSTRAINT an_fabr_ck;

/* 5. Deleting previously created restriction*/
ALTER TABLE VEHICULE
DROP CONSTRAINT an_fabr_ck;

/* 6. Adding the 'sex' column to the 'CURSANTI' table */
ALTER TABLE CURSANTI
ADD(SEX VARCHAR2(3));

/* 7. Deleting the 'sex' column from the 'CURSANTI' table*/
ALTER TABLE CURSANTI
DROP COLUMN SEX;

                                    /* ADDING RECORDS TO TABLES*/

/* 1. INSTRUCTORI */
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(130,'Ursu','Ioan','0734345780','ursuioan@gmail.com',3750,TO_DATE('21-09-2020', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(131,'Damian','C?t?lin','0747832534','catalindamian@gmail.com',3300,TO_DATE('14-10-2020', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(132,'Manciu','Liviu','0723465583','manciuliviu13@gmail.com',3860,TO_DATE('18-10-2020', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(133,'Dumitru','Matei','0752420635','mateidumitru@gmail.com',3750,TO_DATE('13-03-2021', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(134,'Pogar','Alin','0736764332','pogaraulin@gmail.com',3354,TO_DATE('21-10-2021', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(135,'Sava','Cristi','0734430327','cristisava@yahoo.com',4250,TO_DATE('03-11-2021', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(138,'Toma','Daniel','0767343710','tomadaniel@gmail.com',3830,TO_DATE('28-08-2022', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(136,'Mitrea','Marian','0731342783','mitreamarian@gmail.com',3800,TO_DATE('23-04-2022', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(137,'Radu','Marian','0734356220','radumarian@yahoo.com',4200,TO_DATE('23-04-2022', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(140,'Cosa','Adi','0743909003','adicosa@gmail.com',4000,TO_DATE('18-11-2022', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(141,'Bibire','Bogdan','0743233003','bibirebogdan@gmail.com',4150,TO_DATE('10-12-2022', 'dd-mm-yyyy'));
INSERT INTO INSTRUCTORI(id_instructor,nume,prenume,telefon,email,salariul,data_angajare)
values(139,'Sichim','Rares','0752620224','raressic@gmail.com',4430,TO_DATE('09-09-2022', 'dd-mm-yyyy'));


/* 2. CURSANTI */
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(3220,'Vlad','Andreea','0755909003','andreea248@gmail.com',20,to_date('01-10-2020', 'dd-mm-yyyy'),to_date('15-12-2020', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(1345,'Popa','Marius','0753432117','mariuspopa@gmail.com',27,to_date('24-05-2021', 'dd-mm-yyyy'),to_date('27-08-2021', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(1482,'Moneaga','Tudor','0742155668','montudor@gmail.com',18,to_date('15-11-2020', 'dd-mm-yyyy'),to_date('05-02-2021', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(6521,'Toma','Sabin','0753039081','tomasabin@gmail.com',34,to_date('08-06-2022', 'dd-mm-yyyy'),to_date('11-08-2022', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(3473,'Popescu','Ion','0729987003','ionpopescu@gmail.com',38,to_date('13-12-2020', 'dd-mm-yyyy'),to_date('04-02-2021', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(2360,'Voicu','Mihai','0770408472','voicumihai@gmail.com',26,to_date('05-07-2022', 'dd-mm-yyyy'),to_date('09-10-2022', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(987,'Coman','Gabriela','0755932210','gabrielacoman@gmail.com',23,to_date('25-11-2021', 'dd-mm-yyyy'),to_date('06-01-2022', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(3152,'Mocanu','Irina','0787672421','mocanuirina@gmail.com',40,to_date('03-01-2021', 'dd-mm-yyyy'),to_date('13-03-2021', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(4268,'Vlad','Bianca','0740566274','biancavlad@gmail.com',44,to_date('01-09-2021', 'dd-mm-yyyy'),to_date('04-12-2021', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(4821,'Aanitei','Daria','0755620628','aaniteidaria@gmail.com',30,to_date('16-11-2020', 'dd-mm-yyyy'),to_date('12-01-2021', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(5200,'Cucu','Andrei','0741090173','cucuvlad@gmail.com',33,to_date('20-11-2022', 'dd-mm-yyyy'),to_date('06-01-2023', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(6432,'Stefan','Maria','0752583683','anastefan@gmail.com',44,to_date('10-10-2022', 'dd-mm-yyyy'),to_date('28-12-2022', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(713,'Rosu','Calin','0753383643','calinrosu@gmail.com',18,to_date('17-03-2022', 'dd-mm-yyyy'),to_date('10-06-2022', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(520,'Preda','Andi','0723983120','andipreda@gmail.com',47,to_date('28-04-2022', 'dd-mm-yyyy'),to_date('25-06-2022', 'dd-mm-yyyy'));
INSERT INTO CURSANTI(id_cursant,nume,prenume,telefon,email,varsta,data_incepere,data_finalizare)
VALUES(1723,'Bucur','Victor','0724223003','bucurvictor@gmail.com',41,to_date('18-11-2021', 'dd-mm-yyyy'),to_date('15-02-2022', 'dd-mm-yyyy'));


/* 3. GARAJ */
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(1,'Str.Stefan cel Mare 7b',2);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(2,'Stefan cel Mare 7c',1);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(6,'Str.Mioritei 167',2);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(8,'Str.Republicii 255',1);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(5,'Str.Garii 74',2);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(3,'Str.Calea Moldovei 144',1);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(9,'Str.Venus 23',2);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(10,'Str.Mihai Viteazu 37',2);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(7,'Str.Nicolae Balcescu 18a',1);
INSERT INTO GARAJ(id_garaj,adresa,capacitate)
VALUES(4,'Str.Calea Moldovei 146',2);


/* 4. VEHICULE */
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(602,'BMW X3','BC-75-DDS',125000,2014,8);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(578,'VW GOLF 6','BC-13-DDS',274357,2011,1);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(474,'RENAULT MEGANE','BC-06-DDS',78322,2019,3);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(503,'VW GOLF 7','BC-15-DDS',84723,2019,1);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(524,'VW PASSAT B8','BC-23-DDS',47852,2020,7);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(783,'MAZDA CX3','BC-73-DDS',254328,2016,9);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(436,'RENAULT CLIO 4','BC-48-DDS',176455,2017,9);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(244,'CITROEN C3','BC-99-DDS',193452,2015,2);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(137,'PEUGEOT 308','BC-09-DDS',122454,2019,5);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(540,'VW GOLF 6','BC-19-DDS',204534,2017,4);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(837,'SKODA OCTAVIA','BC-30-DDS',139564,2018,6);
INSERT INTO VEHICULE(id_vehicul, model,nr_inmatriculare,kilometraj,an_fabricatie,id_garaj)
VALUES(874,'SKODA FABIA','BC-31-DDS',167520,2018,10);


/* 5. LECTII */
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(101,to_date('26-05-2021', 'dd-mm-yyyy'),'Zona Stadion',133,602,1345);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(102,to_date('18-12-2020', 'dd-mm-yyyy'),'Zona Republicii',132,524,3473);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(106,to_date('11-10-2021', 'dd-mm-yyyy'),'Zona Stadion',138,244,4268);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(104,to_date('04-12-2022', 'dd-mm-yyyy'),'Cartier CFR',140,874,5200);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(109,to_date('13-11-2020', 'dd-mm-yyyy'),'Cartier Narcisa',130,602,3220);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(117,to_date('27-11-2021', 'dd-mm-yyyy'),'Zona Stadion',134,578,987);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(103,to_date('14-07-2022', 'dd-mm-yyyy'),'Cartier CFR',137,474,2360);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(108,to_date('20-12-2020', 'dd-mm-yyyy'),'Zona Gheraiesti',130,137,1482);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(105,to_date('25-03-2022', 'dd-mm-yyyy'),'Zona Republicii',135,783,713);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(111,to_date('02-05-2022', 'dd-mm-yyyy'),'Zona Stadion',137,436,520);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(110,to_date('06-01-2021', 'dd-mm-yyyy'),'Cartier Letea',131,540,3152);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(99,to_date('10-06-2022', 'dd-mm-yyyy'),'Zona Stadion',136,837,6521);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(100,to_date('21-11-2021', 'dd-mm-yyyy'),'Cartier CFR',135,503,1723);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(98,to_date('17-11-2021', 'dd-mm-yyyy'),'Cartier Letea',130,578,4821);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(94,to_date('15-10-2022', 'dd-mm-yyyy'),'Zona Republicii',139,524,6432);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(114,to_date('14-06-2021', 'dd-mm-yyyy'),'Cartier CFR',133,602,1345);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(112,to_date('27-11-2020', 'dd-mm-yyyy'),'Zona Stadion',130,602,3220);
INSERT INTO LECTII(id_lectie,data_lectiei,locatie,id_instructor,id_vehicul,id_cursant)
VALUES(96,to_date('18-06-2021', 'dd-mm-yyyy'),'Cartier Narcisa',133,602,1345);

                                    /* UPDATING THE RECORDS */

/* 1. Updating the location of the lesson with ID 114 with the location of the lesson with ID 108 */
UPDATE LECTII
SET locatie = (SELECT locatie FROM LECTII WHERE id_lectie = 108)
WHERE id_lectie = 114;
SELECT id_lectie,locatie FROM LECTII WHERE id_lectie = 114;

/* 2. Updating the vehicle model with ID 524 */
UPDATE VEHICULE
SET model='VW PASSAT B7'
WHERE id_vehicul=524;
SELECT id_vehicul,model from VEHICULE WHERE id_vehicul=524;

/* 3. Delete the records from the 'INSTRUCTORI' table with the salary between 4100 and 4300. Roll back the transaction */
DELETE FROM INSTRUCTORI
WHERE salariul>4100 and salariul<4300;
ROLLBACK;

/* 4. Increasing by 15% the salary of instructors who have taught at least 2 lessons */
UPDATE INSTRUCTORI
SET salariul = salariul * 1.15
WHERE id_instructor IN (SELECT id_instructor FROM LECTII GROUP BY id_instructor HAVING COUNT(*) >= 2);

                                    /* DELETING AND RECOVERING A TABLE */

DROP TABLE INSTRUCTORI
CASCADE CONSTRAINTS;
FLASHBACK TABLE INSTRUCTORI TO BEFORE DROP;

                                    /* VARIOUS QUERIES */
 /* 1. Display the first name, last name, and salary of the instructors who have a salary greater than the average salary of all instructors */
 SELECT nume, prenume,salariul FROM INSTRUCTORI WHERE salariul > (SELECT AVG(salariul) FROM INSTRUCTORI);

/* 2. Display the total number of lessons taught by each instructor */
SELECT id_instructor, COUNT(*) as numar_lectii FROM LECTII 
GROUP BY id_instructor;

/* 3. Display the IDs of the vehicles that have an average recorded mileage greater than 200000 */
SELECT id_vehicul, ROUND(AVG(kilometraj),1) medie_kilometri
FROM VEHICULE 
GROUP BY id_vehicul
HAVING ROUND(AVG(kilometraj),1)>200000;

/* 4. Display the date of the last lesson taught by each instructor */
SELECT id_instructor, MAX(data_lectiei) as ultima_lectie
FROM LECTII
GROUP BY id_instructor;

/* 5. Display in uppercase letters the locations where the student with the ID 3220 has taken his/her lessons */
SELECT id_cursant, UPPER(locatie)
FROM LECTII
WHERE id_cursant=3220;

/* 6. Display the lessons conducted last month */
SELECT id_lectie, data_lectiei FROM LECTII
WHERE round(MONTHS_BETWEEN(sysdate, data_lectiei))=1;

/* 7. Display all the students whose first name starts with the letter 'm' */
SELECT id_cursant, prenume FROM CURSANTI WHERE prenume LIKE UPPER('m%');

/* 8. Display the last name, first name, and age of the student */
SELECT INITCAP(nume) ||' '|| INITCAP(prenume) || ' are ' || varsta || ' ani.'
FROM CURSANTI;

/* 9. Display the instructors employed in the years 2020 and 2021 */
SELECT id_instructor, data_angajare  FROM INSTRUCTORI
	WHERE EXTRACT(YEAR FROM data_angajare) IN (2020, 2021);

/* 10. Display the students who started school between 13.03.2021 and 13.12.2021 */
SELECT id_cursant,nume,prenume,data_incepere
FROM CURSANTI
WHERE data_incepere BETWEEN to_date('13-03-2021', 'dd-mm-yyyy') AND to_date('13-12-2021', 'dd-mm-yyyy');

/* 11. Display the vehicle models based on their mileage distribution:
- in the "Sub 100000 km" category
- in the "Intre 100000 km si 200000 km" category
- in the "Peste 200000 km" category */
SELECT model,
CASE
    WHEN kilometraj<100000 THEN ' Sub 100000 km'
    WHEN kilometraj BETWEEN 100000 AND 200000 THEN ' Intre 100000 km si 200000 km'
    WHEN kilometraj >200000 THEN ' Peste 200000 km'
END AS repartizare_kilometraj
FROM VEHICULE;

/* 12. Display the students who started school in the year 2022 excluding those who started school in the months of June and July of the same year */
SELECT id_cursant, nume, prenume
FROM CURSANTI
WHERE EXTRACT(YEAR FROM data_incepere) = 2022
MINUS
SELECT id_cursant, nume, prenume
FROM CURSANTI
WHERE EXTRACT(MONTH FROM data_incepere) IN ( 6, 7);

/* 13. Display the names and first names of the students who graduated in 2021 together with those who graduated in 2022 */
SELECT nume,prenume FROM CURSANTI
WHERE data_finalizare BETWEEN to_date('01-01-2021', 'dd-mm-yyyy') AND to_date('31-12-2021', 'dd-mm-yyyy')
UNION
SELECT nume,prenume FROM CURSANTI 
WHERE data_finalizare BETWEEN to_date('01-01-2022', 'dd-mm-yyyy') AND to_date('31-12-2022', 'dd-mm-yyyy');

/* 14. Display the ID of the vehicle driven by both the student with ID 987 and the student with ID 4821 */
SELECT DISTINCT id_vehicul                           
FROM LECTII
WHERE id_cursant=987
INTERSECT 
SELECT DISTINCT id_vehicul
from LECTII
WHERE id_cursant=4821;

/* 15. Display the students who had instructor with id 130 */
SELECT DISTINCT CURSANTI.id_cursant, CURSANTI.nume, CURSANTI.prenume
from CURSANTI,LECTII,INSTRUCTORI
where CURSANTI.id_cursant=LECTII.id_cursant
and LECTII.id_instructor=INSTRUCTORI.id_instructor
and INSTRUCTORI.id_instructor=130;

/* 16. Display the garage to which the oldest vehicle belongs, as well as its model */
SELECT GARAJ.id_garaj, VEHICULE.model
FROM GARAJ
JOIN VEHICULE
ON GARAJ.id_garaj = VEHICULE.id_garaj
WHERE VEHICULE.an_fabricatie = (SELECT MIN(an_fabricatie) FROM VEHICULE);

/* 17. Display the instructors who have taught at least one lesson and those who have not taught any lessons, together with the respective lesson id */
SELECT i.id_instructor, l.id_lectie,l.id_instructor
FROM INSTRUCTORI i, LECTII l 
WHERE i.id_instructor = l.id_instructor(+) ;

                                    /* VIEWS,INDEXES, SYNONYMS */

/* 1. Create a virtual table that will contain all the trainees who had lessons with the instructor with the id 130 */
CREATE OR REPLACE VIEW v_cursanti_instructor130 
AS SELECT DISTINCT CURSANTI.*, LECTII.id_instructor
FROM CURSANTI
JOIN LECTII ON LECTII.id_cursant = CURSANTI.id_cursant
WHERE LECTII.id_instructor = 130;

/* 2. Viewing the information about the created virtual table */
SELECT VIEW_NAME, TEXT FROM USER_VIEWS;

/* 3. Delete the virtual table created */
DROP VIEW v_cursanti_instructor130;

/* 4. Create a synonym for the 'GARAJ' table */
CREATE SYNONYM g FOR GARAJ

/* 5. Display the synonym */
SELECT * FROM USER_SYNONYMS;

/* 6. Delete the previously created synonym */
DROP SYNONYM g;

/* 7. Create an index on the table CURSANTI on the column nume */
CREATE INDEX ixNumeCursant ON CURSANTI(nume);

/* 8. Display all the indexes of the user */
SELECT * FROM USER_INDEXES;

/* 9. Delete the index created above */
DROP INDEX ixNumeCursant



