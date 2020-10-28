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
	

select * from locador;

UPDATE locador
SET login = 'CAIOM' 
WHERE idlocad = 11;
UPDATE locador
SET login = 'CAIOM' 
WHERE idlocad = 12;
UPDATE locador
SET login = 'BIAM' 
WHERE idlocad = 9;




