-- Active: 1712670173221@@127.0.0.1@5432@p1_pbdi20241
-- Base de dados e criação de tabela
CREATE TABLE tb_wine(
cod_wine SERIAL PRIMARY KEY,
country  VARCHAR(200), 	
description VARCHAR(1000),
points INT ,
price  INT 	
);

----2 Cursor não vinculado
--Calcular o preço médio dos vinhos de cada país utilizando um cursor não vinculado
DO $$
DECLARE
    -- 1. Declara cursor 
	cur_leitura REFCURSOR;
	tupla RECORD;
	media NUMERIC(10,2);
BEGIN
	-- 2. Abre o cursor  
	OPEN cur_leitura FOR  
    SELECT country, count(country) as quantidade, sum(price) as preco 
      FROM tb_wine
     WHERE country is NOT null
       AND price is NOT NULL 
     GROUP by country, price;
	-- loop para exibir itens
	LOOP
		FETCH FROM cur_leitura INTO tupla;
		EXIT WHEN NOT FOUND;
        media = tupla.preco / tupla.quantidade;   
        RAISE NOTICE '%, %', tupla.country, media; 
	END LOOP;
	-- 4. Fecha cursor
	CLOSE cur_leitura;
END;
$$