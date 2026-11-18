(SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao ASC
LIMIT 1)

UNION ALL

(SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao DESC
LIMIT 1);