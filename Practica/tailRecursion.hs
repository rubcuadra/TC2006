main = do

{-
    let ft n res
         | n==0 = res
         | otherwise = ft (n-1) (res*n)
-}
    -- Factorial
    let factorialTail x = ft (x-1) (x) 
                        where ft n res
                                | n==0 = res
                                | otherwise = ft (n-1) (res*n)

    -- Recibe una lista como parametro, la regresa volteada
    let reverse (h:t) = ft (t) ([h])
                        where ft (p:s) (hr)
                                | s == [] = p:hr
                                | otherwise = ft (s) ( p:hr )     

    --Regresa una tupla con (minimo, maximo)
    let maxmin l = fn (tail l) (head l) (head l)
                    where fn l maxx minn
                           | l==[] = (minn, maxx)
                           | (head l) > maxx = fn (tail l) (head l) minn
                           | (head l) < minn  = fn (tail l) maxx (head l)
                           | otherwise = fn (tail l) maxx minn

    print ( maxmin [1,2,3,4] )
    print( factorialTail(5)  )
    print( reverse( [1,2,3] ) )
