module Preco where



import Estrutura
import System.IO

somaPreco::Codigo->Automoveis->Double
somaPreco n []=0.0
somaPreco n ((c,m,p,d,s,t):xs)|n==c = p
                              |otherwise =somaPreco n xs
                              
buscar::Codigo->Double
buscar n=somaPreco n add


meuPreco:: IO ()
meuPreco= do 
             putStrLn ("======================================================\n")
             putStrLn ("INSIRA O CÓDIGO DO AUTOMOVEL QUE DESEJA SABER O PREÇO\n")
             putStrLn(":_") 
             ler<-readLn :: IO Codigo
             if(buscar ler/=0.0)
                 then do
                    putStr("O Preço é: \t") 
                    putStr(show(buscar ler)) 
                    
                 else putStr("Codigo Inexistente\n")
             putStrLn ("\n======================================================\n")
             
             
             