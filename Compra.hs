module Compra where
import Estrutura
import Escrever

import System.IO

comprar::Int->IO()  
comprar codFactura = do
            putStr("Selecione o Vendedor:\n1-Paulino\n2-Jonas")
            v<-readLn :: IO Int
            if (v == 1 || v == 2) then do
                putStrLn ("Informe o Nome do Cliente:")
                nome <- getLine
                putStrLn ("Informe o Nº de Telefone do Cliente:")
                telefone <- readLn :: IO Int
                comprarCarro [] nome telefone codFactura
                putStr("")
                else
                    putStr ("nao")
            


existe [] cod= False
existe ((c,_,_,_,_,_):xs) cod | c == cod = True
                              | length xs == 0 = False
                              | otherwise = existe xs cod 

exibeCarros [] tipoComp=[]
exibeCarros ((cod,nome,preco,categoria,marca,tipo):xs) tipoComp= if(tipo == tipoComp) then 
            ("Cod: "++show(cod)++"-- Nome: "++nome++"-- P/U: "++show(preco)++"--Marca:"++show(marca)++"--Categoria: "++show(categoria)++"\n")++exibeCarros xs tipoComp
        else
            exibeCarros xs tipoComp


retornaPreco ((c,_,preco,_,_,_):xs) cod | c == cod = preco
                                        | otherwise = retornaPreco xs cod
                                        


addLinhaFactura::Int->Double->Int->Double->(Int,Double,Int,Double)
addLinhaFactura cod preco qtd subtotal = (cod,preco,qtd,subtotal)

addFactura [] elemento = [elemento]
addFactura (x:xs) elemento = (x:xs)++[elemento]


listaLinhas = []


comprarCarro lista nome telefone codFactura = do                 
                putStrLn("Selecine o Carro ou Mota que Deseja Comprar\nCarros:\n")
                putStrLn(exibeCarros add Carro)
                putStrLn("\n\nMota:")
                putStrLn(exibeCarros add Moto)
                putStr("Digite o codigo do Automovel que deseja: ")
                codigo<-getLine
                if((existe add (read codigo))== True) then do
                    putStrLn ("Digite a Quantidade que deseja: ")
                    qtd<-getLine
                    
                 
                    putStrLn(show (lista++[(addLinhaFactura (read codigo) (retornaPreco add (read codigo)) (read qtd) ((read qtd) * (retornaPreco add (read codigo))))] )) 
                    
                    putStrLn("Adicionado ao Carrinho")
                    putStrLn("1-Concluir Compra\n2-Adicionar as Compra")
                    valor<-getLine
                    case (read valor) of 
                        1-> do 
                            putStrLn((show(exibirFactura listaTa add))++"\nTOTAL: "++(show(total)))
                            putStrLn("Digite O Valor Pago: ")
                            d<-getLine
                            verificarValorPago d total
                            putStrLn("\n")
                            escrever (codFactura+1) nome telefone listaTa total d ((read d)-total) add        
                            where{ 
                                listaTa = (lista++[(addLinhaFactura (read codigo) (retornaPreco add (read codigo)) (read qtd) ((read qtd) * (retornaPreco add (read codigo))))]);
                                total = (calculoTotal listaTa);
                            }
                                
                        _-> comprarCarro (lista++[(addLinhaFactura (read codigo) (retornaPreco add (read codigo)) (read qtd) ((read qtd) * (retornaPreco add (read codigo))))]) nome telefone codFactura
                    
                   
                    else 
                        comprarCarro lista nome telefone codFactura
                        --putStr ("Não existe")



exibirFactura [] a=[]
exibirFactura a []=[]
exibirFactura ((c,preco,qtd,subtotal):xs) ((cod,nome,_,_,_,_):ys) = if ((show c)==(show cod)) then "COD: "++(show cod)++"---NOME: "++nome++"---QTD: "++(show qtd)++"---PRECO: "++(show preco)++"--"++(show qtd)++"X"++(show preco)++": "++(show subtotal)++"\n"++exibirFactura xs add
else
    exibirFactura ((c,preco,qtd,subtotal):xs) ys 
    
    
calculoTotal [] = 0
calculoTotal ((_,_,_,subtotal):xs) = subtotal + calculoTotal xs

verificarValorPago valor total = do if ((read valor)<total) then do
                                        putStrLn("Erro! Digite Novamente:")
                                        d <- getLine
                                        verificarValorPago d total
                                        else
                                            putStr("TROCO: "++show((read valor)-total))
                                            
                                            























compra= do
        fF<-readFile "factura_clientes.txt"
        
        let l=map words (lines (transfo fF))
            listaP=linhasCod l
        putStr (drop (length fF) fF)
        
        comprar (buscaUltimoCod listaP)
        
        putStr ("")



linhasCod::[[String]]->[Int]
linhasCod ([cod,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]:xs)=let cod1=(read cod)::Codigo
                                                     in (cod1):(linhasCod xs)
linhasCod _=[]

buscaUltimoCod [] = 0
buscaUltimoCod (x:xs) |(xs == []) = x
                      |otherwise = buscaUltimoCod xs

transfo::String->String
transfo []=[]
transfo (x:xs)|(x==',')||(x=='-')=['\t']++transfo xs
             |(x=='|')=['\n']++transfo xs
             |(x==' ')=['_']++transfo xs
             |(x== '"')=[' ']++transfo xs
             |otherwise =[x]++transfo xs

                                            