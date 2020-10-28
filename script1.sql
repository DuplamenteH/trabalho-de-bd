-- Database: trabalhoBD

-- DROP DATABASE "trabalhoBD";

CREATE DATABASE "trabalhoBD"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
/*drop table Locatario;*/

create table Locatario(
		idLocat serial not null,
		rg varchar(50),
		cpf varchar(50),
		email varchar (255),
		telefone1 varchar(20),
		telefone2 varchar(20),
		login varchar(16),
		senha varchar(80),
	); 
	

	
	
/*Em imagem será salvo o caminho da imagem*/	
create table imovel(
	idImovel serial not null unique,
	imagem varchar(255),
	valor numeric,
	cep varchar(20),
	rua varchar(255),
	bairro varchar (255),
	cidade varchar (255),
	estado varchar (255),
	primary key (idImovel)
);


drop table imovel cascade;
drop table locador cascade;


create table locador(
	idLocad serial not null unique,
	idImovel serial not null,
	nome varchar(255) not null,
	rg varchar(20) not null,
	cpf varchar(20) not null,
	mail varchar (255),
	telefone1 varchar(16) not null,
	telefone2 varchar(16),
	login varchar(20) not null,
	senha varchar(80) not null
	primary key (idLocad),
	foreign key (idImovel) references imovel drop on CASCADE
);
create table casa(
	idImovel serial not null,
	descricao text(200000),
	diponibilidade boolean not null,
	primary key (idImovel),
	foreign key (idImovel) references imovel drop on CASCADE
);
create table apartamento(
	idImovel serial not null,
	descricao text,
	diponibilidade boolean not null,
	primary key (idImovel),
	foreign key (idImovel) references imovel drop on CASCADE
);
create table notas(
	idLocad serial,
	idnotas serial,
	notas numeric,
	feedbak text,
	primary key (idnotas),
	foreign key (idLocad) references locador drop on CASCADE
);
create table avaliação(
	idavaliacao serial not null unique primary key,
	idLocad serial not null,
	idNotas serial not null,
	positiva boolean not null ,
	foreign key (idLocad) references locador drop on CASCADE,
	foreign key (idNotas) references notas DROP ON CASCADE
);



ALTER TABLE avaliação RENAME TO avaliacao;

/*
create table Locatario(
		idLocat serial,
		rg varchar(16),
		cpf varchar(16),
		email varchar (255),
		telefone1 varchar(11),
		telefone2 varchar(11),
		login varchar(6),
		senha varchar(80)
	);
*/





insert into Locatario values(
		DEFAULT,
		'488234293',
		'14921311307',
		'email1@gmail.com',
		'85996604742',
		'8535521263',
		'letra',
		'0205403@GG'
);
insert into Locatario values(
		DEFAULT,
		'343312049',
		'56154661380',
		'email2@gmail.com',
		'85996604742',
		'8535521263',
		'vogal',
		'0205403@GG'
);
insert into Locatario values(
		DEFAULT,
		'243946119',
		'99859101337',
		'email3@gmail.com',
		'85996604742',
		'8535521263',
		'palavra',
		'2751538496330147652'
);
insert into Locatario values(
		DEFAULT,
		'243946119',
		'77741494309',
		'email4@gmail.com',
		'85996604742',
		'8535521263',
		'letra',
		'0205403@GG'
);
insert into Locatario values(
		DEFAULT,
		'156912557',
		'41467445398',
		'email5@gmail.com',
		'85996604742',
		'8535521263',
		'letra',
		'0205403@GG'
);

select * from Locatario;
/*

idImovel serial not null unique,
	imagem varchar(255),
	valor numeric,
	cep varchar(8),
	rua varchar(255),
	bairro varchar (255),
	cidade varchar (255),
	estado varchar (255),
	primary key (idImovel)
*/

insert into imovel values(
	DEFAULT,
	'IMAGEM1',
	600.00,
	'62900000',
	'RUA BARAO DE SOBRAL',
	'CENTRO',
	'FORTALEZA',
	'CEARA'	
);


select * from imovel;
insert into imovel values(
	DEFAULT,
	'IMAGEM2',
	700.00,
	'65427000',
	'RUA CASTELO BRANCO',
	'MONTESE',
	'FORTALEZA',
	'CEARA'
	
);
insert into imovel values(
	DEFAULT,
	'IMAGEM3 ',
	750.00,
	'45268000',
	'RUA ALMIRANTE RUBIM',
	'ITAOCA',
	'FORTALEZA',
	'CEARA'
);
insert into imovel values(
	DEFAULT,
	'IMAGEM4 ',
	700.00,
	'45267000',
	'RUA BARAO DE CANIDE',
	'LUZ',
	'FORTALEZA',
	'CEARA'
);
insert into imovel values(
	DEFAULT,
	'IMAGEM5 ',
	420.00,
	'28569000',
	'RUA 20 DE SETEMBRO',
	'ILHOTA',
	'FORTALEZA',
	'CEARA'
);
select * from imovel;

/*idLocad serial not null unique,
	idImovel serial not null,
	nome varchar(255) not null,
	rg varchar(20) not null,
	cpf varchar(20) not null,
	mail varchar (255),
	telefone1 varchar(16) not null,
	telefone2 varchar(16),
	login varchar(20) not null,
	senha varchar(80) not null,
	primary key (idLocad),
	foreign key (idImovel) references imovel
*/
insert into locador values(
	DEFAULT,
	'1',
	'PEDRO ALMEIDA ',
	'50013348596',
	'035662424875',
	'PEDRO@GMAIL.COM',
	'85994562871',
	'85995647524',
	'PEDROAL',
	'PEDRO4525'
);
insert into locador values(
	DEFAULT,
	'2',
	'JOAO CARLOS ',
	'50043748296',
	'025602624975',
	'JOAO@GMAIL.COM',
	'85995660891',
	'85997747023',
	'JOAOCAR',
	'JOAO5429'
);
insert into locador values(
	DEFAULT,
	'3',
	'BERNARDO VIANA ',
	'50033788491',
	'025202924625',
	'BERNARDO@GMAIL.COM',
	'85995460299',
	'85998753093',
	'BERNARVIAN',
	'BERVIAN5429'
);
insert into locador values(
	DEFAULT,
	'4',
	'LETICIA OLIVEIRA ',
	'50022787461',
	'025702324820',
	'LETICIA@GMAIL.COM',
	'85999461299',
	'85992793090',
	'LETICIAOLIVER',
	'OLIVER4298'
);
insert into locador values(
	DEFAULT,
	'5',
	'BIA SILVA ',
	'50022747131',
	'024702329880',
	'BIA@GMAIL.COM',
	'85999468693',
	'85997793695',
	'BIASILVA',
	'BIASIL5398'
);

select * from locador;












