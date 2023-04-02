USE AnticariatLab
GO

CREATE OR ALTER PROCEDURE [dbo].[delete_rows]
	--@nb_of_rows varchar(30),
	@table_name varchar(30)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	--if ISNUMERIC(@nb_of_rows) != 1
	--BEGIN
		--print('Not a number')
		--return 1 
	--END
	
	--SET @nb_of_rows = cast(@nb_of_rows as INT)

	---declare @last_row int
	if @table_name = 'Genuri'
		begin
			--set @last_row = (select MAX(cod_gen) from Genuri) - @nb_of_rows

			--delete from Genuri where cod_gen > @last_row
			delete from Genuri
		end
		
		if @table_name = 'Achizitii'
		begin
			--set @last_row =(select MAX(cod_client) from Achizitii) - @nb_of_rows
			--delete from Achizitii where cod_achizitie > @last_row
			delete from Achizitii
		end

		if @table_name = 'CartiAchizitii'
		begin
			delete from CartiAchizitii
		end
END