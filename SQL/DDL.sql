create database AAD_Bombeiros;

use AAD_Bombeiros;

CREATE TABLE CodigoPostal (
  IdCodpostal INT IDENTITY(1,1) PRIMARY KEY,
  CodPostal VARCHAR(255) NOT NULL,
  Localidade VARCHAR(255) NOT NULL
);

CREATE TABLE Estado (
  IdEstado INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE TipoEquipamento (
  IdTipoEquipamento INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE MarcaEquipamento (
  IdMarcaEquipamento INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE TipoManutencao (
  IdTipoManutencao INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE TipoVeiculo (
  IdTipoVeiculo INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL
);

CREATE TABLE TipoCombustível (
  IdTipoCombustivel INT IDENTITY(1,1) PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL
);

CREATE TABLE MarcaVeiculo (
  IdMarcaVeiculo INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NULL
);

CREATE TABLE ModeloVeiculo (
  IdModelo INT IDENTITY(1,1) PRIMARY KEY,
  Descricao VARCHAR(255) NULL,
  MarcaVeiculoIdMarcaVeiculo INT NOT NULL,
  CONSTRAINT FK_ModeloVeiculo_MarcaVeiculo FOREIGN KEY (MarcaVeiculoIdMarcaVeiculo) REFERENCES MarcaVeiculo (IdMarcaVeiculo)
);

CREATE TABLE Equipamento (
  IdEquipamento INT IDENTITY(1,1) PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Descricao VARCHAR(255) NULL,
  TipoEquipamentoIdTipoEquipamento INT NOT NULL,
  MarcaEquipamentoIdMarcaEquipamento INT NOT NULL,
  EstadoIdEstado INT NOT NULL,
  CONSTRAINT FK_Equipamento_TipoEquipamento FOREIGN KEY (TipoEquipamentoIdTipoEquipamento) REFERENCES TipoEquipamento (IdTipoEquipamento),
  CONSTRAINT FK_Equipamento_MarcaEquipamento FOREIGN KEY (MarcaEquipamentoIdMarcaEquipamento) REFERENCES MarcaEquipamento (IdMarcaEquipamento),
  CONSTRAINT FK_Equipamento_Estado FOREIGN KEY (EstadoIdEstado) REFERENCES Estado (IdEstado)
);

CREATE TABLE Oficina (
  IdOficina INT IDENTITY(1,1) PRIMARY KEY,
  NomeOficina VARCHAR(255) NOT NULL,
  TelemóvelOficina NUMERIC(19,0) NULL,
  EmailOficina VARCHAR(255) NULL,
  Rua VARCHAR(255) NULL,
  CodigoPostalIdCodpostal INT NOT NULL,
  CONSTRAINT FK_Oficina_CodigoPostal FOREIGN KEY (CodigoPostalIdCodpostal) REFERENCES CodigoPostal (IdCodpostal)
);

CREATE TABLE Fornecedor (
  IdFornecedor INT IDENTITY(1,1) PRIMARY KEY,
  NomeFornecedor VARCHAR(255) NOT NULL,
  Telemovel NUMERIC(19,0) NULL,
  Email VARCHAR(255) NULL,
  Rua VARCHAR(255) NULL,
  CodigoPostalIdCodpostal INT NOT NULL,
  CONSTRAINT FK_Fornecedor_CodigoPostal FOREIGN KEY (CodigoPostalIdCodpostal) REFERENCES CodigoPostal (IdCodpostal)
);

CREATE TABLE GestaoPecas (
  IdPeca INT IDENTITY(1,1) PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Descricao VARCHAR(255) NULL,
  QuantidadeDisponivel INT NULL,
  Custo DECIMAL(19,0) NOT NULL,
  FornecedorIdFornecedor INT NOT NULL,
  CONSTRAINT FK_GestaoPecas_Fornecedor FOREIGN KEY (FornecedorIdFornecedor) REFERENCES Fornecedor (IdFornecedor)
);

CREATE TABLE Manutencao (
  IdManutencao INT IDENTITY(1,1) PRIMARY KEY,
  DataInicio DATE NOT NULL,
  DataFim DATE NOT NULL,
  Custo DECIMAL(19,0) NULL,
  Descricao INT NULL,
  TipoManutencaoIdTipoManutencao INT NOT NULL,
  CONSTRAINT FK_Manutencao_TipoManutencao FOREIGN KEY (TipoManutencaoIdTipoManutencao) REFERENCES TipoManutencao (IdTipoManutencao)
);

CREATE TABLE OrdemServico (
  IdOrdemServico INT IDENTITY(1,1) PRIMARY KEY,
  DataCriacao DATE NOT NULL,
  Descricao VARCHAR(255) NOT NULL,
  OficinaIdOficina INT NOT NULL,
  EstadoIdEstado INT NOT NULL,
  CONSTRAINT FK_OrdemServico_Oficina FOREIGN KEY (OficinaIdOficina) REFERENCES Oficina (IdOficina),
  CONSTRAINT FK_OrdemServico_Estado FOREIGN KEY (EstadoIdEstado) REFERENCES Estado (IdEstado)
);

CREATE TABLE Veiculo (
  IdVeiculo INT IDENTITY(1,1) PRIMARY KEY,
  Matricula VARCHAR(8) NOT NULL,
  Kilometros INT NULL,
  ModeloIdModelo INT NOT NULL,
  TipoVeiculoIdTipoVeiculo INT NOT NULL,
  EstadoIdEstado INT NOT NULL,
  TipoCombustívelIdTipoCombustivel INT NOT NULL,
  CONSTRAINT FK_Veiculo_TipoVeiculo FOREIGN KEY (TipoVeiculoIdTipoVeiculo) REFERENCES TipoVeiculo (IdTipoVeiculo),
  CONSTRAINT FK_Veiculo_Estado FOREIGN KEY (EstadoIdEstado) REFERENCES Estado (IdEstado),
  CONSTRAINT FK_Veiculo_TipoCombustivel FOREIGN KEY (TipoCombustívelIdTipoCombustivel) REFERENCES TipoCombustível (IdTipoCombustivel),
  CONSTRAINT FK_Veiculo_Modelo FOREIGN KEY (ModeloIdModelo) REFERENCES ModeloVeiculo (IdModelo)
);

CREATE TABLE EquipamentoManutencao (
  EquipamentoIdEquipamento INT NOT NULL,
  ManutencaoIdManutencao INT NOT NULL,
  PRIMARY KEY (EquipamentoIdEquipamento, ManutencaoIdManutencao),
  CONSTRAINT FK_EquipamentoManutencao_Equipamento FOREIGN KEY (EquipamentoIdEquipamento) REFERENCES Equipamento (IdEquipamento),
  CONSTRAINT FK_EquipamentoManutencao_Manutencao FOREIGN KEY (ManutencaoIdManutencao) REFERENCES Manutencao (IdManutencao)
);

CREATE TABLE GestaoPecasManutencao (
  IdGestaoPecasManutencao INT IDENTITY(1,1) NOT NULL,
  ManutencaoIdManutencao INT NOT NULL,
  GestaoPecasIdPeca INT NOT NULL,
  Quantidade INT NULL,
  DataUtilizacao DATE NOT NULL,
  PRIMARY KEY (IdGestaoPecasManutencao, ManutencaoIdManutencao, GestaoPecasIdPeca),
  CONSTRAINT FK_GestaoPecasManutencao_Manutencao FOREIGN KEY (ManutencaoIdManutencao) REFERENCES Manutencao (IdManutencao),
  CONSTRAINT FK_GestaoPecasManutencao_GestaoPecas FOREIGN KEY (GestaoPecasIdPeca) REFERENCES GestaoPecas (IdPeca)
);

CREATE TABLE VeiculoManutencao (
  VeiculoIdVeiculo INT NOT NULL,
  ManutencaoIdManutencao INT NOT NULL,
  PRIMARY KEY (VeiculoIdVeiculo, ManutencaoIdManutencao),
  CONSTRAINT FK_VeiculoManutencao_Veiculo FOREIGN KEY (VeiculoIdVeiculo) REFERENCES Veiculo (IdVeiculo),
  CONSTRAINT FK_VeiculoManutencao_Manutencao FOREIGN KEY (ManutencaoIdManutencao) REFERENCES Manutencao (IdManutencao)
);

CREATE TABLE VeiculoEquipamento (
  IdVeiculoEquipamento INT IDENTITY(1,1) NOT NULL,
  VeiculoIdVeiculo INT NOT NULL,
  EquipamentoIdEquipamento INT NOT NULL,
  Quantidade INT NULL,
  DataInicio DATE NOT NULL,
  DataFim DATE NOT NULL,
  PRIMARY KEY (IdVeiculoEquipamento, VeiculoIdVeiculo, EquipamentoIdEquipamento),
  CONSTRAINT FK_VeiculoEquipamento_Veiculo FOREIGN KEY (VeiculoIdVeiculo) REFERENCES Veiculo (IdVeiculo),
  CONSTRAINT FK_VeiculoEquipamento_Equipamento FOREIGN KEY (EquipamentoIdEquipamento) REFERENCES Equipamento (IdEquipamento)
);

CREATE TABLE OrdemServicoManutencao (
  OrdemServicoIdOrdemServico INT NOT NULL,
  ManutencaoIdManutencao INT NOT NULL,
  PRIMARY KEY (OrdemServicoIdOrdemServico, ManutencaoIdManutencao),
  CONSTRAINT FK_OrdemServicoManutencao_OrdemServico FOREIGN KEY (OrdemServicoIdOrdemServico) REFERENCES OrdemServico (IdOrdemServico),
  CONSTRAINT FK_OrdemServicoManutencao_Manutencao FOREIGN KEY (ManutencaoIdManutencao) REFERENCES Manutencao (IdManutencao)
);
