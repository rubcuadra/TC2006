main = do
print("Ruben Cuadra A01019102")
-- -- El numero es divisible por todos si obtenemos un arreglo del tamano N, por que los N elementos dan mod == 0
let divisibles x _nums= length [y | y <- [1.._nums], mod x y == 0 ] == _nums
-- Obtenemos todos los numeros que cumplan con ser divisibles entre 1 y totalNums
let d totalNums = [y | y <- [totalNums..], divisibles y totalNums]
-- Que nos regrese la head nada mas
let firstDivByNumsIn num = head (d num)
print(firstDivByNumsIn 20)   --Resultado: 232,792,560

-- Mandar a llamar 'obtener' con un arreglo infinito
-- obtener tiene el caso base cuando su head es 1, regresar 1 concatenado con el resultado de obtain tail
-- en todos los demas casos se concatena la head p con los numeros del infinito que su resultado de XmodP mayor a 0
-- En realidad concatena con todos los que numeros mayores a el que no son divisibles por el
-- El siguiente elemento hace lo mismo, eliminando divisibles por el...la evaluacion es infinita
-- Cortamos el ciclo infinito usando el !! nth
let primes nth = obtain [1..] !! nth 
             where obtain (p:xs) 
                    | p == 1 = 1: obtain xs 
                    | otherwise = p: obtain [ x|x <- xs, mod x p > 0 ] --Infinito
print(primes 10) -- Resultado: 104,743