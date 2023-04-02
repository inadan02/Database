USE AnticariatLab5;

--- Validare editura ---
CREATE OR ALTER Function Valid_Editura(@cod_editura INT)
   RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT * from Edituri where @cod_editura = Edituri.cod_editura)
	BEGIN
		RETURN 1
	END

	RETURN 0
	 
END
GO
--- Validare raft ---
CREATE OR ALTER Function Valid_Raft(@cod_raft INT)
   RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT * from Rafturi where cod_raft = Rafturi.cod_raft)
	BEGIN
		RETURN 1
	END

	RETURN 0
	 
END
GO
--- Validare limba ---
CREATE OR ALTER Function Valid_Limba(@cod_limba INT)
   RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT * from Limbi where @cod_limba = Limbi.cod_limba)
	BEGIN
		RETURN 1
	END

	RETURN 0
	 
END
GO

--- NOT NULL ---

CREATE OR ALTER Function Is_Not_Null(@string nvarchar(100))
   RETURNS INT
AS
BEGIN
	IF @string IS NOT NULL
	BEGIN
		RETURN 1
	END

	RETURN 0
	 
END
GO

----- CRUD PENTRU CARTI -----
GO
CREATE OR ALTER PROCEDURE CRUD_CARTI
	--@cod_carte int,
    @titlu nvarchar(100),
	@pret  float,
	@an int,
	@cod_limba int,
	@cod_raft int,
	@cod_editura int,
    @num_of_rows int = 1
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Is_Not_Null(@titlu) = 1 AND
        dbo.Is_Not_Null(@pret) = 1 AND
        dbo.Is_Not_Null(@an) = 1 AND
		dbo.Valid_Editura(@cod_editura) = 1 AND
		dbo.Valid_Limba(@cod_limba) = 1 AND
		dbo.Valid_Raft(@cod_raft) = 1)
    BEGIN
        -- INSERT
        DECLARE @n INT = 0;
        WHILE (@n < @num_of_rows)
        BEGIN
            INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES(@titlu,@pret,@an,@cod_limba,@cod_raft,@cod_editura);
            SET @n = @n + 1;
        END

        -- SELECT
        SELECT * FROM Carti ORDER BY Carti.titlu;

        -- UPDATE
		UPDATE Carti
        SET Carti.titlu = @titlu + '_CRUD'
        WHERE Carti.titlu = @titlu;
        

        SELECT * FROM Carti ORDER BY Carti.titlu;
        
        -- DELETE

		DELETE FROM Carti
        WHERE Carti.titlu LIKE @titlu + '_CRUD';

        SELECT * FROM Carti ORDER BY titlu;

        PRINT 'CRUD CARTI';
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END
GO
------------------------------------
SELECT * FROM Carti;
EXEC CRUD_CARTI 'test' ,21.5, 1940,1,2,3;
-------------------------------------

--- Validare Autor ---



----- CRUD PENTRU AUTORI -----

GO
CREATE OR ALTER PROCEDURE CRUD_AUTORI
	--@cod_autor int,
    @nume_autor nvarchar(100),
    @num_of_rows INT = 1
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Is_Not_Null(@nume_autor) = 1)
    BEGIN
        -- INSERT
        DECLARE @n INT = 0;
        WHILE (@n < @num_of_rows)
        BEGIN
            INSERT INTO Autori VALUES(@nume_autor);
            SET @n = @n + 1;
        END

        -- SELECT
        SELECT * FROM Autori ORDER BY Autori.nume_autor;

        -- UPDATE
        UPDATE Autori
        SET Autori.nume_autor=@nume_autor+ '_CRUD'
        WHERE Autori.nume_autor=@nume_autor;

        SELECT * FROM Autori ORDER BY Autori.nume_autor;
        
        -- DELETE

        DELETE FROM Autori
        WHERE Autori.nume_autor LIKE @nume_autor + '_CRUD';

        SELECT * FROM Autori ORDER BY nume_autor;

        PRINT 'CRUD AUTORI';
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END
GO
------------------------------------
SELECT * FROM Autori;
EXEC CRUD_AUTORI 'Test';
--------------------------------------

--- Validare ID Carte ---
GO
CREATE OR ALTER Function Valid_IdCarte(@cod_carte INT)
   RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT * from Carti where @cod_carte = Carti.cod_carte)
	BEGIN
		RETURN 1
	END

	RETURN 0
	 
END
GO

