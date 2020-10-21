/* Views uteis*/
create view listaCasa as
	select locador.nome, imovel.valor,locador.telefone1, locador.telefone2
		from locador, imovel, casa 
		where (locador.idimovel= imovel.idimovel  and imovel.idimovel= casa.idimovel);
	
create view listaAP as
	select locador.nome, imovel.valor, locador.telefone1, locador.telefone2
		from locador, imovel, apartamento 
		where (locador.idimovel= imovel.idimovel  and imovel.idimovel= apartamento.idimovel);
		

/*Função que retorna todos os imoveis de um determinado locador*/
CREATE FUNCTION buscaLocador(nomeP VARCHAR) RETURNS TABLE (nome VARCHAR,
											 telefone1 VARCHAR,
											 telefone2 VARCHAR,
											 preco_Imovel numeric) AS $$
BEGIN
	RETURN QUERY select l.nome , l.telefone1, l.telefone2,im.valor  from locador as l, imovel as im
						where l.nome = nomeP and l.idimovel = im.idimovel;
	RETURN;
END;
$$ LANGUAGE 'plpgsql';

select * FROM buscaLocador('JOAO CARLOS');

/* deletar vai ser apenas uma query não tera função
*/

select * from avaliacao;

select * from locador;


/**
    criando users

*/


create role Adm  WITH PASSWORD 'Admin000';
create role Usuario ; 


/*Triggers*/
CREATE FUNCTION imovel_gatilho() RETURNS trigger AS $imovel_gatilho$
    BEGIN
        IF NEW.cep IS NULL THEN
            RAISE EXCEPTION 'O cep não pode ser nulo';
        END IF;
		
        IF NEW.rua IS NULL THEN
            RAISE EXCEPTION 'Por favor insira o nome da rua';
        END IF;
		
		IF NEW.bairro IS NULL THEN
            RAISE EXCEPTION 'Por favor insira o nome do bairro';
        END IF;
		
		IF NEW.cidade IS NULL THEN
            RAISE EXCEPTION 'Por favor insira o nome da cidade';
        END IF;
		
		IF NEW.estado IS NULL THEN
            RAISE EXCEPTION 'Por favor insira o nome do estado';
        END IF;

        IF NEW.valor < 0 THEN
            RAISE EXCEPTION 'O imovel não pode ter um valor negativo';
        END IF;
 
        RETURN NEW;
    END;
$imovel_gatilho$ LANGUAGE plpgsql;

CREATE TRIGGER imovel_gatilho BEFORE INSERT ON imovel
    FOR EACH ROW EXECUTE PROCEDURE imovel_gatilho();
	
	




