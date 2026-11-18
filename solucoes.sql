\-- ESTUDO DIRIGIDO 3 

USE biblioteca;

\-- Questão 1: SELECT
\-- Selecionar os títulos dos livros e seus anos de publicação.

SELECT titulo, ano_publicacao
FROM livros;

\-- Questão 2: COUNT
\-- Contar a quantidade total de livros cadastrados.

SELECT COUNT(\*) AS total_livros
FROM livros;

\-- Questão 3: AVG e GROUP BY
\-- Calcular a média do ano de publicação dos livros por editora.

SELECT editoras.nome, AVG(livros.ano_publicacao) AS media_publicacao
FROM livros
INNER JOIN editoras
ON livros.editora_id = editoras.editora_id
GROUP BY editoras.editora_id, editoras.nome;

\-- Questão 4: MAX e MIN
\-- Encontrar os livros mais antigo e mais recente.

(SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao ASC
LIMIT 1)

UNION ALL

(SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao DESC
LIMIT 1);

\-- Questão 5: WHERE
\-- Listar os livros publicados após o ano 2000.

SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao > 2000;

\-- Questão 6: ORDER BY
\-- Listar os autores em ordem alfabética.

SELECT \*
FROM autores
ORDER BY nome ASC;

\-- Questão 7: HAVING
\-- Mostrar as editoras que publicaram mais de dois livros.

SELECT editoras.nome, COUNT(livros.livro_id) AS total_livros
FROM editoras
INNER JOIN livros
ON editoras.editora_id = livros.editora_id
GROUP BY editoras.editora_id, editoras.nome
HAVING COUNT(livros.livro_id) > 2;

\-- Questão 8: CASE
\-- Mostrar o título do livro e seu status de disponibilidade (Disponível ou Emprestado).

SELECT livros.titulo,
CASE
WHEN emprestimos.data_devolucao IS NULL
THEN 'Disponível'
ELSE 'Emprestado'
END AS Status
FROM livros
LEFT JOIN emprestimos
ON livros.livro_id = emprestimos.livro_id;

\-- Questão 9: INNER JOIN
\-- Mostrar o título do livro, o nome do autor e o nome da editora.

SELECT livros.titulo,
autores.nome AS autor,
editoras.nome AS editora
FROM livros
INNER JOIN autores
ON livros.autor_id = autores.autor_id
INNER JOIN editoras
ON livros.editora_id = editoras.editora_id;

\-- Questão 10: LEFT JOIN e WHERE
\-- Encontrar os livros que não possuem autor cadastrado.

SELECT livros.titulo
FROM livros
LEFT JOIN autores
ON livros.autor_id = autores.autor_id
WHERE autores.autor_id IS NULL;
