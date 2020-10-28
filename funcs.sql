
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


