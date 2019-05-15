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


codigo (a,_,_,_,_,_) = a
nome (_,a,_,_,_,_) = a
preco (_,_,a,_,_,_) = a
categoria (_,_,_,a,_,_) = a
marca (_,_,_,_,a,_) = a
tipo (_,_,_,_,_,a) = a



listar :: Automoveis -> IO ()
listar [] = putStr ""
listar (x:xs) = do
                putStrLn ("Codigo: "++(show (codigo x))++"\tNome: "++(show (nome x))++"\tPreço: "++(show (preco x))++"\tCategoria: "++(show (categoria x))++"\tModelo: "++(show (marca x))++"\tTipo: "++(show (tipo x)))
                putStrLn "_________________________________________________________________________________________________________"
                listar xs
                
tecla::IO()
tecla = do
        putStrLn "Digite 1 para sair"
        a<- getLine
        putStrLn a