

module Estrutura where

import qualified Data.Map as Map

data Tipo = Carro | Moto deriving(Show,Eq)
data Marca = Volvo | Toyota | Jaguar | Bmw | Honda deriving(Show,Eq)
data Categoria = Ligeiro | Pesado deriving(Show,Eq)

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



linha1=(2,3000.456,5,3000.456)
linha2=(3,5000.456,1,5000.456)
linha3=(4,7000.456,1,7000.456)
linha4=(2,3000.456,7,3000.456)
linha5=(5,9000.456,1,9000.456)
linha6=(2,3000.456,9,3000.456)
linha7=(6,3000.456,1,3000.456)
linha8=(5,9000.456,1,9000.456)
linha9=(2,3000.456,3,3000.456)

bwedeLinhas=[linha1,linha2,linha3,linha4,linha5,linha6,linha7,linha8,linha9]


automovel1=(1,"ricardo",12.43,Ligeiro,Toyota,Carro)
automovel2=(2,"ricardo neves",12.43,Ligeiro,Toyota,Carro)
automovel3=(3,"Mingota",12.43,Ligeiro,Toyota,Carro)
automovel4=(4,"Teste",12.43,Ligeiro,Toyota,Moto)

add = [automovel1,automovel2,automovel3,automovel4]

sel_cod(y,_,_,_)= y
sel_qtd(_,_,q,_)= q
lista:: [LinhaFactura]->(Codigo, PrecoUnitario, Quantidade, Subtotal) --Devolve uma tupla
lista [(a)]=(a)

conta::Int->Int
conta b =b+1



           
    
cadaElem::[LinhaFactura]->Codigo
cadaElem []=0
cadaElem (x:xs)
                | sel_cod x == sel_cod ( xs) = sel_cod x
                |otherwise = cadaElem xs

retornaLinhas::[(Codigo,Quantidade)]
retornaLinhas = recebeCod (minhaLista bwedeLinhas (cadaElem bwedeLinhas))
                
                
                
minhaLista::[LinhaFactura]->Int->[(Codigo,Quantidade)]
minhaLista [] _=[]
minhaLista (z:zs) cod|cod==sel_cod(z)= [(cod,sel_qtd(z))]++minhaLista zs cod--fetorna a lista com todos as quantidades de um codigo
                     |otherwise=minhaLista zs cod

soma::[(Codigo,Quantidade)]->Quantidade---soma as quantidades
soma []=0
soma ((e,f):ws)=f+soma ws

resSoma::Quantidade
resSoma =soma (minhaLista bwedeLinhas (cadaElem bwedeLinhas))




recebeCod::[(Codigo,Quantidade)]->[(Codigo,Quantidade)]
recebeCod ((d,g):js)=[(d,resSoma)]


                     
--inclui::Quantidade->[(Codigo,Quantidade)]
--inclui ((h,g):vs) = [(h,soma (minhaLista bwedeLinhas (cadaElem bwedeLinhas)))] ----Inclui na Lista
                     
                     
                     
                     








--minhaLista::[LinhaFactura]->[(Codigo,Int)]
--minhaLista []=[]
--minhaLista ((w,_,_,_):xs)|w==sel_cod xs= (w,conta):minhaLista xs

           --let a=1
            
           --in [(w,conta a)]
                     
                     
                     