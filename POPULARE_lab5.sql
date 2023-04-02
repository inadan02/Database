USE AnticariatLab5;
INSERT INTO Clienti(nume_client,email_client) VALUES ('Bob', 'bob1@yahoo.com');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Ana', 'ana2022@yahoo.com');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Andrada', 'andradadada@gmail.com');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Vasile', 'vasilika@yahoo.ro');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Bob', 'bob2@yahoo.com');
--SELECT * FROM Clienti;
INSERT INTO Clienti(nume_client,email_client) VALUES ('Maria Pop', 'mariap@yahoo.com');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Ion Popescu', 'ion_popescu@gmail.com');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Ana', 'anna@gmail.com');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Anamaria', 'maria@yahoo.ro');
INSERT INTO Clienti(nume_client,email_client) VALUES ('Bob', 'bob3@yahoo.com');
--delete from Clienti
--SELECT * FROM Clienti;
--delete from Clienti

INSERT INTO Edituri(nume_editura,adresa_editura,telefon_editura) VALUES ('Paralela45', 'Dorobantilor 105', 0712223567);
INSERT INTO Edituri(nume_editura,adresa_editura,telefon_editura) VALUES ('Humanitas', 'Soarelui 66', 0735220999);
INSERT INTO Edituri(nume_editura,adresa_editura,telefon_editura) VALUES ('Libera', 'Gheorge Dima', 0775380719);
INSERT INTO Edituri(nume_editura,adresa_editura,telefon_editura) VALUES ('Miracol', 'Kogalniceanu 4', 0756772453);
INSERT INTO Edituri(nume_editura,adresa_editura,telefon_editura) VALUES ('Trei', 'Constanta 6', 0756452477);
--delete from Edituri

INSERT INTO Genuri (nume_gen) VALUES ('SF');
INSERT INTO Genuri (nume_gen) VALUES ('politist');
INSERT INTO Genuri (nume_gen) VALUES ('psihologic');
INSERT INTO Genuri (nume_gen) VALUES ('clasic');
INSERT INTO Genuri (nume_gen) VALUES ('mister');
INSERT INTO Genuri (nume_gen) VALUES ('fictiune');
INSERT INTO Genuri (nume_gen) VALUES ('horror');

INSERT INTO Genuri (nume_gen) VALUES ('biografie');
INSERT INTO Genuri (nume_gen) VALUES ('autobiografie');
INSERT INTO Genuri (nume_gen) VALUES ('stiinta');
--select * from Genuri

INSERT INTO Limbi (limba) VALUES ('romana');
INSERT INTO Limbi (limba) VALUES ('engleza');
INSERT INTO Limbi (limba) VALUES ('franceza');
INSERT INTO Limbi (limba) VALUES ('rusa');
--delete from Limbi

INSERT INTO Autori (nume_autor) VALUES ('Eminescu');
INSERT INTO Autori (nume_autor) VALUES ('Creanga');
INSERT INTO Autori (nume_autor) VALUES ('Slavici');
INSERT INTO Autori (nume_autor) VALUES ('Caragiale');
INSERT INTO Autori (nume_autor) VALUES ('Agatha Christie');
INSERT INTO Autori (nume_autor) VALUES ('Stephen King');
INSERT INTO Autori (nume_autor) VALUES ('Shakespeare');
INSERT INTO Autori (nume_autor) VALUES ('Tolstoi');
INSERT INTO Autori (nume_autor) VALUES ('Hemingway');
INSERT INTO Autori (nume_autor) VALUES ('Dostoievski');
INSERT INTO Autori (nume_autor) VALUES ('Peter Straub');
--delete from Autori


INSERT INTO Rafturi(numar_raft) VALUES (1);
INSERT INTO Rafturi(numar_raft) VALUES (2);
INSERT INTO Rafturi(numar_raft) VALUES (3);
INSERT INTO Rafturi(numar_raft) VALUES (4);
INSERT INTO Rafturi(numar_raft) VALUES (5);
INSERT INTO Rafturi(numar_raft) VALUES (6);
--delete from Rafturi


INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Poezii' ,11.5, 1930,1,2,3);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Basme' ,10.4, 1955,1,2,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Proza' ,22, 1971,1,2,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Amintiri din copilarie' ,20.5, 1983,1,1,2);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Povestea lui Hatap Alb' ,13.3, 1990,1,1,1);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Moara cu noroc' ,30, 1899,1,1,2);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Momente si schite' ,17.8, 1990,3,2,3);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Death on the Nile' ,23, 2000,2,3,3);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('And Then There Were None' ,30.2, 1999,2,3,3);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('The Talisman' ,15.5, 2001,2,3,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('The Stand' ,33, 1998,2,3,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Romeo and Juliet' ,39.5, 1780,2,4,3);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Macbeth' ,41, 1900,2,4,3);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Razboi si Pace' ,105, 1900,4,5,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Anna Karenina' ,78, 1901,4,5,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Batranul si marea' ,23, 2003,3,4,2);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Crima si pedeapsa' ,98, 1903,4,5,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Fratii Karamazov' ,100, 1930,4,5,4);
INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES ('Poezii Bacovia' ,13, 1938,1,2,3);
--delete from Carti


INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('10-30-2021','card',1);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('07-23-2022','card',1);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('11-05-2019','cash',2);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2022','cash',3);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2017','cash',3);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2022','card',4);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('11-05-2019','card',4);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2017','card',4);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('07-23-2022','cash',5);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('05-22-2018','cash',6);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2022','card',7);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2017','card',8);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('05-22-2018','card',8);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2022','card',8);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('03-03-2016','card',8);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('11-05-2019','cash',9);
INSERT INTO Achizitii(data_achizitie,metoda_plata,cod_client) VALUES ('11-05-2019','cash',10);
--SELECT * FROM Achizitii;
--delete from Achizitii


INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (2,1);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (3,2);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (4,3);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (5,4);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (6,5);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (7,7);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (8,6);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (9,8);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (10,8);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (11,9);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (12,10);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (13,11);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (14,12);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (15,13);
INSERT INTO CartiAchizitii(cod_achizitie,cod_carte) VALUES (16,14);
--select * from CartiAchizitii
--delete from CartiAchizitii

INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (1,3);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (2,3);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (3,3);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (4,4);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (5,4);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (6,5);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (7,6);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (8,7);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (9,7);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (10,8);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (10,10);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (11,8);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (12,9);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (13,9);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (14,10);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (15,10);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (16,11);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (17,11);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (18,11);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (19,1);
INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES (10,11);

SELECT * FROM Clienti;
select * from Genuri
select * from Limbi
select * from Carti
select * from Autori
select * from Rafturi
select * from CartiAchizitii
select * from CartiGenuri
select * from CartiAutori
select * from Achizitii
