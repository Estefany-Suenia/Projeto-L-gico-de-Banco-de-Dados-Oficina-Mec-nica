CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(10),
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(50)
);

CREATE TABLE OrdemServico (
    id_ordem INT PRIMARY KEY,
    data_abertura DATE,
    data_fechamento DATE,
    id_veiculo INT,
    id_mecanico INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY,
    descricao VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE ItemServico (
    id_item INT PRIMARY KEY,
    id_ordem INT,
    id_servico INT,
    quantidade INT,
    FOREIGN KEY (id_ordem) REFERENCES OrdemServico(id_ordem),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE ItemPeca (
    id_item INT PRIMARY KEY,
    id_ordem INT,
    id_peca INT,
    quantidade INT,
    FOREIGN KEY (id_ordem) REFERENCES OrdemServico(id_ordem),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);
