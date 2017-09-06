data Point = Point Float Float deriving (Show)
data Shape = Circle Float 
           | Rectangle Point Point deriving (Show)

data Date = Date Int String Int deriving (Show)
data Fecha = Fecha {day::Int, month::String, year::Int} deriving (Show,Read)

data Pair key val = Pair key val deriving(Show) --Definir cualquier tipo

data Lista l = Vacia 
             | Concat l (Lista l) deriving(Show)

-- data Node x = Node x deriving(Show)
data Tree x = EmptyTree 
            | Node x (Tree x) (Tree x) deriving(Show)

{-
    TypeClasses:
        Show -> toString
        Read -> From String to DataType
        Ord  -> Comparar
        Bounden -> Mins y Maxs 
-}

-- Funciones
area (Circle r) = pi*r*r
area (Rectangle (Point x1 y1) (Point x2 y2)) = abs $ (x1-x2)*(y1-y2) 

getDay(Date num _ _) = num
getMonth(Date _ mes _) = mes
getYear(Date _ _ year) = year

{-
    Crea arboles, caso base es cuando nos dan 1 numero y un arbol vacio, regresar ese nodo con dos vacios debajo de el
    en otro caso comparar, si es == no se agrega nada, si es < se va a la izq y si no derecha
-}
insertt x EmptyTree = Node x EmptyTree EmptyTree
insertt x (Node z left right) 
        | x==z      = Node z left right
        | x <z      = Node z (insertt x left) right
        | otherwise = Node z left (insertt x right) 

{-
    Recibe una lista de elementos, ejecuta una funcion llamada ft la cual recibe 3 parametros
        valor_a_insertar (head:tail de elementos restantes) arbol_actual
    Cuando (tail == []) => se acabo el arreglo
        1) insertar valor_a_insertar en arbol_actual
        2) insertar head en el resultado de 1)
    De otra forma se ejecuta la funcion ft (head tail arbol_actual) 
-}
toTree (f:l) = ft f l EmptyTree 
         where ft (val) (h:t) (currentTree)
                | t == []   = insertt h (insertt val currentTree)
                | otherwise = ft h t (insertt val currentTree) 

main = do
    let circ = Circle 3.2
    let rect = Rectangle (Point 0 0) (Point 2 6)
    print( area circ )
    print( area rect )

    let today = Date 6 "Sept" 2017
    print (today)
    print (getYear today)

    let hoy = Fecha { year=2017, month="Sept", day=6 }
    let _hoy = read "Fecha { day=6, month=\"Sept\", year=2017}" :: Fecha
    print (hoy)
    print (_hoy)
    print (year hoy) 
    
    let v = Vacia
    let myList = Concat 5 v
    let myList2 = Concat 8 myList
    print myList2
                
    {-
    arbol
        7
      /   \ 
    6       9

    insertt 8 arbol   
        7
      /   \ 
    6       9
          /
        8
    -}
    let arbol = Node 7 (Node 6 EmptyTree EmptyTree) (Node 9 EmptyTree EmptyTree)
    print arbol
    print ( insertt 8 arbol)
    let lista = [6,8,9,1,2]
    print ( toTree lista  )
    print("END")
    
    

