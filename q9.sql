SELECT livros.titulo, autores.nome, editoras.nome
FROM livros
INNER JOIN autores
    ON livros.autor_id = autores.autor_id
INNER JOIN editoras
    ON livros.editora_id = editoras.editora_id;