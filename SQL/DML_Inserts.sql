INSERT INTO CodigoPostal (CodPostal, Localidade)
VALUES
('1000-001', 'Lisboa'),
('4000-123', 'Porto'),
('7000-567', 'Évora'),
('8000-321', 'Faro'),
('9000-654', 'Funchal');

INSERT INTO Estado (Descricao)
VALUES
('Ativo'),
('Inativo'),
('Em Manutenção'),
('Avariado'),
('Desativado');

INSERT INTO TipoEquipamento (Descricao)
VALUES
('Gerador'),
('Compressor de Ar'),
('Empilhadora'),
('Guindaste'),
('Máquina de Solda');

INSERT INTO MarcaEquipamento (Descricao)
VALUES
('Bosch'),
('Makita'),
('Caterpillar'),
('Hitachi'),
('Siemens');

INSERT INTO Equipamento (Nome, Descricao, TipoEquipamentoIdTipoEquipamento, MarcaEquipamentoIdMarcaEquipamento, EstadoIdEstado)
VALUES
('Gerador Diesel 2000W', 'Modelo GD2000W', 1, 1, 1),
('Compressor de Ar Industrial', 'Capacidade de 50L', 2, 2, 2),
('Empilhadora Elétrica 1 Ton', 'Carga máxima 1000kg', 3, 3, 3),
('Guindaste Hidráulico 5m', 'Alcance de 5 metros', 4, 4, 4),
('Máquina de Solda Inverter', 'Potência 160A', 5, 5, 5);


INSERT INTO Fornecedor (NomeFornecedor, Telemovel, Email, Rua, CodigoPostalIdCodpostal)
VALUES
('Fornecedor A', 912345678, 'fornecedora@gmail.com', 'Rua Principal, 123', 1),
('Fornecedor B', 912987654, 'fornecedorb@gmail.com', 'Avenida Central, 45', 2),
('Fornecedor C', 913456789, 'fornecedorc@gmail.com', 'Estrada Nacional, 8', 3),
('Fornecedor D', 914567890, 'fornecedord@gmail.com', 'Rua do Comércio, 67', 4),
('Fornecedor E', 915678901, 'fornecedore@gmail.com', 'Praça das Flores, 10', 5);

INSERT INTO GestaoPecas (Nome, Descricao, QuantidadeDisponivel, Custo, FornecedorIdFornecedor)
VALUES
('Parafuso M10', 'Parafuso de aço inoxidável', 100, 0.50, 1),
('Filtro de Óleo', 'Filtro para motores a diesel', 50, 15.00, 2),
('Correia Dentada', 'Correia para motor de 1.6L', 30, 25.00, 3),
('Pneu 175/65 R14', 'Pneu para veículos leves', 20, 60.00, 4),
('Óleo Lubrificante 5W30', 'Óleo sintético para motor', 10, 45.00, 5);

INSERT INTO TipoManutencao (Descricao)
VALUES
('Manutenção Preventiva'),
('Manutenção Corretiva'),
('Inspeção Periódica'),
('Reparação de Avaria'),
('Substituição de Componentes');

INSERT INTO Manutencao (DataInicio, DataFim, Custo, Descricao, TipoManutencaoIdTipoManutencao)
VALUES
('2025-01-01', '2025-01-03', 200.00, NULL, 1),
('2025-02-10', '2025-02-15', 500.00, NULL, 2),
('2025-03-05', '2025-03-06', 100.00, NULL, 3),
('2025-04-12', '2025-04-14', 300.00, NULL, 4),
('2025-05-20', '2025-05-22', 400.00, NULL, 5),
('2025-01-02', '2025-01-04', 600.00, NULL, 1),
('2025-01-10', '2025-01-12', 100.00, NULL, 2),
('2025-03-05', '2025-03-06', 200.00, NULL, 4),
('2025-04-12', '2025-04-14', 300.00, NULL, 4),
('2025-05-20', '2025-05-22', 400.00, NULL, 5);

