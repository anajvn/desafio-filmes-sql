-- (1) Buscar o nome e ano dos filmes
SELECT Nome, Ano 
FROM Filmes;

-- (2) Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano 
FROM Filmes 
ORDER BY Ano ASC;

-- (3) Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao 
FROM Filmes
WHERE Nome='De volta para o futuro';

-- (4) Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Ano=1997;

-- (5) Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Ano >= 2000;

-- (6) Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Duracao>100 AND Duracao<150
ORDER BY Duracao ASC;

-- (7) Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(*) AS Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY SUM(Duracao) DESC;

-- (8) Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT primeironome, ultimonome
FROM Atores
WHERE genero = 'M';

-- (9) Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT primeironome, ultimonome
FROM Atores
WHERE genero = 'F'
ORDER By primeironome;

-- (10) Buscar o nome do filme e o gênero
SELECT Nome, Genero
FROM FilmesGenero
INNER JOIN Filmes ON Filmes.id = FilmesGenero.idfilme
INNER JOIN Generos ON Generos.id = FilmesGenero.idgenero;

-- (11) Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT F.Nome, G.Genero
FROM FilmesGenero FG
INNER JOIN Filmes F ON F.id = FG.idfilme
INNER JOIN Generos G ON G.id = FG.idgenero
WHERE Genero='Mistério';

-- (12) Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT F.Nome, A.PrimeiroNome, A.Ultimonome, EF.Papel
FROM ElencoFilme EF
INNER JOIN Filmes F ON F.id = EF.idfilme
INNER JOIN Atores A ON A.id = EF.IdAtor;