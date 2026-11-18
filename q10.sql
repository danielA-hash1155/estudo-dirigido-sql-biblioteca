SELECT livros.titulo
FROM livros
LEFT JOIN autores
    ON livros.autor_id = autores.autor_id
WHERE autores.autor_id IS NULL;