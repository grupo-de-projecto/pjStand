module Estrutura where

data Tipo = Carro | Moto deriving(Show)
data Marca = Volvo | Toyota | Jaguar | Bmw | Honda deriving(Show)
data Categoria = Ligeiro | Pesado deriving(Show)

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

type Cliente = (Nome, Telefone)
type Data = (Dia, Mes, Ano)


type LinhaFactura = (Codigo, PrecoUnitario, Quantidade, Subtotal)

type LinhasFacturas = [LinhaFactura]

type Factura = (Codigo, LinhasFacturas, Total, ValorPago, Troco, Data)

type Facturas = [Factura]
