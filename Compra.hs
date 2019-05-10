import Estrutura 
import System.IO

compra::IO()  
compra = do
            putStr("Selecione o Vendedor:\n1-Paulino\n2-Jonas")
            v<-readLn :: IO Int
            if (v == 1 || v == 2) then do
                putStrLn ("Informe o Nome do Cliente:")
                nome <- getLine
                putStrLn ("Informe o Nº de Telefone do Cliente:")
                telefone <- readLn :: IO Int
                putStrLn(compraVeiculos)
                
                
                else
                    putStr ("nao")
            


compraVeiculos = exibe add


exibe []=[]
exibe ((a,b,c,d,_,_):xs) = ("Cod: "++show(a)++"-- Nome: "++b++"-- P/U: "++show(c)++"--Marca:"++show(d)++"\n")++exibe xs
