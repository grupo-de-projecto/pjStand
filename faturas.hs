module FactureCliente where
import System.IO
import Estrutura

transf::String->String
transf []=[]
transf (x:xs)|(x==',')||(x=='-')=['\t']++transf xs
             |(x=='|')=['\n']++transf xs
             |(x==' ')=['_']++transf xs
             |(x== '"')=[' ']++transf xs
             |otherwise =[x]++transf xs
             
             
             
busca codFactur= do
        fF<-readFile "factura_cliente.txt"
        let dados = map words (lines (transf fF))
            lista = linhasFactura dados codFactur
            factura = (facturaDados dados codFactur)
        putStr(listLinhasFacturas lista)
        putStr(listFacturas factura)
        
listLinhasFacturas::[(Codigo,Nome, PrecoUnitario, Quantidade, Subtotal)]->String
listLinhasFacturas []=[]
listLinhasFacturas ((cod,nome,pu,qtd,sub):xs)="Codigo Produto: "++show(cod)++"| Nome:"++show(nome)++"| PrecoU:"++show(pu)++"| Quantidade: "++show(qtd)++"| SubTotal: "++show(sub)++"\n"++listLinhasFacturas xs



linhasFactura::[[String]]->Int->[(Codigo,Nome, PrecoUnitario, Quantidade, Subtotal)]
linhasFactura ([cod,nome,codigoAuto,_,pu,qtd,sub,_,_,_,_,_,_,_,_,_,_]:xs) codigo|(cod == (show codigo))=let cod1=(read codigoAuto)::Codigo
                                                                                                            pu2=(read pu)::PrecoUnitario
                                                                                                            qtd1=(read qtd)::Quantidade
                                                                                                            sub1=(read sub)::Subtotal
                                                                                                            nome1=nome

                                                                                                in (cod1,nome1,pu2,qtd1,sub1):(linhasFactura xs codigo)
                                                                             |otherwise=linhasFactura xs codigo
linhasFactura [] codigo=[]
            
        



facturaDados ([cod,_,_,_,_,_,_,total,valorPago,troco,_,_,_,_,dia,mes,ano]:xs) codigo|(cod == (show codigo))=let cod1=(read cod)::Codigo
                                                                                                                t=(read total)::Total
                                                                                                                vP=(read valorPago)::ValorPago
                                                                                                                tr=(read troco)::Troco
                                                                                                                date=ano++"-"++mes++"-"++dia
                                                                                                in (cod1,t,vP,tr,date):(facturaDados xs codigo)
facturaDados _ codigo=[]




listFacturas ((cod,total,valorPago,troco,date):xs)="Codigo: "++show(cod)++"| Total"++show(total)++"| ValorPago: "++show(valorPago)++"| Troco: "++show(troco)++"|Data: "++date ++"\n"