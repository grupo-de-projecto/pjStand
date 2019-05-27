module Dados  where
import Estrutura


codigo::Automovel->Codigo
codigo (a,_,_,_,_,_) = a

nome::Automovel->Nome
nome (_,a,_,_,_,_) = a

preco::Automovel->Preco
preco (_,_,a,_,_,_) = a

categoria::Automovel->Categoria
categoria (_,_,_,a,_,_) = a

marca::Automovel->Marca
marca (_,_,_,_,a,_) = a

tipo::Automovel->Tipo
tipo (_,_,_,_,_,a) = a



dados :: Automoveis -> IO ()
dados [] = putStr ""
dados (x:xs) = do
                putStrLn ("    Codigo: "++(show (codigo x))++"\tNome: "++(show (nome x))++"\tPreço: "++(show (preco x))++"\tCategoria: "++(show (categoria x))++"\tModelo: "++(show (marca x))++"\tTipo: "++(show (tipo x)))
                putStrLn "---------------------------------------------------------------------------------------------------------------"
                dados xs

listar = do
          putStrLn "\n--------------------------------------------------- PRODUTOS --------------------------------------------------"
          dados add
