USE AnticariatLab
GO

CREATE OR ALTER VIEW View_1_table
AS
SELECT *
FROM Genuri
GO


CREATE OR ALTER VIEW View_2_tables
AS
SELECT A.data_achizitie, C.nume_client
FROM Achizitii A
INNER JOIN Clienti C ON A.cod_client=C.cod_client
GO

CREATE OR ALTER VIEW View_2_tables_group_by
AS
SELECT C.titlu, C.an
FROM Carti C
INNER JOIN CartiAchizitii CA ON CA.cod_carte=C.cod_carte
INNER JOIN Achizitii A ON CA.cod_achizitie=A.cod_achizitie
GROUP BY C.titlu, C.an
GO

CREATE OR ALTER PROCEDURE [dbo].[select_view] 
	@view_name varchar(30)
AS
BEGIN
	SET NOCOUNT ON;

	if @view_name = 'View_1_table'
	begin
		select * from View_1_table
	end

	if @view_name = 'View_2_tables'
	begin
		select * from View_2_tables
	end

	if @view_name = 'View_2_tables_group_by'
	begin
		select * from View_2_tables_group_by
	end
END