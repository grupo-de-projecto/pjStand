module Facturas where
import Estrutura

transf::String->String
transf []=[]
transf (x:xs)|(x==',')||(x=='-')=['\t']++transf xs
             |(x=='|')=['\n']++transf xs
             |(x==' ')=['_']++transf xs
             |(x== '"')=[' ']++transf xs
             |otherwise =[x]++transf xs

buscar= busca 1

buscaData daT = buscaDa 1 daT

busca codFactur= do
        fF<-readFile "factura_clientes.txt"
        if(fF/=[]) then do
                let dados = map words (lines (transf fF))
                    lista = linhasFactura dados codFactur
                    facturaC = (facturaDadosC dados codFactur)
                    facturaR = (facturaDadosR dados codFactur)
                putStr(drop (length fF) fF)
                putStrLn(listFacturasC facturaC)
                putStr(listLinhasFacturas lista add)
                putStr(listFacturasR facturaR)
                if(lista/=[])then do
                        busca (codFactur+1)
                else putStrLn ("")
        else putStrLn ("Ficheiro factura cliente vazio")


        
buscaDa codFactur dataF= do
        fF<-readFile "factura_clientes.txt"
        if(fF/=[]) then do
                let dados = map words (lines (transf fF))
                    listaF = linhasFacturaData dados codFactur dataF
                    facturaCf = (facturaDadosCF dados codFactur dataF)
                    facturaRf = (facturaDadosRF dados codFactur dataF)
                putStr(drop (length fF) fF)   
                putStrLn(listFacturasC facturaCf)
                putStr(listLinhasFacturas listaF add)
                putStr(listFacturasR facturaRf)
                if(listaF/=[])then do
                        buscaDa (codFactur+1) dataF
                else putStrLn ("")
                
        else putStrLn ("Ficheiro factura cliente vazio")
        
listLinhasFacturas::[(Codigo, PrecoUnitario, Quantidade, Subtotal)]->Automoveis->String
listLinhasFacturas [] _=[]
listLinhasFacturas ((cod,pu,qtd,sub):xs) l="\tCodigo Produto: "++show(cod)++"|"++(buscaNome l cod)++"| PrecoU:"++show(pu)++"| Quantidade: "++show(qtd)++"| SubTotal: "++show(sub)++"\n"++listLinhasFacturas xs l




linhasFactura::[[String]]->Int->[(Codigo, PrecoUnitario, Quantidade, Subtotal)]
linhasFactura ([cod,nome,codigoAuto,_,pu,qtd,sub,_,_,_,_,_,_,_,_,_,_]:xs) codigo|(cod == (show codigo))=let cod1=(read codigoAuto)::Codigo
                                                                                                            pu2=(read pu)::PrecoUnitario
                                                                                                            qtd1=(read qtd)::Quantidade
                                                                                                            sub1=(read sub)::Subtotal

                                                                                                in (cod1,pu2,qtd1,sub1):(linhasFactura xs codigo)
                                                                             |otherwise=linhasFactura xs codigo
linhasFactura [] codigo=[]


linhasFacturaData::[[String]]->Int->String->[(Codigo, PrecoUnitario, Quantidade, Subtotal)]
linhasFacturaData ([cod,nome,codigoAuto,_,pu,qtd,sub,_,_,_,_,_,_,_,dia,mes,ano]:xs) codigo dataF|(( ano++"-"++mes++"-"++dia == dataF)&&(cod==show(codigo)))=let cod1=(read codigoAuto)::Codigo
                                                                                                                                                                pu2=(read pu)::PrecoUnitario
                                                                                                                                                                qtd1=(read qtd)::Quantidade
                                                                                                                                                                sub1=(read sub)::Subtotal
                                                                                                                    
                                                                                                in (cod1,pu2,qtd1,sub1):(linhasFacturaData xs codigo dataF)
                                                                                         |otherwise=linhasFacturaData xs codigo dataF
linhasFacturaData [] codigo dataF=[]
            
            
        



facturaDadosC ([cod,cl,_,_,_,_,_,_,_,_,_,_,_,_,dia,mes,ano]:xs) codigo|(cod == (show codigo))=let cod1=(read cod)::Codigo
                                                                                                  date=ano++"-"++mes++"-"++dia
                                                                                            in (cod1,cl,date):(facturaDadosC xs codigo)
                                                                        |otherwise=facturaDadosC xs codigo
facturaDadosC _ codigo=[]


facturaDadosR ([cod,_,_,_,_,_,_,total,valorPago,troco,_,_,_,_,_,_,_]:xs) codigo|(cod == (show codigo))=let cod1=(read cod)::Codigo
                                                                                                           t=(read total)::Total
                                                                                                           vP=(read valorPago)::ValorPago
                                                                                                           tr=(read troco)::Troco
                                                                                        in (t,vP,tr):(facturaDadosR xs codigo)
                                                                                |otherwise=facturaDadosR xs codigo
facturaDadosR [] codigo=[]


facturaDadosCF ([cod,cl,_,_,_,_,_,_,_,_,_,_,_,_,dia,mes,ano]:xs) codigo dataF|((ano++"-"++mes++"-"++dia == dataF)&&( cod==show(codigo)))=let cod1=(read cod)::Codigo
                                                                                                                                             date=ano++"-"++mes++"-"++dia
                                                                                                in (cod1,cl,date):(facturaDadosCF xs codigo dataF)
                                                                             |otherwise=facturaDadosCF xs codigo dataF
facturaDadosCF _ codigo dataF=[]


facturaDadosRF ([cod,_,_,_,_,_,_,total,valorPago,troco,_,_,_,_,dia,mes,ano]:xs) codigo dataF|((ano++"-"++mes++"-"++dia== dataF)&&( cod==show(codigo)))=let cod1=(read cod)::Codigo
                                                                                                                                                           t=(read total)::Total
                                                                                                                                                           vP=(read valorPago)::ValorPago
                                                                                                                                                           tr=(read troco)::Troco
                                                                                                 in (t,vP,tr):(facturaDadosRF xs codigo dataF)
                                                                                            |otherwise=facturaDadosRF xs codigo dataF
facturaDadosRF[] codigo dataF=[]



listFacturasR ((t,vp,tr):xs)="\nTotal a pagar: "++show(t)++"\t| Valor Pago: "++show(vp)++"\t|Troco: "++show(tr) ++"\n"++"_________________________________________________________________________________________________________\n"
listFacturasR []=""

listFacturasC ((cod,cli,date):xs)="\n_________________________________________________________________________________________________________\n\n Codigo da factura: "++show(cod)++"\t| Nome do cliente: "++show(cli)++"\t|Data: "++date ++"\n"
listFacturasC []=[]
buscaNome ((codigo, nome, preco, categoria, marca, tipo):xs) codi |((show codigo)==(show codi)) = "Nome: "++nome++"Marca: "++(show marca)
                                                                  |otherwise = buscaNome xs codi


