/*

    Para a nossa Escola de Artes Marciais podemos destacar entre várias aplicações úteis, necessárias ou importantes para tomadas de decisão, três casos. Podemos evidenciar um caso de funções de agregação ou agrupamento, que apesar de simples de implementar, de suma importância para qualquer empresa se manter em dia com obrigações financeiras: a despesas total gasta com funcionários, o total de salário a ser pago. A partir da tabela ‘pagamento’, podemos usar o comando ‘SELECT’ com a função de agregação ‘SUM’.

# despesa_funcionario
'21695.83'

*/

SELECT SUM(salario) AS despesa_funcionario FROM mentorama_ma.funcionario;

/*

    Outra importante utilidade para nosso banco de dados é o simples fato de armazenar dados relevantes para o negócio, nossa Mentorama MA. Temos uma entidade na nossa escola, uma das principais, que é nosso aluno. Temos a tabela ‘aluno’, que serve para o cadastro de todos os alunos na nossa escola, independente de turma. Porém, em sequência, temos que cadastrar nosso aluno em alguma turma de alguma modalidade. No nosso modelo de negócio, temos o cadastro dos alunos na turmas utilizando apenas o seu identificador. Isso nos proporciona uma maior agilidade e maior confiança na veracidade dos dados, pois, por exemplo, temos que digitar o nome completo do aluno apenas uma vez, no momento de seu cadastro na Escola, e não novamente no cadastro da turma, evitando assim, a chance que ocorram erros. Outro fator importante é evitar a redundância de dados, ou seja, evitar que termos a mesma informação armazenada em duas tabelas diferentes. Assim, podemos recuperar esses dados com funções de relacionamento, por exemplo os comandos de ‘INNER JOIN’.
	Com o objetivo de avaliar os alunos de sua turma, para analisar aqueles que estão aptos a passarem de faixa, um professor deseja visualizar o nome completo de seus alunos (para confeccionar diplomas de graduação a novas faixas), a atual faixa que estão, e desde quando estão treinando na Escola, afinal, um dos critérios de avaliação é o tempo que já estão treinando. Podemos então utilizar os comandos ‘SELECT’ para visualizar os dados, a cláusula ‘WHERE’ para restringir por professor e o comando ‘INNER JOIN’ para voltar o nome completo de cada aluno.

O professor Tore quer verificar quem são os seus alunos nestas condições, logo poderemos verificar:

# id_aluno, nome, faixa, data_inicio, nome_professor
'5', 'Marice Quiddington', 'Roxa', '2014-08-11', 'Tore McMychem'
'7', 'Kirbie McMillan', 'Marrom', '2012-02-15', 'Tore McMychem'
'9', 'Savina Emsden', 'Azul', '2018-05-14', 'Tore McMychem'
'15', 'Shannah Griffey', 'Branca', '2022-07-01', 'Tore McMychem'
'19', 'Pernell Abbets', 'Roxa', '2014-10-29', 'Tore McMychem'
'22', 'Patience Serrels', 'Roxa', '2013-04-18', 'Tore McMychem'
'23', 'Jaquenette Catcheside', 'Azul', '2018-02-25', 'Tore McMychem'
'26', 'Veronika Heis', 'Preta', '2010-03-24', 'Tore McMychem'
'28', 'Edwin Jeyness', 'Roxa', '2013-01-15', 'Tore McMychem'

*/

SELECT jiu_jitsu.id_aluno, aluno.nome, faixa, data_inicio, funcionario.nome AS nome_professor
 FROM mentorama_ma.jiu_jitsu
       INNER JOIN aluno
       ON aluno.id_aluno = jiu_jitsu.id_aluno
       INNER JOIN professor
       ON professor.id_professor = jiu_jitsu.id_professor
       INNER JOIN funcionario
       ON funcionario.id_funcionario = professor.id_funcionario
	WHERE jiu_jitsu.id_professor = 2;
	
