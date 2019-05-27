module Main where

import Preco
import Dados
import Compra
import CarregarFicheiro


--menu adjuto para chamar a função meuPreco do modulo Preco
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

--menu adjuto para chamar a função listar do modulo Dados
listar_dados::IO()
listar_dados = do
                listar
                putStrLn "\nDIGITE QUALQUER DIGITO, EM SEGUIDA A TECLAR {ENTER}"
                a <- getLine
                main

--menu função adjunta para chamar a função que verifca o automovel mais vendido
carroMaisVendido::IO()
carroMaisVendido = do
                putStrLn "O Automovel mais vendido é: "
                chamar

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
              2-> listar_dados
              3-> putStrLn ("Efectuar compra "++op)
              4-> putStrLn ("Consultar Factura "++op)
              5-> putStrLn ("Ver Factura do diário "++op)
              6-> putStrLn ("Ver todas Facturas "++op)
              7-> carroMaisVendido
