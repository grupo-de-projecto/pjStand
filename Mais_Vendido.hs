module Mais_Vendido where


linha1=(2,3000.456,5,3000.456)
linha2=(3,5000.456,1,5000.456)
linha3=(4,7000.456,1,7000.456)
linha4=(2,3000.456,7,3000.456)
linha5=(5,9000.456,35,9000.456)
linha6=(2,3000.456,9,3000.456)
linha7=(6,3000.456,10,3000.456)
linha8=(5,9000.456,1,9000.456)
linha9=(2,3000.456,3,3000.456)

linh1=(2,3000.456,9,3000.456)
linh2=(3,5000.456,15,5000.456)
linh3=(4,7000.456,1,7000.456)
linh4=(2,3000.456,14,3000.456)
linh5=(5,9000.456,35,9000.456)
linh6=(2,3000.456,19,3000.456)
linh7=(6,3000.456,100,3000.456)
linh8=(5,9000.456,1,9000.456)
linh9=(2,3000.456,3,3000.456)

lin1=(2,3000.456,15,3000.456)
lin2=(3,5000.456,15,5000.456)
lin3=(4,7000.456,1,7000.456)
lin4=(2,3000.456,25,3000.456)
lin5=(5,9000.456,850,9000.456)
lin6=(2,3000.456,19,3000.456)
lin7=(6,3000.456,35,3000.456)
lin8=(5,9000.456,1,9000.456)
lin9=(2,3000.456,3,3000.456)

li1=(2,3000.456,95,3000.456)
li2=(3,5000.456,15,5000.456)
li3=(4,7000.456,1000,7000.456)
li4=(2,3000.456,25,3000.456)
li5=(5,9000.456,35,9000.456)
li6=(2,3000.456,19,3000.456)
li7=(6,3000.456,35,3000.456)
li8=(5,9000.456,1,9000.456)
li9=(2,3000.456,3,3000.456)








bwedeLinhas=[linha1,linha2,linha3,linha4,linha5,linha6,linha7,linha8,linha9]
bwedeLinhas1=[linh1,linh2,linh3,linh4,linh5,linh6,linh7,linh8,linh9]
bwedeLinhas2=[lin1,lin2,lin3,lin4,lin5,lin6,lin7,lin8,lin9]
bwedeLinhas3=[li1,li2,li3,li4,li5,li6,li7,li8,li9]





impr::[LinhaFactura]->[LinhaFactura]            ---Retorna a lista de todos os carros vendidos em mais de uma factura
impr []=[]
impr ((d,h,f,u):[])=[]
impr ((d,h,f,u):(g,m,c,r):xs) |(d==g)   = (d,h,f+c,u):impr ((d,h,f+c,u):xs)
                              |(d/=g)  =impr ((d,h,f,u):xs)++impr ((g,m,c,r):xs)
                          
                
repetidos::[LinhaFactura]->[LinhaFactura]    ---verifica os repetidos na lista anterior
repetidos []=[]
repetidos (xs:[])=[xs]
repetidos ((d,h,f,u):(g,m,c,r):ys)|(d,h,f,u)==(g,m,c,r) =(d,h,f,u):repetidos ((g,m,c,r):ys)
                                  |otherwise=(g,m,c,r):repetidos (ys)

                          
                          

                          
maior::[LinhaFactura]->[LinhaFactura]   --procura o maior da lista
maior []=[]
maior (rs:[])=[rs]
maior ((d,h,f,u):(g,m,c,r):rs) |f>=c=maior ((d,h,f,u):rs)
                               |otherwise=maior ((g,m,c,r):rs)
                           
lista:: [(b)]->(b)      ---tira um elemento da lista, o elemento deve ser uma tupla
lista [(a)]=(a)


trata::[LinhaFactura]->(Codigo, PrecoUnitario, Quantidade, Subtotal)  ---retorna uma tupla, retira o elemento da lista
trata o= lista o

varredura::(Codigo, PrecoUnitario, Quantidade, Subtotal)->[LinhaFactura]->[LinhaFactura]   ---faz uma 
--varredura se existe alguem maior do que ele
varredura  j []=[j]
varredura  j (i:is)            |filtro j i==[j]=varredura j is 
                               |otherwise=varredura i is
                    

filtro::(Codigo, PrecoUnitario, Quantidade, Subtotal)->(Codigo, PrecoUnitario, Quantidade, Subtotal)->[(Codigo, PrecoUnitario, Quantidade, Subtotal)]   --Faz o filtro de comparação
filtro (z,b,c,d) (e,f,g,h)|c>=g     = [(z,b,c,d)]
                          |otherwise= [(e,f,g,h)]

chama::(String->[LinhaFactura])    --faz  a chamada de todas as funçoes
chama =varredura (trata (maior (impr bwedeLinhas))) bwedeLinhas 
