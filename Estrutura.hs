module Estrutura where

data Tipo = Carro | Moto deriving(Show,Eq,Read)
data Marca = Volvo | Toyota | Jaguar | Bmw | Honda deriving(Show,Eq,Read)
data Categoria = Ligeiro | Pesado deriving(Show,Eq,Read)

type Codigo = Int
type Nome = String
type Preco = Double
type Telefone = Int
type Dia = Int
type Mes = Int
type Ano = Int
type Quantidade = Int 
type PrecoUnitario = Double
type Subtotal = Double
type Total = Double
type ValorPago = Double
type Troco = Double


type Automovel = (Codigo, Nome, Preco, Categoria, Marca, Tipo)
type Automoveis=[Automovel]
type Cliente = (Nome, Telefone)
type Data = String


type LinhaFactura = (Codigo, PrecoUnitario, Quantidade, Subtotal)

type LinhasFacturas = [LinhaFactura]

type Factura = (Codigo, LinhasFacturas, Total, ValorPago, Troco, Data)

type Facturas = [Factura]

type FacturaFich=(Codigo,Nome,Nome,PrecoUnitario,Quantidade,Sub_Total,Total,ValorPago,Troco,Tipo,Marca,Categoria,Telefone,String)
type FacturasFich=[FacturaFich]


automovel1=(1,"ricardo",12.43,Ligeiro,Jaguar,Carro)
automovel2=(2,"ricardo neves",12.43,Ligeiro,Toyota,Carro)
automovel3=(3,"Mingota",12.43,Ligeiro,Bmw,Carro)
automovel4=(4,"Teste",12.43,Ligeiro,Honda,Moto)

add = [automovel1,automovel2,automovel3,automovel4]





