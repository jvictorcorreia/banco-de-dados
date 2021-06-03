/* ATV 3 BANCO DE DADOS*/


/*1 PERGUNTA:*/

DELIMITER $$
CREATE FUNCTION Aluno_cad(codigo_curso INT, 
	aluno_nascimentodt DATE, 
    tot_cred INT, 
    mgp DOUBLE(10,2), 
    aluno_nome VARCHAR(60), 
    aluno_email VARCHAR(30))
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	INSERT INTO aluno(codigo_curso,
		aluno_nascimentodt, 
        tot_cred, 
        mgp, 
        aluno_nome, 
        aluno_email) VALUES(codigo_curso,
		aluno_nascimentodt, 
        tot_cred, 
        mgp, 
        aluno_nome, 
        aluno_email);
	RETURN aluno_nome;
END$$
DELIMITER ;

SELECT Aluno_cad(Null, '2002-02-15', 55, 10, 'correia', 'joaovictor.victor384@gmail.com') AS Nome_do_Aluno;
 

/*-----------*/
/*2 PERGUNTA:*/

DELIMITER //
CREATE PROCEDURE acumulador()
BEGIN
declare cont tinyint unsigned default 1;
declare string varchar(30) default "";
WHILE cont < 6 DO
	set string = concat(string, cont, ",");
    SET cont = cont + 1;
END WHILE;
select string;
END//
DELIMITER ;

CALL acumulador();
/*-------------------------------------------------------*/

/*3 PERUNTA*/

delimiter $$
create procedure repete_acumulador()
begin
	declare resultado  varchar (30) default "";
    declare soma int default 1  ;
    repeat
		set resultado = concat(resultado, soma, "," );
        set soma = soma + 1;
        until soma > 9
    end repeat;
    select resultado;
end $$
delimiter ; 

call repete_acumulador();

/*FIM DA QUESTÃO 3*/