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
                comprarCarro []
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


comprarCarro lista = do                 
                putStrLn("Selecine o Carro ou Mota que Deseja Comprar\nCarros:\n")
                putStrLn(exibeCarros add Carro)
                putStrLn("\n\nMota:")
                putStrLn(exibeCarros add Moto)
                putStr("Digite o codigo do Automovel que deseja: ")
                codigo<-getLine
                if((existe add (read codigo))== True) then do
                    putStrLn ("Digite a Quantidade que deseja: ")
                    qtd<-getLine
                    
                 
                    putStrLn(show (lista++[(addLinhaFactura (read codigo) (retornaPreco add (read codigo)) (read qtd) ((read qtd) * (retornaPreco add (read codigo))))]  )) 
                    
                    putStrLn("Adicionado ao Carrinho")
                    putStrLn("1-Concluir Compra\n2-Adicionar as Compra")
                    valor<-getLine
                    case (read valor) of
                        1-> putStr("Conclui")
                            
                        _-> comprarCarro (lista++[(addLinhaFactura (read codigo) (retornaPreco add (read codigo)) (read qtd) ((read qtd) * (retornaPreco add (read codigo))))]  ) 
                    
                   
                    else 
                        putStr ("Não existe")
