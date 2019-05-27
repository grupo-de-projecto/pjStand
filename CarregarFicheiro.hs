module CarregarFicheiro where
import System.IO
import Estrutura --hiding(Categoria)
import Dados
import Mais_Vendido
--import DadosFactura


lerFile::IO()

lerFile=do
    --fA<-readFile "dados.txt"
    fF<-readFile "factura_todas.txt"
    --let l=map words (lines (transf fA))
    --    listA=automoveis l
    let lF=map words (lines (transf fF))
        listF=facturaFi lF
        lis=maisVendido lF

    --listar listA
    print lis
    putStrLn("")

--Mostrar Carro mais Vendido
chamar::IO()
chamar = do
          fF<-readFile "factura_todas.txt"
          let lF = map words (lines (transf fF))
          print (varredura (trata (maior (impr (maisVendido lF)))) (maisVendido lF))
          putStrLn ("")




transf::String->String
transf []=[]
transf (x:xs)|(x==',')=['\t']++transf xs
             |(x=='|')=['\n']++transf xs
             |(x==' ')=['_']++transf xs
             |otherwise =[x]++transf xs




automoveis::[[String]]->Automoveis
automoveis ([c,n,p,k,m,t]:xs)=let c1=(read c)::Codigo
                                  p1=(read p)::PrecoUnitario
                                  k1=(read k)::Categoria
                                  m1=(read m)::Marca
                                  t1=(read t)::Tipo

                    in (c1,n,p1,k1,m1,t1):(automoveis xs)
automoveis _=[]



facturaFi::[[String]]->FacturasFich
facturaFi ([c,nc,cp,na,p,k,s,t,v,r,tp,m,ca,tl,da]:xs)=let c2=(read c)::Codigo
                                                          cp2=(read cp)::Codigo
                                                          p2=(read p)::PrecoUnitario
                                                          k2=(read k)::Quantidade
                                                          s2=(read s)::Subtotal
                                                          t2=(read t)::Total
                                                          v2=(read v)::ValorPago
                                                          r2=(read r)::Troco
                                                          tp2=(read tp)::Tipo
                                                          m2=(read m)::Marca
                                                          ca2=(read ca)::Categoria
                                                          tl2=(read tl)::Telefone


                    in (c2,nc,cp2,na,p2,k2,s2,t2,v2,r2,tp2,m2,ca2,tl2,da):(facturaFi xs)

facturaFi _=[]


maisVendido::[[String]]->LinhasFacturas
maisVendido ([_,_,cp,_,p,k,s,_,_,_,_,_,_,_,_]:xs)=let     cp2=(read cp)::Codigo
                                                          p2=(read p)::PrecoUnitario
                                                          k2=(read k)::Quantidade
                                                          s2=(read s)::Subtotal


                    in (cp2,p2,k2,s2):(maisVendido xs)
maisVendido _=[]
