create database farmacie_practic
use farmacie_practic
go

create table Farmacii(
id_farmacie int primary key identity,
nume_farmacie varchar(100),
adresa varchar(100),
telefon varchar(100),
oras varchar(100)
)

create table Medicamente(
id_medicament int primary key identity,
denumire varchar(100),
descriere varchar(100),
producator varchar(100),
mod_administrare varchar(100)
)

create table Preturi(
id_farmacie int,
id_medicament int,
pret float,
constraint fk_fid foreign key (id_farmacie) references Farmacii(id_farmacie),
constraint fk_mid foreign key (id_medicament) references Medicamente(id_medicament),
constraint pk_fmid primary key(id_farmacie,id_medicament)
)

create table Afectiuni(
id_afectiune int primary key identity,
nume_afectiune varchar(100),
descriere_afectiune varchar(100)
)

create table Tratamente(
id_medicament int,
id_afectiune int,
constraint fk_meid foreign key (id_medicament) references Medicamente(id_medicament),
constraint fk_afid foreign key (id_afectiune) references Afectiuni(id_afectiune),
constraint pk_meafid primary key(id_medicament,id_afectiune)
)

insert into Farmacii values('Catena','Dorobantilor','0735220965','Cluj'),
('Doris','Eroilor','0735229965','Sibiu'),
('Remedium','Memo','0745220965','Bucuresti');
select * from Farmacii;

insert into Medicamente values ('Paduden','ibuprofen','A','una'),
('Nurofen','antiinflamator','B','zilnic'),
('Antibiotic','tare','C','o saptamana');
select * from Medicamente;

insert into Preturi values (1,1,12.2),
(1,2,20),
(2,2,25.5),
(3,3,22);
select * from Preturi;

insert into Afectiuni values ('gripa','febra'),
('durere de spate','dureros'),
('raceala','tuse'),
('entorsa','umflat');
select * from Afectiuni;
select * from Medicamente;
select * from Tratamente;

insert into Tratamente values (1,1),(1,2),(3,1),(2,1),(2,4),(2,3);
select * from Tratamente;

go


create or alter procedure AdaugaMedicament
@id_farmacie int, 
@id_medicament int,
@pret float
as
begin
	if(exists(select * from Preturi where id_farmacie=@id_farmacie and id_medicament=@id_medicament))
	begin
		update Preturi set pret=@pret where id_farmacie=@id_farmacie and id_medicament=@id_medicament
	end
	else
	begin
		insert into Preturi(pret, id_farmacie,id_medicament) values(@pret,@id_farmacie,@id_medicament)
	end
end

exec AdaugaMedicament 1 ,1, 12.9
exec AdaugaMedicament 3 ,1, 60
select * from Preturi;

go


create or alter view View3
as
select Medicamente.denumire
from Medicamente inner join Tratamente on Medicamente.id_medicament=Tratamente.id_medicament
inner join Afectiuni on Afectiuni.id_afectiune=Tratamente.id_afectiune
--group by Medicamente.id_medicament,Medicamente.denumire
where Afectiuni.nume_afectiune='gripa' and Afectiuni.nume_afectiune<>'durere de spate'


go

select * from View3;

go

create or alter view View_ex
as
select distinct Medicamente.denumire
from Medicamente inner join Tratamente T1 on Medicamente.id_medicament=T1.id_medicament
inner join Tratamente T2 on Medicamente.id_medicament=T2.id_medicament
inner join Afectiuni A1 on A1.id_afectiune=T1.id_afectiune 
inner join Afectiuni A2 on A2.id_afectiune=T1.id_afectiune
--group by Medicamente.id_medicament,Medicamente.denumire,A1.nume_afectiune,A2.nume_afectiune
where A1.nume_afectiune='gripa' and A2.nume_afectiune<>'durere de spate' and A1.id_afectiune=A2.id_afectiune


go

select * from View_ex;

go


--view okk
create or alter view View_ex3
as
select M.denumire
from Medicamente as M inner join Tratamente as T on M.id_medicament=T.id_medicament
inner join Afectiuni as A on A.id_afectiune=T.id_afectiune 
--group by Medicamente.id_medicament,Medicamente.denumire,A1.nume_afectiune,A2.nume_afectiune
where A.id_afectiune in (select A.id_afectiune from Afectiuni where A.nume_afectiune='gripa')
except 
select M1.denumire 
from Medicamente as M1 inner join Tratamente as T on M1.id_medicament=T.id_medicament
inner join Afectiuni as A on A.id_afectiune=T.id_afectiune 
where A.id_afectiune in (select A.id_afectiune from Afectiuni where A.nume_afectiune='durere de spate')

go

select * from View_ex3;
select * from Afectiuni;
select * from Medicamente;
select * from Tratamente;