--- Validare ID Autor ---
GO
CREATE OR ALTER Function Valid_IdAutor(@cod_autor INT)
   RETURNS INT
AS
BEGIN
	IF EXISTS (SELECT * from Autori where @cod_autor = Autori.cod_autor)
	BEGIN
		RETURN 1
	END

	RETURN 0
	 
END
GO

----- CRUD PENTRU CartiAutor -----
GO
CREATE OR ALTER PROCEDURE CRUD_CARTI_AUTORI
    @cod_carte INT,
	@cod_autor INT
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Valid_IdCarte(@cod_carte) = 1 AND
		dbo.Valid_IdAutor(@cod_autor) = 1)
    BEGIN
        -- INSERT
        INSERT INTO CartiAutori(cod_carte,cod_autor) VALUES(@cod_carte, @cod_autor);

        -- SELECT
        SELECT * FROM CartiAutori ORDER BY CartiAutori.cod_carte;

        -- UPDATE
        UPDATE CartiAutori
        SET CartiAutori.cod_carte = @cod_carte+1
        WHERE CartiAutori.cod_carte = @cod_carte;

        SELECT * FROM CartiAutori ORDER BY CartiAutori.cod_carte;
        
        -- DELETE

        DELETE FROM CartiAutori
        WHERE CartiAutori.cod_autor = @cod_autor AND
			  CartiAutori.cod_carte = @cod_carte + 1;

        SELECT * FROM CartiAutori ORDER BY CartiAutori.cod_carte;

        PRINT 'CRUD CartiAutori';
    END
    ELSE
    BEGIN
        RAISERROR('Date intrare invalide.', 16, 1);
    END
END
GO

------------------------------------------
SELECT * FROM CartiAutori;
EXEC CRUD_CARTI_AUTORI 13, 1;
----------------------------------------



-------------------- Views ------------------------------------------
GO
CREATE OR ALTER VIEW View_Carti 
AS
 SELECT titlu, pret
 FROM Carti as C
 INNER JOIN CartiAutori as CA
 ON C.cod_carte = CA.cod_carte
 where len(titlu) > 5;
GO
CREATE OR ALTER VIEW View_Carti2 
AS
 SELECT pret
 FROM Carti as C
 where pret > 15;
 GO
 CREATE OR ALTER VIEW View_Autori 
AS
 SELECT nume_autor
 FROM Autori as A
 where len(nume_autor) > 5;
 GO


CREATE OR ALTER VIEW View_Carti_Autori 
AS
 SELECT C.titlu, C.pret, Autori.nume_autor
 FROM Carti as C
 INNER JOIN CartiAutori as CA
 ON C.cod_carte = CA.cod_carte
 INNER JOIN Autori
 ON Autori.cod_autor = CA.cod_autor;
GO

---------- INDEXI --------------------------------------------
-- Carti
CREATE NONCLUSTERED INDEX N_idx_Titlu ON Carti (titlu);
CREATE NONCLUSTERED INDEX N_idx_Pret ON Carti (pret);
CREATE NONCLUSTERED INDEX N_idx_Id_Carte ON Carti (cod_carte);

CREATE NONCLUSTERED INDEX NN_idx_Pret ON Carti (pret desc) INCLUDE (cod_carte,titlu,an, cod_limba,cod_raft,cod_editura);

-- Autori
CREATE NONCLUSTERED INDEX N_idx_Nume_Autor ON Autori (nume_autor);
CREATE NONCLUSTERED INDEX N_idx_Id_Autor ON Autori (cod_autor);
CREATE NONCLUSTERED INDEX NN_idx_Autor ON Autori (nume_autor desc) INCLUDE (cod_autor);



-- CartiAutori
CREATE NONCLUSTERED INDEX N_idx_Id_Carte ON CartiAutori (cod_carte);
CREATE NONCLUSTERED INDEX N_idx_Id_Autor ON CartiAutori (cod_autor);

/*
DROP INDEX N_idx_Titlu ON Carti;
DROP INDEX N_idx_Pret ON Carti;
DROP INDEX N_idx_Id_Carte ON Carti;
DROP INDEX N_idx_Nume_Autor ON Autori;
DROP INDEX N_idx_Id_Autor ON Autori;
DROP INDEX N_idx_Id_Carte ON CartiAutori;
DROP INDEX N_idx_Id_Autor ON CartiAutori;
*/

SELECT * FROM View_Carti;
SELECT * FROM View_Carti2;
SELECT * FROM View_Carti_Autori;
SELECT * FROM View_Autori;