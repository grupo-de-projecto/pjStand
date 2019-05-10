module FacturasDiaria where
import Estrutura

dia::Data->IO()
dia (d,m,a)= putStrLn(show (d)++"/"++show(m)++"/"++show(a))
linFact1::LinhaFactura
linFact1=(1,300000.00,2,2*300000.00)
linFact2::LinhaFactura
linFact2=(1,300000.00,2,2*300000.00)
linFacts::[LinhaFactura]
linFacts=[linFact1,linFact2]

linFactP::[LinhaFactura]->Total
linFactP []=0.00
linFactP ((_,_,_,t):xs)=t+linFactP xs

--type Factura = (Codigo, LinhasFacturas, Total, ValorPago, Troco, Data)
factu1=(1,linFacts,linFactP (linFacts),1000000.00,1000,(11,11,2011))
factu2=(1,linFacts,linFactP (linFacts),1000000.00,1000,(11,11,2019))
factus=[factu1,factu2]
factData::Data->Facturas->Factura
--factData dat [[]]=[]
factData dat ((c,l,s,t,r,datF):xs)= if(dat==datF) then (c,l,s,t,r,datF) else factData dat xs 

buscarFactD::Data->Factura
buscarFactD dat=factData dat factus  


