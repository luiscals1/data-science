SELECT 
	NS.LOJA_ID						as CodLoja,
	NS.PRODUTO_ID					as CodProduto,
	NS.DT_EMISSAO					as DataVenda,
	SUM(NS.QUANTIDADE * P.VALOR)	as ValorVenda, 
	SUM(NS.QUANTIDADE)				as QtdVenda

FROM NF_SAIDA NS 
LEFT JOIN PRECO P
ON NS.LOJA_ID = P.LOJA_ID
AND NS.PRODUTO_ID = P.PRODUTO_ID
WHERE NS.CANCELADO = 0
GROUP BY NS.LOJA_ID, NS.PRODUTO_ID, NS.DT_EMISSAO
