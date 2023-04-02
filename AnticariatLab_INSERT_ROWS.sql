USE AnticariatLab
GO

CREATE OR ALTER PROCEDURE [dbo].[insert_rows] 
	@nb_of_rows varchar(30),
	@table_name varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;

	declare @table varchar(100)
	set @table = ('[' + @table_name + ']')

	--if @table_name = 'Genuri' or @table_name = 'Achizitii'
	--begin
		--DBCC CHECKIDENT (@table, RESEED, 0);
	--end

    -- Insert statements for procedure here
	if ISNUMERIC(@nb_of_rows) != 1
	BEGIN
		print('Not a number')
		return 1 
	END
	
	SET @nb_of_rows = cast(@nb_of_rows as INT)

	declare @contor int
	set @contor = 1

	declare @data_achizitie datetime
	set @data_achizitie='12-12-2022'
	declare @metoda_plata varchar(100)
	declare @cod_client int

	declare @nume_gen varchar(100)

	declare @cod_carte int
	set @cod_carte = 1
	declare @cod_achizitie int

	while @contor <= @nb_of_rows
	begin
		if @table_name = 'Genuri'
		begin
			set @nume_gen= 'Gen' + convert(varchar(7), (@contor+10000))
			insert into Genuri (nume_gen) values (@nume_gen)
		end
		
		if @table_name = 'Achizitii'
		begin
			set @metoda_plata = 'Plata'+convert(varchar(7), (@contor + 10000))
			set @cod_client = (select max(cod_client) from Clienti) - @contor + 1
			insert into Achizitii(data_achizitie,metoda_plata,cod_client) values (@data_achizitie,@metoda_plata,@cod_client)
		end
		if @table_name = 'CartiAchizitii'
		begin
			set @cod_achizitie = (select max(cod_achizitie) from Achizitii) - @contor + 1
			insert into CartiAchizitii(cod_carte, cod_achizitie) values (@cod_carte, @cod_achizitie)
		end

		set @contor = @contor + 1
	end
	
END