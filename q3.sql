SELECT editoras.nome, AVG(livros.ano_publicacao) AS media_publicacao
FROM livros
INNER JOIN editoras
    ON livros.editora_id = editoras.editora_id
GROUP BY editoras.nome;