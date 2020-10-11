select * from notas;
select * from locador;
select * from avaliacao;
select * from imovel;
select * from locador;

/*
	idlocador (4,5,6,7,8)
	idnotas
	notas
	feedback
*/
insert into notas values(
	5,
	default,
	3.5,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	4
	default,
	3.5,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	6,
	default,
	1.5,
	'O vendendor é muito ruim, desatento e super grosseiro'
);
insert into notas values(
	7,
	default,
	3.0,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	9,
	default,
	5.0,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	10,
	default,
	5.0,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	11,
	default,
	5.0,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	12,
	default,
	5.0,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	13,
	default,
	5.0,
	'O vendendor é muito atencioso e prestativo,
	 e faz de tudo para ajudar.'
);
insert into notas values(
	14,
	default,
	1.0,
	'O vendendor é muito RUIM'
);





/*
	idavaliacao
	idlocador (4,5,6,7,8)
	idnotas
	positivas,
	negativa
	
*/
select * from notas;
select * from locador;
select * from avaliacao;

insert into avaliacao values(
	default,
	5,
	1,
	true,
	false
);

insert into avaliacao values(
	default,
	8,
	5,
	false,
	true
);
insert into avaliacao values(
	default,
	7,
	4,
	false,
	true
);
insert into avaliacao values(
	default,
	6,
	3,
	false,
	true
);
insert into avaliacao values(
	default,
	9,
	6,
	true,
	false
);

insert into avaliacao values(
	default,
	10,
	7,
	true,
	false
);
insert into avaliacao values(
	default,
	11,
	8,
	true,
	false
);
insert into avaliacao values(
	default,
	12,
	9,
	true,
	false
);
insert into avaliacao values(
	default,
	13,
	10,
	true,
	false
);
insert into avaliacao values(
	default,
	14,
	11,
	false,
	true
);
insert into avaliacao values(
	default,
	4,
	2,
	true,
	false
);
insert into locador values(
	DEFAULT,
	'11',
	'MATHEUS MARTINS',
	'52022737131',
	'023722329880',
	'CIAOM@GMAIL.COM',
	'85999860693',
	'85997599695',
	'MATHEUSM',
	'MM859585'
);

SELECT* FROM LOCADOR;

insert into imovel values(
	DEFAULT,
	'IMAGEM10',
	5500.00,
	'45285000',
	'AV ABOLICAO',
	'BEIRA MAR',
	'FORTALEZA',
	'CEARA'
);

SELECT * FROM IMOVEL;

insert into casa values (
	10,
	'Casa com 3 quartos, 2 banheiros , uma suite, area de serviço
	area de lazer',
	TRUE
);
insert into apartamento values (
	11,
	'Casa com 5 quartos, 4 banheiros ,3 suite,cozinha gigante,
	varanda,area de serviço 50m², 2 andares, de frente para o mar
	O APARTAMENTO PERFEITO PARA VOCÊ!!!',
	TRUE
);





ALTER TABLE locador
RENAME COLUMN mail TO email;



create or replace view bairrosCaros as
	select imovel.bairro, max(imovel.valor) from imovel 
			group by bairro 
			having max(imovel.valor)>1000;
			

select * from bairrosBaratos;
select * from bairrosCaros;

select imovel.valor, imovel.cep,imovel.rua,imovel.bairro, imovel.cidade, imovel.estado, casa.descricao
	from imovel, casa where(imovel.idimovel = casa.idimovel and casa.diponibilidade=true);
	
	
select imovel.valor, imovel.cep,imovel.rua,imovel.bairro, imovel.cidade, imovel.estado, casa.descricao
	from imovel, casa where(imovel.idimovel = casa.idimovel);
	
	
select * from imovel, apartamento where(imovel.idimovel = apartamento.idimovel);


select locador.nome, notas.feedback, notas.notas 
	from locador, notas where (locador.idlocad=notas.idlocad);
	
	
select locador.nome, notas.notas
	from locador, notas, avaliacao where (locador.idlocad=avaliacao.idlocad and avaliacao.idlocad=notas.idlocad
										  	and avaliacao.positiva=true);
select locador.nome, notas.notas
	from locador, notas, avaliacao where (locador.idlocad=avaliacao.idlocad and avaliacao.idlocad=notas.idlocad
										  	and avaliacao.negativa=true);
