module Dados  where

import Estrutura
import Data.List.Split


dados::Automoveis
dados = [(1,"Celestino",10,Ligeiro,Toyota,Carro), (1,"Langa",10,Ligeiro,Toyota,Carro)]

{-escrever::IO()
escrever = do
            writeFile "info.txt" "Testar"
            putStrLn "Dados escrito"-}
            
ler::IO()
ler = do
        a <- readFile "dados.txt"
        putStrLn a
        
        
