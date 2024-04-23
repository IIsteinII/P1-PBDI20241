-- Active: 1712670173221@@127.0.0.1@5432@p1_pbdi20241
CREATE TABLE tb_wine(
cod_wine SERIAL PRIMARY KEY,
country  VARCHAR(200), 	
description VARCHAR(1000),
points INT ,
price  INT 	
);