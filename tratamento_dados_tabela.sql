CREATE TABLE Produtos_final (
	ID INT,
	Nome VARCHAR(250),
	Price VARCHAR(250),
	Id_Category INT
)

CREATE VIEW Produtos_corrigido AS
SELECT 
	ID, 
	Nome, 
	'R$ ' + CAST(CAST(Price AS DECIMAL(10, 2)) AS VARCHAR(20)) AS Price_var,
	Id_Category
FROM Produtos

INSERT INTO Produtos_final (ID, Nome, Price, Id_Category)
SELECT ID, Nome, Price_var, Id_Category
FROM Produtos_corrigido;

SELECT * FROM Produtos_final

