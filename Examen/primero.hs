--La funcion obtiene un arreglo de size k, donde 0 <= k <= N; 
--El arreglo posee todos los numeros de 1 a N por los cuales x se puede dividir y dejar residuo 0
--El numero es divisible por todos los numeros de 1 a N si (length k) == N 
divisibles x _nums= length [y | y <- [1.._nums], mod x y == 0 ] == _nums
-- Crear una lista infinita la cual donde todos sus numeros cumplen con la funcion "divisible"
div_inf totalNums = [y | y <- [totalNums..], divisibles y totalNums] --Infinito
-- Obtener el primer elemento de la lista infinita
firstDivByNumsIn num = head (div_inf num)

-- Mandar a llamar 'obtener' con un arreglo infinito
-- obtener tiene el caso base cuando su head es 1, regresar 1 concatenado con el resultado de obtain tail
-- en todos los demas casos se concatena la head p con los numeros del infinito que su resultado de XmodP mayor a 0
-- En realidad concatena con todos los que numeros mayores a el que no son divisibles por el
-- El siguiente elemento hace lo mismo, eliminando divisibles por el...la evaluacion es infinita
-- Cortamos el ciclo infinito usando el !! nth
primes nth = obtain [1..] !! nth 
         where obtain (p:xs) 
                | p == 1 = 1: obtain xs 
                | otherwise = p: obtain [ x|x <- xs, mod x p > 0 ] --Infinito

--Recibe 1 numero que representa la cantidad de digitos
--Devuelve el palindromo mas grande generado por la multiplicacion de dos numeros con esa cantidad de digitos
palindromoDigits numDigits = maximum [ [x,y,z] | y<-[10^(numDigits-1)..10^(numDigits)-1], z<-[y..10^(numDigits)-1], --Operaciones
                                        let x=y*z,      --Hacer la operacion
                                        let s=show x,   --Convertir a texto(lista chars)
                                        s==reverse s]   --Lista == Lista invertida?

--Tipo de dato Arbol, dado en el ejercicio
data Tree a = EmptyTree | Node a (Tree a)(Tree a) deriving (Show, Read, Eq)
insertTree x EmptyTree = Node x (EmptyTree)(EmptyTree)
insertTree x (Node y left right)
        | x == y = Node x left right
        | x < y  = Node y (insertTree x left) right
        | x > y  = Node y left (insertTree x right)

--Realiza una función que reciba un árbol y que imprima los valores del árbol en INORDER
--Caso base, arbol vacio, regresar ""
--Else concatenar Left, Nodo, Right
inorder EmptyTree = [""]
inorder (Node x l r) =  (inorder l)++[show x]++(inorder r)

main = do
    print("Ruben Cuadra A01019102")
    
    print(firstDivByNumsIn 1)   --Resultado 19     : 232,792,560
    print(primes 0)             --Resultado 10,001 : 104,743
    print(palindromoDigits 1)   --Resultado 3      : 906,609
    let arbol = Node 7 (Node 6 EmptyTree EmptyTree) (Node 9 (Node 8 EmptyTree EmptyTree) EmptyTree)
    print (inorder arbol)       --Resultado arbol  : ["","6","","7","","8","","9",""]
