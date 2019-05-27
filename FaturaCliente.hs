module FactureCliente where
import System.IO
import Estrutura


listaDeLinhasDeFactura=linhasDeFactura

linhasDeFactura= do
        fF<-readFile "factura_cliente.txt"
        let l=map words (lines (transf fF))
            listaP=linhasFactura l    
        return listaP


--listLinhasFacturas::LinhaFacturas->String
listLinhasFacturas []=[]
listLinhasFacturas ((cod,pu,qtd,sub):xs)="Codigo: "++show(cod)++"| PrecoU"++show(pu)++"| qtd: "++show(qtd)++"| SubTotal: "++show(sub)++"\n"++listLinhasFacturas xs


transf::String->String
transf []=[]
transf (x:xs)|(x==',')||(x=='-')=['\t']++transf xs
             |(x=='|')=['\n']++transf xs
             |(x==' ')=['_']++transf xs
             |(x== '"')=[' ']++transf xs
             |otherwise =[x]++transf xs



linhasFactura::[[String]]->LinhasFacturas
linhasFactura ([cod,_,_,pu,qtd,sub,_,_,_,_,_,_,_,_,_,_]:xs)=let cod1=(read cod)::Codigo
                                                                pu2=(read pu)::PrecoUnitario
                                                                qtd1=(read qtd)::Quantidade
                                                                sub1=(read sub)::Subtotal

                                  
                    in (cod1,pu2,qtd1,sub1):(linhasFactura xs)
linhasFactura _=[]


factura= do
        fF<-readFile "factura_cliente.txt"
        let l=map words (lines (transf fF))
            listaP=facturaDados l
        
        return listaP


facturaDados ([cod,_,_,_,_,_,total,valorPago,troco,_,_,_,_,dia,mes,ano]:xs)=let cod1=(read cod)::Codigo
                                                                                t=(read total)::Total
                                                                                vP=(read valorPago)::ValorPago
                                                                                tr=(read troco)::Troco
                                                                                date=ano++"-"++mes++"-"++dia
                                                            in (cod1,t,vP,tr,date):(facturaDados xs)
facturaDados _=[]

--busca::Int->LinhasFacturas->String
--busca cod ((cod1,pu,qtd,sub):xs)=show(cod1) ++ "Passei"

--imprime = listLinhasFacturas listaDeLinhasDeFactura