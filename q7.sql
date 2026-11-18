SELECT editoras.nome, COUNT(livros.livro_id) AS total_livros
FROM editoras
INNER JOIN livros
    ON editoras.editora_id = livros.editora_id
GROUP BY editoras.nome
HAVING COUNT(livros.livro_id) > 2;