INSERT INTO Oficina (NomeOficina, TelemóvelOficina, EmailOficina, Rua, CodigoPostalIdCodpostal)
VALUES
('Oficina Central', 912223334, 'oficina_central@gmail.com', 'Rua das Oficinas, 12', 1),
('Oficina Norte', 913334455, 'oficina_norte@gmail.com', 'Rua das Máquinas, 23', 2),
('Oficina Sul', 914445566, 'oficina_sul@gmail.com', 'Avenida dos Reparos, 34', 3),
('Oficina Este', 915556677, 'oficina_este@gmail.com', 'Travessa dos Engenheiros, 45', 4),
('Oficina Oeste', 916667788, 'oficina_oeste@gmail.com', 'Largo das Manutenções, 56', 5);

INSERT INTO OrdemServico (DataCriacao, Descricao, OficinaIdOficina, EstadoIdEstado)
VALUES
('2025-01-05', 'Revisão Geral de Equipamento', 1, 1),
('2025-02-12', 'Troca de Componentes', 2, 2),
('2025-03-15', 'Inspeção Anual', 3, 3),
('2025-04-20', 'Reparação de Avaria', 4, 4),
('2025-05-25', 'Instalação de Acessórios', 5, 5),
('2025-01-05', 'Revisão Geral de Equipamento', 2, 1),
('2025-02-12', 'Troca de Componentes', 1, 2),
('2025-03-15', 'Inspeção Anual', 2, 3),
('2025-04-20', 'Reparação de Avaria', 1, 4),
('2025-05-25', 'Instalação de Acessórios', 4, 5);

INSERT INTO TipoVeiculo (Descricao)
VALUES
('Camião'),
('Carro'),
('Mota'),
('Autocarro'),
('Trator');

INSERT INTO MarcaVeiculo (Descricao)
VALUES
('Toyota'),
('Ford'),
('Honda'),
('Mercedes-Benz'),
('Volvo');

INSERT INTO ModeloVeiculo (Descricao, MarcaVeiculoIdMarcaVeiculo)
VALUES
('Corolla', 1),
('Focus', 2),
('Civic', 3),
('Sprinter', 4),
('FH540', 5);

INSERT INTO TipoCombustível (Nome)
VALUES
('Gasolina'),
('Diesel'),
('Elétrico'),
('Híbrido'),
('GPL');

INSERT INTO Veiculo (Matricula, Kilometros, ModeloIdModelo, TipoVeiculoIdTipoVeiculo, EstadoIdEstado, TipoCombustívelIdTipoCombustivel)
VALUES
('AA-01-AA', 120000, 1, 2, 1, 1),
('BB-02-BB', 90000, 2, 1, 2, 2),
('CC-03-CC', 30000, 3, 3, 3, 3),
('DD-04-DD', 70000, 4, 4, 4, 4),
('EE-05-EE', 150000, 5, 5, 5, 5);


INSERT INTO VeiculoEquipamento (VeiculoIdVeiculo, EquipamentoIdEquipamento, Quantidade, DataInicio, DataFim)
VALUES
(1, 1, 2, '2025-01-01', '2025-12-31'),
(2, 2, 1, '2025-02-01', '2025-11-30'),
(3, 3, 4, '2025-03-01', '2025-10-31'),
(4, 4, 3, '2025-04-01', '2025-09-30'),
(5, 5, 2, '2025-05-01', '2025-08-31');


INSERT INTO GestaoPecasManutencao (ManutencaoIdManutencao, GestaoPecasIdPeca, Quantidade, DataUtilizacao)
VALUES
(1, 1, 10, '2025-01-05'),
(2, 2, 5, '2025-02-15'),
(3, 3, 8, '2025-03-25'),
(4, 4, 2, '2025-04-10'),
(5, 5, 6, '2025-05-20');

INSERT INTO OrdemServicoManutencao (OrdemServicoIdOrdemServico, ManutencaoIdManutencao)
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO VeiculoManutencao (VeiculoIdVeiculo, ManutencaoIdManutencao)
values
(1,1),
(1,6),
(1,7),
(1,8),
(2,2),
(2,9),
(2,10),
(3,3),
(4,4);

INSERT INTO EquipamentoManutencao (EquipamentoIdEquipamento, ManutencaoIdManutencao)
VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 7),
(3, 3),
(4, 4),
(4, 8),
(5, 5),
(5, 9),
(5, 10);