/*

Com o objetivo de avaliar os alunos de sua turma, para analisar aqueles que estão aptos a passarem de faixa, um professor deseja visualizar o nome completo de seus alunos (para confeccionar diplomas de graduação a novas faixas), a atual faixa que estão, e desde quando estão treinando na Escola, afinal, um dos critérios de avaliação é o tempo que já estão treinando. Podemos então utilizar os comandos ‘SELECT’ para visualizar os dados, a cláusula ‘WHERE’ para restringir por professor e o comando ‘INNER JOIN’ para voltar o nome completo de cada aluno.
	Outro objetivo financeiro e de utilidade estratégica é verificar a quantidade de alunos por turma, separados por planos ou pacotes, sendo necessário ver de forma individual, ou seja, não apenas a quantidade, como seria utilizando funções de agregação ou agrupamento. Para isso podemos utilizar funções de janela ‘ROW_NUMBER()’ para ter este padrão de análise. Na consulta a seguir, temos de forma individual, os alunos da turma de jiu jitsu classificados por plano de pagamento (mensal, semestral e anual) e ordenados por 'id_turma', ou seja, em ordem de quem entrou primeiro na turma até quem entrou por último, porém dentro de cada grupo de pagamento. Ou seja, podemos analisar de forma individual a quantidade de alunos por plano de pagamento, em uma mesma consulta. Podemos analisar que no plano mensal temos 7 alunos, semestral temos 9 e anual temos 5. Isso pode nos ajudar a definir qual o perfil de pagamento de nossos alunos, nos dando base para possíveis planos de marketing para incentivar ou mudar o perfil de pagamento.
	
# ROW_NUMBER() OVER (PARTITION BY aux.plano ORDER BY aux.id_turma), plano, nome, faixa, data_inicio
'1', '1 - Mensal', 'Virgina Landy', 'Branca', '2021-09-18'
'2', '1 - Mensal', 'Kassia Leworthy', 'Branca', '2022-04-08'
'3', '1 - Mensal', 'Jasmine Eriksson', 'Branca', '2021-01-27'
'4', '1 - Mensal', 'Marrissa Casetta', 'Branca', '2020-12-08'
'5', '1 - Mensal', 'Shannah Griffey', 'Branca', '2022-07-01'
'6', '1 - Mensal', 'Eliot Lednor', 'Branca', '2022-05-10'
'7', '1 - Mensal', 'Winna Langdridge', 'Branca', '2022-06-22'
'1', '2 - Semestral', 'Ally Grevatt', 'Branca', '2020-11-27'
'2', '2 - Semestral', 'Savina Emsden', 'Azul', '2018-05-14'
'3', '2 - Semestral', 'Abramo Oldred', 'Roxa', '2015-06-25'
'4', '2 - Semestral', 'Pernell Abbets', 'Roxa', '2014-10-29'
'5', '2 - Semestral', 'Jaquenette Catcheside', 'Azul', '2018-02-25'
'6', '2 - Semestral', 'Joelly Magee', 'Branca', '2019-08-11'
'7', '2 - Semestral', 'Edwin Jeyness', 'Roxa', '2013-01-15'
'8', '2 - Semestral', 'Devina Bercevelo', 'Roxa', '2013-01-20'
'9', '2 - Semestral', 'Kariotta Jaegar', 'Marrom', '2011-07-29'
'1', '3 - Anual', 'Marice Quiddington', 'Roxa', '2014-08-11'
'2', '3 - Anual', 'Kirbie McMillan', 'Marrom', '2012-02-15'
'3', '3 - Anual', 'Bordie Kos', 'Preta', '2011-02-01'
'4', '3 - Anual', 'Patience Serrels', 'Roxa', '2013-04-18'
'5', '3 - Anual', 'Veronika Heis', 'Preta', '2010-03-24'

*/

WITH aux AS (
	SELECT (CASE
				WHEN plano = 'M' THEN '1 - Mensal'
                WHEN plano = 'S' THEN '2 - Semestral'
                WHEN plano = 'A' THEN '3 - Anual'
			END) AS plano,
            id_turma
			FROM mentorama_ma.jiu_jitsu
)

SELECT ROW_NUMBER() OVER (PARTITION BY aux.plano ORDER BY aux.id_turma), aux.plano, aluno.nome, faixa, data_inicio
 FROM mentorama_ma.jiu_jitsu
	   INNER JOIN aux
       ON jiu_jitsu.id_turma = aux.id_turma
       INNER JOIN aluno
       ON aluno.id_aluno = jiu_jitsu.id_aluno;

