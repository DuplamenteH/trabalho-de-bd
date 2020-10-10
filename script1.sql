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
	
alter table Locatario add primary key (idLocat);
	
	
/*Em imagem será salvo o caminho da imagem*/	
create table imovel(
	idImovel serial not null unique,
	imagem varchar(255),
	valor numeric,
	cep varchar(8),
	rua varchar(255),
	bairro varchar (255),
	cidade varchar (255),
	estado varchar (255),
	primary key (idImovel)
);
create table locador(
	idLocad serial not null unique,
	idImovel serial not null,
	nome varchar(255) not null,
	rg varchar(16) not null,
	cpf varchar(16) not null,
	mail varchar (255),
	telefone1 varchar(11) not null,
	telefone2 varchar(11),
	login varchar(6) not null,
	senha varchar(80) not null,
	totalImo integer,
	primary key (idLocad),
	foreign key (idImovel) references imovel
);
create table casa(
	idImovel serial not null,
	descrição text,
	diponibilidade boolean not null,
	primary key (idImovel),
	foreign key (idImovel) references imovel
);
create table apartamento(
	idImovel serial not null,
	descrição text,
	diponibilidade boolean not null,
	primary key (idImovel),
	foreign key (idImovel) references imovel
);
create table notas(
	idLocad serial,
	idnotas serial,
	notas numeric,
	feedbak text,
	primary key (idnotas),
	foreign key (idLocad) references locador
);
create table avaliação(
	idavaliacao serial not null unique primary key,
	idLocad serial not null,
	idNotas serial not null,
	positiva boolean not null unique,
	negativa boolean not null unique,
	foreign key (idLocad) references locador,
	foreign key (idNotas) references notas
);



ALTER TABLE avaliação RENAME TO avaliacao;