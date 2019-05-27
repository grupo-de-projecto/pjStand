module Facturas where
import Estrutura

dia::Data->IO()
dia (d,m,a)= putStrLn(show (d)++"/"++show(m)++"/"++show(a))

linFactP::[LinhaFactura]->Total
linFactP []=0.00
linFactP ((_,_,_,t):xs)=t+linFactP xs

factData::Data->Facturas->Factura
--factData dat [[]]=[]
factData dat ((c,l,s,t,r,datF):xs)= if(dat==datF) then (c,l,s,t,r,datF) else factData dat xs 

buscarFactD::Data->Factura
buscarFactD dat=factData dat factus  


codigo (a,_,_,_,_,_,_,_) = a
nome (_,a,_,_,_,_,_,_) = a
preco (_,_,a,_,_,_,_,_) = a
quantidade (_,_,_,a,_,_,_,_) = a
subtotal (_,_,_,_,a,_,_,_) = a
total (_,_,_,_,_,a,_,_) = a
valorPago (_,_,_,_,_,_,a,_) = a
troco (_,_,_,_,_,_,_,a) = a
        
        
        
listarFactura :: FacturasFich -> IO ()
listarFactura [] = putStr ""
listarFactura (x:xs) = do
            putStrLn ("Codigo: "++(show (codigo x))++"\tNome: "++(show (nome x))++"\tPreço: "++(show (preco x))++"\tQuantidade: "++(show (quantidade x))++"\tSub total: "++(show (subtotal x))++"\tTotal a pagar: "++(show (total x))++"\tValor pago: "++(show (valorPago x))++"\tTroco: "++(show (troco x)))
            putStrLn "_________________________________________________________________________________________________________"
            listarFactura xs
                        
tecla::IO()
tecla = do
            putStrLn "Digite 1 para sair"
            a<- getLine
            putStrLn a


