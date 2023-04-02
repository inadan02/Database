USE AnticariatLab5;
GO


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

CREATE OR ALTER PROCEDURE ADAUGA_CARTI
	--@cod_carte int,
    @titlu nvarchar(100),
	@pret  float,
	@an int,
	@cod_limba int,
	@cod_raft int,
	@cod_editura int
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
        
        INSERT INTO Carti(titlu,pret,an,cod_limba,cod_raft,cod_editura) VALUES(@titlu,@pret,@an,@cod_limba,@cod_raft,@cod_editura);
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END

GO
CREATE OR ALTER PROCEDURE SELECT_CARTI
AS
BEGIN
    SET NOCOUNT ON;
  
	SELECT * FROM Carti ORDER BY Carti.titlu;
    
END

GO
CREATE OR ALTER PROCEDURE UPDATE_CARTI
	--@cod_carte int,
    @titlu nvarchar(100),
	@pret  float,
	@an int,
	@cod_limba int,
	@cod_raft int,
	@cod_editura int
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
        

        -- UPDATE
		if exists (select * from dbo.Carti where titlu=@titlu)
		begin
			UPDATE Carti
			SET Carti.titlu = @titlu + '_CRUD'
			WHERE Carti.titlu = @titlu;
		end
		else
		begin
			RAISERROR('nu exista', 16, 1);
		end
		
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END

GO
CREATE OR ALTER PROCEDURE DELETE_CARTI
	--@cod_carte int,
    @titlu nvarchar(100),
	@pret  float,
	@an int,
	@cod_limba int,
	@cod_raft int,
	@cod_editura int
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
        declare @exista bit
		set @exista=0
		if exists (select * from dbo.Carti where titlu=@titlu)
		begin
			DELETE FROM Carti
			WHERE Carti.titlu = @titlu;

			SELECT * FROM Carti ORDER BY titlu;
		end
		else
		begin
			RAISERROR('nu exista', 16, 1);
		end

        
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END
------------------------------------
SELECT * FROM Carti;
EXEC ADAUGA_CARTI 'test' ,21.5, 1940,1,2,3;
EXEC SELECT_CARTI;
EXEC DELETE_CARTI 'test_CRUD' ,21.5, 1940,1,2,3;
EXEC UPDATE_CARTI 'test' ,21.5, 1940,1,2,3;
-------------------------------------

--- Validare Autor ---



----- CRUD PENTRU AUTORI -----

GO
CREATE OR ALTER PROCEDURE ADAUGA_AUTORI
	--@cod_autor int,
    @nume_autor nvarchar(100),
    @num_of_rows INT = 1
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Is_Not_Null(@nume_autor) = 1)
    BEGIN
        -- INSERT
        
            INSERT INTO Autori VALUES(@nume_autor);
         
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END
GO
CREATE OR ALTER PROCEDURE SELECT_AUTORI
	--@cod_autor int,
   
AS
BEGIN
    

        -- SELECT
        SELECT * FROM Autori ORDER BY Autori.nume_autor;

   
    
END
GO
CREATE OR ALTER PROCEDURE UPDATE_AUTORI
	--@cod_autor int,
    @nume_autor nvarchar(100)
   
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Is_Not_Null(@nume_autor) = 1)
    BEGIN
        
		if exists (select * from dbo.Autori where nume_autor=@nume_autor)
		begin
			UPDATE Autori
        SET Autori.nume_autor=@nume_autor+ '_CRUD'
        WHERE Autori.nume_autor=@nume_autor;
		end
		else
		begin
			RAISERROR('nu exista', 16, 1);
		end
        
        

        
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END
GO
CREATE OR ALTER PROCEDURE DELETE_AUTORI
	--@cod_autor int,
    @nume_autor nvarchar(100),
    @num_of_rows INT = 1
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Is_Not_Null(@nume_autor) = 1)
    BEGIN
        
        declare @exista bit
		set @exista=0
		if exists (select * from dbo.Autori where nume_autor=@nume_autor)
		begin
			
			DELETE FROM Autori
			WHERE Autori.nume_autor = @nume_autor ;
		end
		else
		begin
			RAISERROR('nu exista', 16, 1);
		end
        
    END
    ELSE
    BEGIN
        RAISERROR('Date de intrare invalide.', 16, 1);
    END
END
------------------------------------
SELECT * FROM Autori;
EXEC ADAUGA_AUTORI 'Test';
EXEC SELECT_AUTORI;
EXEC UPDATE_AUTORI 'Test';
EXEC DELETE_AUTORI 'Test_CRUD';
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
CREATE OR ALTER PROCEDURE DELETE_CARTI_AUTORI
    @cod_carte INT,
	@cod_autor INT
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Valid_IdCarte(@cod_carte) = 1 AND
		dbo.Valid_IdAutor(@cod_autor) = 1)
    BEGIN
        
        
        -- DELETE
		declare @exista bit
		set @exista=0
		if exists (select * from dbo.CartiAutori where cod_autor=@cod_autor and cod_carte=@cod_carte)
		begin
			
			DELETE FROM CartiAutori
			WHERE CartiAutori.cod_autor = @cod_autor AND
			  CartiAutori.cod_carte = @cod_carte ;
		end
		else
		begin
			RAISERROR('nu exista', 16, 1);
		end
    END
    ELSE
    BEGIN
        RAISERROR('Date intrare invalide.', 16, 1);
    END
END
GO
CREATE OR ALTER PROCEDURE ADAUGA_CARTI_AUTORI
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

        
    END
    ELSE
    BEGIN
        RAISERROR('Date intrare invalide.', 16, 1);
    END
END
GO
CREATE OR ALTER PROCEDURE SELECT_CARTI_AUTORI
  
AS
BEGIN
    SET NOCOUNT ON;
    

        -- SELECT
        SELECT * FROM CartiAutori ORDER BY CartiAutori.cod_carte;

        
END
GO
CREATE OR ALTER PROCEDURE UPDATE_CARTI_AUTORI
    @cod_carte INT,
	@cod_autor INT
AS
BEGIN
    SET NOCOUNT ON;
    IF (dbo.Valid_IdCarte(@cod_carte) = 1 AND
		dbo.Valid_IdAutor(@cod_autor) = 1)
    BEGIN
        
        -- UPDATE
		declare @exista bit
		set @exista=0
		if exists (select * from dbo.CartiAutori where cod_autor=@cod_autor and cod_carte=@cod_carte)
		begin
			
			UPDATE CartiAutori
			SET CartiAutori.cod_carte = @cod_carte
			WHERE CartiAutori.cod_carte = @cod_carte;
		end
		else
		begin
			RAISERROR('nu exista', 16, 1);
		end
        

        
    END
    ELSE
    BEGIN
        RAISERROR('Date intrare invalide.', 16, 1);
    END
END

------------------------------------------
SELECT * FROM CartiAutori;
EXEC ADAUGA_CARTI_AUTORI 13, 1;
EXEC SELECT_CARTI_AUTORI;
EXEC UPDATE_CARTI_AUTORI 14, 1;
EXEC DELETE_CARTI_AUTORI 13, 1;
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