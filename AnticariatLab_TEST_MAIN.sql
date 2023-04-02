USE AnticariatLab
GO

INSERT INTO Tables(Name) VALUES
('Genuri'),
('Achizitii'),
('CartiAchizitii');
GO
INSERT INTO Views(Name) VALUES
('View_1_table'),
('View_2_tables'),
('View_2_tables_group_by');
GO

CREATE OR ALTER PROCEDURE [dbo].[mainTest]
	@nb_of_rows varchar(30)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if ISNUMERIC(@nb_of_rows) != 1
	BEGIN
		print('Not a number')
		return 1 
	END
	
	--SET @nb_of_rows = cast(@nb_of_rows as INT)

	declare @all_start datetime
	set @all_start = GETDATE();

	declare @ca_delete_start datetime
	set @ca_delete_start = GETDATE()
	--execute delete_rows @nb_of_rows, 'CartiAchizitii'
	execute delete_rows 'CartiAchizitii'
	declare @ca_delete_end datetime
	set @ca_delete_end = GETDATE()

	declare @a_delete_start datetime
	set @a_delete_start = GETDATE()
	--execute delete_rows @nb_of_rows, 'Achizitii'
	execute delete_rows 'Achizitii'
	declare @a_delete_end datetime
	set @a_delete_end = GETDATE()

	declare @g_delete_start datetime
	set @g_delete_start = GETDATE()
	--execute delete_rows @nb_of_rows, 'Genuri'
	execute delete_rows 'Genuri'
	declare @g_delete_end datetime
	set @g_delete_end = GETDATE()


	declare @g_insert_start datetime
	set @g_insert_start = GETDATE()
	execute insert_rows @nb_of_rows, 'Genuri'
	declare @g_insert_end datetime
	set @g_insert_end = GETDATE()

	declare @a_insert_start datetime
	set @a_insert_start = GETDATE()
	execute insert_rows @nb_of_rows, 'Achizitii'
	declare @a_insert_end datetime
	set @a_insert_end = GETDATE()

	declare @ca_insert_start datetime
	set @ca_insert_start = GETDATE()
	execute insert_rows @nb_of_rows, 'CartiAchizitii'
	declare @ca_insert_end datetime
	set @ca_insert_end = GETDATE()

	declare @view_1_table_start datetime
	set @view_1_table_start = GETDATE()
	execute select_view 'View_1_table'
	declare @view_1_table_end datetime
	set @view_1_table_end = GETDATE()

	declare @view_2_tables_start datetime
	set @view_2_tables_start = GETDATE()
	execute select_view 'View_2_tables'
	declare @view_2_tables_end datetime
	set @view_2_tables_end = GETDATE()

	declare @view_2_tables_group_by_start datetime
	set @view_2_tables_group_by_start = GETDATE()
	execute select_view 'View_2_tables_group_by'
	declare @view_2_tables_group_by_end datetime
	set @view_2_tables_group_by_end = GETDATE()

	declare @all_stop datetime 
	set @all_stop = getdate() 

	declare @description varchar(100)
	set @description = 'TestRun' + convert(varchar(7), (select max(TestRunID) from TestRuns)) + 'delete, insert' + @nb_of_rows + 'rows, select all views'

	insert into TestRuns(Description, StartAt, EndAt) values(@description, @all_start, @all_stop);

	declare @lastTestRunID int; 
	set @lastTestRunID = (select max(TestRunID) from TestRuns);

	insert into TestRunTables values(@lastTestRunID, 1, @ca_delete_start, @ca_delete_end)

	insert into TestRunTables values(@lastTestRunID, 2, @a_delete_start, @a_delete_end)

	insert into TestRunTables values(@lastTestRunID, 3, @g_delete_start, @g_delete_end)

	insert into TestRunViews values(@lastTestRunID, 1, @view_1_table_start, @view_1_table_end)
	
	insert into TestRunViews values(@lastTestRunID, 2, @view_2_tables_start, @view_2_tables_end)

	insert into TestRunViews values(@lastTestRunID,3, @view_2_tables_group_by_start, @view_2_tables_group_by_end)


END

execute mainTest 12

select * from TestRunViews--fiecare view
select * from TestRuns
select * from TestRunTables--fiecare table


delete from TestRunViews
delete from TestRuns
delete from TestRunTables

select * from Genuri
select * from Achizitii
select * from CartiAchizitii

DROP TABLE TestRunViews
DROP TABLE TestRunTables
DROP TABLE TestRuns
DROP TABLE TestTables
DROP TABLE TestViews
DROP TABLE Tests
DROP TABLE Tables
DROP TABLE Views

execute insert_rows 1000, 'Clienti'




