module FaturaCliente where
import System.IO
import Estrutura


transf::String->String
transf []=[]
transf (x:xs)|(x==',')||(x=='-')=['\t']++transf xs
             |(x=='|')=['\n']++transf xs
             |(x==' ')=['_']++transf xs
             |(x== '"')=[' ']++transf xs
             |otherwise =[x]++transf xs
             
buscaCodigo codFactur= do
        fF<-readFile "factura_clientes.txt"
        let dados = map words (lines (transf fF))
            lista = linhasFactura dados codFactur
            factura = facturaDados dados codFactur
        putStr(listLinhasFacturas lista add)
        putStr(listFacturas factura)
        
listLinhasFacturas::[(Codigo, PrecoUnitario, Quantidade, Subtotal)]->Automoveis->String
listLinhasFacturas [] _=[]
listLinhasFacturas ((cod,pu,qtd,sub):xs) l="Codigo Produto: "++show(cod)++"|"++(buscaNome l cod)++"| PrecoU:"++show(pu)++"| Quantidade: "++show(qtd)++"| SubTotal: "++show(sub)++"\n"++listLinhasFacturas xs l



linhasFactura::[[String]]->Int->[(Codigo, PrecoUnitario, Quantidade, Subtotal)]
linhasFactura ([cod,nome,codigoAuto,_,pu,qtd,sub,_,_,_,_,_,_,_,_,_,_]:xs) codigo|(cod == (show codigo))=let cod1=(read codigoAuto)::Codigo
                                                                                                            pu2=(read pu)::PrecoUnitario
                                                                                                            qtd1=(read qtd)::Quantidade
                                                                                                            sub1=(read sub)::Subtotal

                                                                                                in (cod1,pu2,qtd1,sub1):(linhasFactura xs codigo)
                                                                             |otherwise=linhasFactura xs codigo
linhasFactura [] codigo=[]
            
        



facturaDados ([cod,n,_,_,_,_,_,total,valorPago,troco,_,_,_,_,dia,mes,ano]:xs) codigo|(cod == (show codigo))=let cod1=(read cod)::Codigo
                                                                                                                n1= n
                                                                                                                t=(read total)::Total
                                                                                                                vP=(read valorPago)::ValorPago
                                                                                                                tr=(read troco)::Troco
                                                                                                                date=ano++"-"++mes++"-"++dia
                                                                                                in (cod1,n1,t,vP,tr,date):(facturaDados xs codigo)
                                                                                     |otherwise=facturaDados xs codigo
facturaDados [] codigo=[]




listFacturas ((cod,n,total,valorPago,troco,date):xs)="Codigo: "++show(cod)++"Nome Pessoa: "++show(n)++"| Total"++show(total)++"| ValorPago: "++show(valorPago)++"| Troco: "++show(troco)++"|Data: "++date ++"\n"
listFacturas []= "Factura Inexistente"


buscaNome ((codigo, nome, preco, categoria, marca, tipo):xs) codi |((show codigo)==(show codi)) = "Nome: "++nome++"Marca: "++(show marca)
                                                                  |otherwise = buscaNome xs codi
                                                                  
                   