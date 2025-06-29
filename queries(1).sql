-- Total de serviços por mecânico
SELECT m.nome, COUNT(os.id_ordem) AS total_ordens
FROM Mecanico m
JOIN OrdemServico os ON m.id_mecanico = os.id_mecanico
GROUP BY m.nome;

-- Ordens de serviço abertas
SELECT * FROM OrdemServico WHERE data_fechamento IS NULL;

-- Valor total dos serviços por ordem
SELECT os.id_ordem, SUM(s.preco * isv.quantidade) AS total_servicos
FROM OrdemServico os
JOIN ItemServico isv ON os.id_ordem = isv.id_ordem
JOIN Servico s ON isv.id_servico = s.id_servico
GROUP BY os.id_ordem;

-- Ordens com mais de 1 peça usada
SELECT os.id_ordem, COUNT(ip.id_peca) AS qtd_pecas
FROM OrdemServico os
JOIN ItemPeca ip ON os.id_ordem = ip.id_ordem
GROUP BY os.id_ordem
HAVING COUNT(ip.id_peca) > 1;
