module Main where

import Preco
import Dados
import Compra
import Mais_Vendido


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
                putStrLn "\nDIGITE {ENTER} PARA CONTINUAR"
                a <- getLine
                main

--menu adjunto para chamar a função compra do modulo Compra
efectuarCompra::IO()
efectuarCompra = do
            compra
            putStrLn "\n COMPRA EFECTUADO COM SUCESSO!\n\n\n"
            main


--menu função adjunta para chamar a função que verifca o automovel mais vendido
carroMaisVendido::IO()
carroMaisVendido = do
                putStr "AUTOMOVEL MAIS VENDIDO\n------------------------------------------\n"
                putStr "O Automovel mais vendido é: "
                chamar
                main

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
              3-> efectuarCompra
              4-> putStrLn ("Consultar Factura "++op)
              5-> putStrLn ("Ver Factura do diário "++op)
              6-> putStrLn ("Ver todas Facturas "++op)
              7-> carroMaisVendido
              8-> putStrLn (" ")
              _-> main
