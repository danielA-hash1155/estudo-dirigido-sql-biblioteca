SELECT livros.titulo,
    CASE
        WHEN emprestimos.data_devolucao IS NULL
            THEN 'Disponível'
        ELSE 'Emprestado'
    END AS Status
FROM livros
LEFT JOIN emprestimos
    ON livros.livro_id = emprestimos.livro_id;