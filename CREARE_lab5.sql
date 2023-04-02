CREATE DATABASE AnticariatLab5;
GO
USE AnticariatLab5;

CREATE TABLE Autori
(cod_autor INT PRIMARY KEY IDENTITY,
nume_autor VARCHAR(100) NOT NULL UNIQUE
);
--drop table Autori

CREATE TABLE Genuri
(cod_gen INT PRIMARY KEY IDENTITY,
nume_gen VARCHAR(100)
);
--drop table Genuri

CREATE TABLE Rafturi
(cod_raft INT PRIMARY KEY IDENTITY,
numar_raft INT NOT NULL
);
--drop table Rafturi

CREATE TABLE Clienti
(cod_client INT PRIMARY KEY IDENTITY,
nume_client VARCHAR(100) NOT NULL,
email_client VARCHAR(100) UNIQUE
);
--drop table Clienti

CREATE TABLE Limbi
(cod_limba INT PRIMARY KEY IDENTITY,
limba VARCHAR(100) NOT NULL
);
--drop table Limbi

CREATE TABLE Achizitii
(cod_achizitie INT PRIMARY KEY IDENTITY,
data_achizitie DATETIME,
metoda_plata VARCHAR(100),
cod_client INT FOREIGN KEY REFERENCES Clienti(cod_client) ON UPDATE CASCADE ON DELETE CASCADE
);
--drop table Achizitii

CREATE TABLE Edituri
(cod_editura INT PRIMARY KEY IDENTITY,
nume_editura VARCHAR(100) NOT NULL,
adresa_editura VARCHAR(100),
telefon_editura INT
);
--drop table Edituri


CREATE TABLE Carti
(cod_carte INT PRIMARY KEY IDENTITY,
titlu VARCHAR(100) NOT NULL UNIQUE,
pret FLOAT NOT NULL,
an INT NOT NULL,
cod_limba INT FOREIGN KEY REFERENCES Limbi(cod_limba) ON UPDATE CASCADE ON DELETE CASCADE,
cod_raft INT FOREIGN KEY REFERENCES Rafturi(cod_raft) ON UPDATE CASCADE ON DELETE CASCADE,
cod_editura INT FOREIGN KEY REFERENCES Edituri(cod_editura) ON UPDATE CASCADE ON DELETE CASCADE
);
--drop table Carti


CREATE TABLE CartiAchizitii
(cod_carte INT,
cod_achizitie INT,
CONSTRAINT fk_Carti_CartiAchizitii FOREIGN KEY (cod_carte) REFERENCES Carti (cod_carte),
CONSTRAINT fk_Achizitii_CartiAchizitii FOREIGN KEY (cod_achizitie) REFERENCES Achizitii (cod_achizitie),
CONSTRAINT pk_CartiAchizitii PRIMARY KEY (cod_carte, cod_achizitie)
);
--drop table CartiAchizitii

GO
CREATE TABLE CartiGenuri
(cod_carte INT,
cod_gen INT,
CONSTRAINT fk_Carti_CartiGenuri FOREIGN KEY (cod_carte) REFERENCES Carti (cod_carte),
CONSTRAINT fk_Genuri_CartiGenuri FOREIGN KEY (cod_gen) REFERENCES Genuri (cod_gen),
CONSTRAINT pk_CartiGenuri PRIMARY KEY (cod_carte, cod_gen)
);

--drop table CartiGenuri

GO
CREATE TABLE CartiAutori
(cod_carte INT,
cod_autor INT,
CONSTRAINT fk_Carti_CartiAutori FOREIGN KEY (cod_carte) REFERENCES Carti (cod_carte),
CONSTRAINT fk_Autori_CartiAutori FOREIGN KEY (cod_autor) REFERENCES Autori (cod_autor),
CONSTRAINT pk_CartiAutori PRIMARY KEY (cod_carte, cod_autor)
);
--drop table CartiAutori







