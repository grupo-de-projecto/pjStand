
data Automovel = Carro | Moto     --Dados dos Automoveis
type Codigo = String
type Nome= String
type Preco= Double
data Categoria= Ligeiro|Pesado
data Marca= Toyota|Volvo|Jaguar|Bmw|Honda

type Carro=(Codigo,Nome,Preco,Categoria,Marca)
type Moto=(Codigo,Nome,Preco,Categoria,Marca) ---Ate Aqui

type Cliente=(Nome,Telefone)  --Cliente
type Telefone= Int    --Ate aqui

type Factura=(Codigo,Cliente,Data) --Factura
type Data=(Dia,Mes,Ano)
type Dia=Int  --Ate Aqui
type Mes=Int
type Ano=Int --Ate Aqui



