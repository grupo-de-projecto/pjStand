module Dados  where

import Estrutura
import Data.List.Split
import System.IO


dados::Automoveis
dados = [(1,"Celestino",10,Ligeiro,Toyota,Carro), (1,"Langa",10,Ligeiro,Toyota,Carro)]

escrever::IO()
escrever = do
            appendFile "dados.txt" (show dados)
            putStrLn "Dados escrito"


rtn_pri (a,_,_,_,_,_) = a
rtn_sgn (_,a,_,_,_,_) = a
rtn_ter (_,_,a,_,_,_) = a
rtn_qrt (_,_,_,a,_,_) = a
rtn_qnt (_,_,_,_,a,_) = a
rtn_ult (_,_,_,_,_,a) = a





ler = do
        a <- openFile "dados.txt"  ReadMode
        conteudo <- hGetContents a
        return conteudo
        hClose a
        
f :: String -> Int
f = read

io :: IO String
io = getLine

main :: IO ()
main = (f `fmap` io) >>= \x -> print x


{-ler1::IO [String]->[String]
ler1  l= do
        return [l]-}