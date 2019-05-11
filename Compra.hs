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
                putStrLn("Selecine o Carro ou Mota que Deseja Comprar\nCarros:\n")
                putStrLn(exibeCarros add Carro)
                putStrLn("\n\nMota:")
                putStrLn(exibeCarros add Moto)
                putStr("Digite o codigo do Automovel que deseja: ")
                codigo<-getLine
                if((existe add (read codigo))== True) then do
                    putStr("tem")
                    else 
                        putStr ("Não existe")
                       
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

