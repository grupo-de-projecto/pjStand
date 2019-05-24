module Main where
import Preco


verPreco::IO()
verPreco=do
      putStr "\n------------------- Menu Preco ------------------\n"
      putStr("1-Consultar preco\n2-Menu principal \n\nDigite:")
      op<-readLn :: IO Int 
      case op of 
        1-> meuPreco
        2-> main
      putStr("Prima qualquer tecla seguido de Enter para voltar ")
      c<-getLine
      verPreco

main::IO()
main = do
            putStr "-------------- Menu ------------------\n"
            putStr "1- Ver Preçario\n"
            putStr "2- Listar Automóvel\n"
            putStr "3- Efectuar Compra\n"
            putStr "4- Consultar Factura\n"
            putStr "5- Ver Factura do Diário\n"
            putStr "6- Ver todas Facturas\n"
            putStr "7- Mostrar as informações do automóvel mais vendido\n"
            putStr "8- Sair\n *Selecione a Tarefa que deseja realizar: "
            op<-getLine
            case read(op) of
              1-> verPreco
              2-> putStrLn ("Listar Produtos "++op)
              3-> putStrLn ("Efectuar compra "++op)
              4-> putStrLn ("Consultar Factura "++op)
              5-> putStrLn ("Ver Factura do diário "++op)
              6-> putStrLn ("Ver todas Facturas "++op)
              7-> putStrLn ("Mostrar as informações do automóvel mais vendido "++op)
