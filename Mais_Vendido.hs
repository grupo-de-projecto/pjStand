module Mais_Vendido where
import Estrutura
import CarregarFicheiro



impr::[LinhaFactura]->[LinhaFactura]            ---Retorna a lista de todos os carros vendidos em mais de uma factura
impr []=[]
impr ((d,h,f,u):[])=[]
impr ((d,h,f,u):(g,m,c,r):xs) |(d==g)   = (d,h,f+c,u):impr ((d,h,f+c,u):xs)
                              |(d/=g)  =impr ((d,h,f,u):xs)++impr ((g,m,c,r):xs)



maior::[LinhaFactura]->[LinhaFactura]   --procura o maior da lista
maior []=[]
maior (rs:[])=[rs]
maior ((d,h,f,u):(g,m,c,r):rs) |f>=c=maior ((d,h,f,u):rs)
                               |otherwise=maior ((g,m,c,r):rs)

lista:: [(b)]->(b)      ---tira um elemento da lista, o elemento deve ser uma tupla
lista [(a)]=(a)


trata::[LinhaFactura]->(Codigo, PrecoUnitario, Quantidade, Subtotal)  ---retorna uma tupla, retira o elemento da lista
trata o= lista o

varredura::(Codigo, PrecoUnitario, Quantidade, Subtotal)->[LinhaFactura]->[LinhaFactura]   ---faz uma varredura se existe alguem maior do que ele
varredura  j []=[j]
varredura  j (i:is)            |filtro j i==[j]=varredura j is
                               |otherwise=varredura i is


filtro::(Codigo, PrecoUnitario, Quantidade, Subtotal)->(Codigo, PrecoUnitario, Quantidade, Subtotal)->[(Codigo, PrecoUnitario, Quantidade, Subtotal)]   --Faz o filtro de comparação
filtro (z,b,c,d) (e,f,g,h)|c>=g     = [(z,b,c,d)]
                          |otherwise= [(e,f,g,h)]

--chama::[LinhaFactura]    --faz  a chamada de todas as funçoes
--chama = varredura (trata (maior (impr bwedeLinhas))) bwedeLinhas
maisVendido::[[String]]->LinhasFacturas
maisVendido ([_,_,cp,_,p,k,s,_,_,_,_,_,_,_,_]:xs)=let     cp2=(read cp)::Codigo
                                                          p2=(read p)::PrecoUnitario
                                                          k2=(read k)::Quantidade
                                                          s2=(read s)::Subtotal


                    in (cp2,p2,k2,s2):(maisVendido xs)
maisVendido _=[]

--Mostrar Carro mais Vendido
chamar::IO()
chamar = do
          fF<-readFile "factura_todas.txt"
          let lF = map words (lines (transf fF))
          print (varredura (trata (maior (impr (maisVendido lF)))) (maisVendido lF))
          putStrLn ("")
