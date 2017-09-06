data Point = Point Float Float deriving (Show)
data Shape = Circle Float 
           | Rectangle Point Point deriving (Show)

data Date = Date Int String Int deriving (Show)
data Fecha = Fecha {day::Int, month::String, year::Int} deriving (Show,Read)
{-
    TypeClasses:
        Show -> toString
        Read -> From String to DataType
        Ord  -> Comparar
        Bounden -> Mins y Maxs 
-}

-- Funciones
area (Circle r) = pi*r*r

getDay(Date num _ _) = num
getMonth(Date _ mes _) = mes
getYear(Date _ _ year) = year

main = do
    let circ = Circle 3.2
    let rect = Rectangle (Point 1 1) (Point 2 2)
    let hoy = Date 6 "Sept" 2017
    let _hoy = Fecha { year=2017, month="Sept", day=6 }
    
    print _hoy
    print hoy

    print (year _hoy) 
    print (getYear hoy)
    --print( area ( circ ) )

