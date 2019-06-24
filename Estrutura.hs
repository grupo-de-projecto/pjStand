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
type Data = (Dia, Mes, Ano)


type LinhaFactura = (Codigo, PrecoUnitario, Quantidade, Subtotal)

type LinhasFacturas = [LinhaFactura]

type Factura = (Codigo, LinhasFacturas, Total, ValorPago, Troco, Data)

type Facturas = [Factura]

type FacturaFich=(Codigo,Nome,Codigo,Nome,PrecoUnitario,Quantidade,Subtotal,Total,ValorPago,Troco,Tipo,Marca,Categoria,Telefone,String)
type FacturasFich=[FacturaFich]


automovel1=(1,"Land Cruiser LC76",21036051.85,Ligeiro,Toyota,Carro)
automovel2=(2,"XF",24690000,Ligeiro,Jaguar,Carro)
automovel3=(3,"Ace",200000,Ligeiro,Honda,Moto)
automovel4=(4,"Fortuner AUT", 22354247.85,Ligeiro,Toyota,Carro)


add::Automoveis
add = [automovel1,automovel2,automovel3,automovel4]
