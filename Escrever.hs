module Escrever where
import System.IO
--escrever cod nome telefone [] total valorPago troco = ""
escrever cod nome telefone ((_,pu,qtd,subtotal):xs) total valorPago troco = do           
    arquivo <- openFile "facturas.txt" AppendMode
    hPutStr arquivo ((show cod)++"|"++nome++"|"++(show pu)++"|"++(show qtd)++"|"++(show subtotal)++"|"++(show total)++"|"++(show valorPago)++"|"++(show troco)++"\n")
    hFlush arquivo
    hClose arquivo
    putStr ("valor:")
    escrever (cod+1) nome telefone xs total valorPago troco