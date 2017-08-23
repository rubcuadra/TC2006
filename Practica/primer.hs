import Data.Char

main = do
-- print([y | x <- [1..100], x>1, mod x 10 == 0, let y = x+10])

--Todas las combinaciones que cumplan con Z*z = x*x + y*y en rango g
--let g = [1..100]
-- print( [(x,y,z) | x <- g, 
--                   y <- g, 
--                   z <- g,
--                   z^2 == x^2 + y^2 ] )

-- Contar numeros negativos
-- print( length(filter(<0)[-1000..1000]))

-- Sumar numeros impares en rango
-- let inpar num = mod num 2 == 1 
-- print( sum(filter(inpar)[ x | x <- [1..1000000] ]) )

-- let saludo = "Hola como estas?"
-- print( [ toUpper(y) | y <- saludo ] )

-- let maxlist [] = error "maximum of empty list"
--     maxlist [e] = e
--     maxlist (h:t) = max h (maxlist t)
-- print( maxlist [10,18,45,32,1,2,3] )

-- let factorial 0 = 1
--     factorial n = n*factorial(n-1)
-- print( factorial 5 )

let lastt (ultimos, h:t) = if (length(t)==ultimos) then 1 else 2 --lastt( ultimos t )



print( lastt( 3, [1,2,3,4] ) )


