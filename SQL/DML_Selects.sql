--Atualização do Telemóvel de Fornecedor
UPDATE Fornecedor
SET Telemovel = '900100200'
WHERE IdFornecedor = 1;

--Atualização da quantidade disponível de peça
UPDATE GestaoPecas
SET QuantidadeDisponivel = 150
WHERE IdPeca = 2;

--Eliminar um tipo de combustível. Não executar o código em baixo (serve apenas para demonstracao)
--DELETE FROM TipoCombustível
--WHERE Nome = 'GPL';

--Peças com quantidade disponível maior que 50
SELECT Nome, QuantidadeDisponivel 
FROM GestaoPecas
WHERE QuantidadeDisponivel > 50;

--Consultar Matrículas e Modelos de Veículos
SELECT Veiculo.Matricula, ModeloVeiculo.Descricao AS Modelo
FROM Veiculo
INNER JOIN ModeloVeiculo
ON Veiculo.ModeloIdModelo = ModeloVeiculo.IdModelo;

--Consultar Nomes de Oficinas e Códigos Postais
SELECT Oficina.NomeOficina, CodigoPostal.CodPostal
FROM Oficina
LEFT JOIN CodigoPostal
ON Oficina.CodigoPostalIdCodpostal = CodigoPostal.IdCodpostal;

--Consultar Estados e Matrículas de Veículos
SELECT Estado.Descricao AS Estado, Veiculo.Matricula
FROM Estado
RIGHT JOIN Veiculo
ON Estado.IdEstado = Veiculo.EstadoIdEstado;

--Contar Veículos por Estado
SELECT 
    e.Descricao AS NomeEstado, 
    COUNT(v.IdVeiculo) AS TotalVeiculos
FROM Veiculo v
JOIN Estado e ON v.EstadoIdEstado = e.IdEstado
GROUP BY e.Descricao;

--Contar Ordens de Serviço por Oficina
SELECT 
    o.NomeOficina AS NomeOficina, 
    COUNT(os.IdOrdemServico) AS TotalOrdens
FROM OrdemServico os
JOIN Oficina o ON os.OficinaIdOficina = o.IdOficina
GROUP BY o.NomeOficina;

--Consultar os modelos de veículos e as respetivas marcas
SELECT ModelV.Descricao AS 'Descrição do Modelo', MarcaV.Descricao AS 'Descrição da Marca'
FROM ModeloVeiculo ModelV
JOIN MarcaVeiculo MarcaV ON ModelV.MarcaVeiculoIdMarcaVeiculo = MarcaV.IdMarcaVeiculo;

--Consultar as peças disponíveis com fornecedor
SELECT GP.Nome, GP.Descricao AS Descrição, GP.QuantidadeDisponivel AS 'Quantidade Disponível', GP.Custo, F.NomeFornecedor AS 'Nome do Fornecedor',
	F.Telemovel AS 'Telemóvel', F.Email
FROM GestaoPecas GP
JOIN Fornecedor F ON GP.FornecedorIdFornecedor = F.IdFornecedor;

--Consultar os equipamentos, com tipo, marca e estado
SELECT EQUIP.Nome, EQUIP.Descricao AS Descrição, TE.Descricao AS 'Tipo de Equipamento', ME.Descricao AS Marca, Est.Descricao AS Estado
FROM Equipamento EQUIP
JOIN TipoEquipamento TE ON EQUIP.TipoEquipamentoIdTipoEquipamento = TE.IdTipoEquipamento
JOIN MarcaEquipamento ME ON EQUIP.MarcaEquipamentoIdMarcaEquipamento = ME.IdMarcaEquipamento
JOIN Estado EST ON EQUIP.EstadoIdEstado = EST.IdEstado;

--Consultar veículos com um estado específico
SELECT V.Matricula, V.Kilometros, TV.Descricao AS 'Tipo de Veículo', Est.Descricao AS Estado, TC.Nome AS Combustível
FROM Veiculo V
JOIN TipoVeiculo TV ON V.TipoVeiculoIdTipoVeiculo = TV.IdTipoVeiculo
JOIN Estado EST ON V.EstadoIdEstado = Est.IdEstado
JOIN TipoCombustível TC ON V.TipoCombustívelIdTipoCombustivel = TC.IdTipoCombustivel
Where upper(EST.Descricao) like upper ('ati%');

--Consultar as manutenções com um tipo específico:
SELECT M.IdManutencao AS ID, M.DataInicio AS 'Data de Início', M.DataFim AS 'Data Fim', M.Custo, TM.Descricao AS 'Tipo de Manutenção'
FROM Manutencao M
JOIN TipoManutencao TM ON M.TipoManutencaoIdTipoManutencao = TM.IdTipoManutencao
Where TM.Descricao='Inspeção Periódica';

--Consultar veículo com mais manutenções
SELECT TOP 1 
    V.IdVeiculo AS ID, V.Matricula, COUNT(VM.VeiculoIdVeiculo) AS 'Total de Manutenções'
FROM Veiculo V
JOIN VeiculoManutencao VM ON V.IdVeiculo = VM.VeiculoIdVeiculo
GROUP BY V.IdVeiculo, V.Matricula, VM.VeiculoIdVeiculo
ORDER BY COUNT(VM.VeiculoIdVeiculo) DESC;

--Consultar as duas oficinas com mais manutenções
SELECT TOP 2
    O.NomeOficina AS Nome, COUNT(OS.OficinaIdOficina) AS 'Total de Manutenções'
FROM Oficina O
JOIN OrdemServico OS ON O.IdOficina = OS.OficinaIdOficina
JOIN OrdemServicoManutencao OSM ON OS.IdOrdemServico = OSM.OrdemServicoIdOrdemServico
GROUP BY O.NomeOficina
ORDER BY COUNT(OS.OficinaIdOficina) DESC;


--Consulta a ordem de serviço menos utilizada
SELECT os.IdOrdemServico AS ID, os.Descricao AS Descrição, COUNT(osm.ManutencaoIdManutencao) AS 'Total de Utilizações'
FROM OrdemServico os
LEFT JOIN OrdemServicoManutencao osm ON os.IdOrdemServico = osm.OrdemServicoIdOrdemServico
GROUP BY os.IdOrdemServico, os.Descricao
HAVING COUNT(osm.ManutencaoIdManutencao) = (
SELECT MIN(Utilizacoes)
    FROM (SELECT COUNT(osm.ManutencaoIdManutencao) AS Utilizacoes
        FROM OrdemServico os
        LEFT JOIN OrdemServicoManutencao osm ON os.IdOrdemServico = osm.OrdemServicoIdOrdemServico
        GROUP BY os.IdOrdemServico) AS MinUtilizacoes);

--Média de manutenções dos veículos com um determinado tipo de veículo
SELECT 
    TV.Descricao AS 'Tipo de Veículo',
    AVG(ContarManut.TotalManutencoes) AS 'Média de Manutenções'
FROM TipoVeiculo TV
JOIN Veiculo V ON TV.IdTipoVeiculo = V.TipoVeiculoIdTipoVeiculo
LEFT JOIN (
	SELECT 
        V2.IdVeiculo,
        COUNT(VM.ManutencaoIdManutencao) AS TotalManutencoes
    FROM Veiculo V2
    LEFT JOIN VeiculoManutencao VM ON V2.IdVeiculo = VM.VeiculoIdVeiculo
    GROUP BY V2.IdVeiculo) AS ContarManut ON V.IdVeiculo = ContarManut.IdVeiculo
WHERE TV.Descricao = 'Carro'
GROUP BY TV.Descricao;
