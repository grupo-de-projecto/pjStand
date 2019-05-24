module Escrever where
import System.IO
import Data.Time

escrever cod nome telefone [] total valorPago troco listaAuto =  putStr ""
escrever cod nome telefone ((codigo,pu,qtd,subtotal):xs) total valorPago troco listaAuto = do           
    amd <- (getCurrentTime)
    

    arquivo <- openFile "factura_cliente.txt" AppendMode
    hPutStr arquivo ((show cod)++"|"++nome++"|"++(retornaNome listaAuto codigo)++"|"++(show pu)++"|"++(show qtd)++"|"++(show subtotal)++"|"++(show total)++"|"++(show valorPago)++"|"++(show troco)++"|"++show(retornaTipo listaAuto codigo)++"|"++show(retornaMarca listaAuto codigo)++"|"++show(retornaCategoria listaAuto codigo)++"|"++show telefone++"|"++(take 10 (show amd))++"\n")
    hFlush arquivo
    hClose arquivo
    putStr ("valor:")
    escrever (cod+1) nome telefone xs total valorPago troco listaAuto

retornaNome ((c,nome,_,_,_,_):xs) cod | (show c) == (show cod) = nome
                                      | otherwise = retornaNome xs cod

retornaCategoria ((c,_,_,categoria,_,_):xs) cod | (show c) == (show cod) = show categoria
                                                | otherwise = retornaCategoria xs cod

retornaMarca ((c,_,_,_,marca,_):xs) cod | (show c) == (show cod) = show marca
                                        | otherwise = retornaMarca xs cod

retornaTipo ((c,_,_,_,_,tipo):xs) cod | (show c) == (show cod) = show tipo
                                      | otherwise = retornaTipo xs cod