module FactureCliente where
import Estrutura


listaPri=linhasDeFactura
--linhasDeFactura::IO()
linhasDeFactura= do
        fF<-readFile "factura_cliente.txt"
        let l=map words (lines (transf fF))
            listaP=linhasFactura l
        
        return listaP
        --putStr("")


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

teste ([cod,_,_,pu,qtd,sub,_,_,_,_,_,_,_,_]:xs) = show cod

--linhasFactura::[[String]]->LinhasFactura
linhasFactura ([cod,_,_,pu,qtd,sub,_,_,_,_,_,_,_,_,_,_]:xs)=let cod1=(read cod)::Codigo
                                                                pu2=(read pu)::PrecoUnitario
                                                                qtd1=(read qtd)::Quantidade
                                                                sub1=(read sub)::Subtotal

                                  
                    in (cod1,pu2,qtd1,sub1):(linhasFactura xs)
linhasFactura _=[]



