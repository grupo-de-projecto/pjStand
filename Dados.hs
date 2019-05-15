module Dados  where

import Estrutura
import Data.List.Split
import System.IO


dados::Automoveis
dados = [(1,"Celestino",10,Ligeiro,Toyota,Carro), (2,"Langa",10,Ligeiro,Toyota,Carro)]

{-escrever::IO()
escrever = do
            appendFile "dados.txt" (show dados)
            putStrLn "Dados escrito"-}


rtn_pri (a,_,_,_,_,_) = a
rtn_sgn (_,a,_,_,_,_) = a
rtn_ter (_,_,a,_,_,_) = a
rtn_qrt (_,_,_,a,_,_) = a
rtn_qnt (_,_,_,_,a,_) = a
rtn_ult (_,_,_,_,_,a) = a



listar :: Automoveis -> IO ()
listar [] = putStr ""
listar (x:xs) = do
                putStrLn ("Codigo: "++(show (rtn_pri x))++"\tNome: "++(show (rtn_sgn x))++"\tPreço: "++(show (rtn_ter x))++"\tCategoria: "++(show (rtn_qrt x))++"\tModelo: "++(show (rtn_qnt x))++"\tTipo: "++(show (rtn_ult x)))
                listar xs
                
                
tecla::IO()
tecla = do
        putStrLn "Digite 1 para sair"
        a<- getLine
        putStrLn a