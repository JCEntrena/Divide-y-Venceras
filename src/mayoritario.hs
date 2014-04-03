{-
#!/usr/bin/env ruby
#encoding utf8

# Búsqueda del elemento mayoritario. Un algoritmo:
# Escogemos parejas de elementos consecutivos repetidos
# por ejemplo:
# [1,1,2,3,3,3] => {(1,1),(2,3),(3,3)} => [1,3]
# [3,1,1,2,3,3,3,3] => {(3,1),(1,2),(3,3),(3,3)} => [3,3]
# No necesariamente el mayoritario en el nuevo es mayoritario en
# el original, pero si existe mayoritario del original entonces
# equivale al del nuevo.
# Caso base: En tamaño 2, hay elemento mayoritario si
# ambos son iguales.
#
# Eficiencia: O(n)

class Array
  def mayoritario
    # Caso base
    return (first == last ? first : nil) if size < 3
    
    pares_repet = []

    # Tomamos las parejas de elementos repetidos
    each_slice(2) { |e|
      pares_repet << e[0] if e[0] == e[1]
    }

    # pares_repet.size <= size/2, por lo que
    # la llamada recursiva es como mucho T(n/2)
    posible = pares_repet.mayoritario

    # Cuenta de ocurrencias es O(n)
    return posible if count(posible) > size/2
    return last if size % 2 == 1 and count(last) > size/2
  end
end
-}
takePairs :: [a] -> [(a, a)]
takePairs [] = []
takePairs [x] = []
takePairs (x:y:t) = (x, y) : takePairs t

getEqPairs :: (Eq a) => [(a, a)] -> [a]
getEqPairs [] = []
getEqPairs ((x, y):t)
  | x /= y = getEqPairs t
  | x == y = x : getEqPairs t 

mayoritario :: (Eq a) => [a] -> Maybe a
mayoritario []  = Nothing
mayoritario [x] = Just x
mayoritario [x, y]
  | x /= y = Nothing
  | x == y = Just x
mayoritario xs = mayoritario rs
  where rs = getEqPairs(takePairs xs)

{- Quedaría comprobar que el mayoritario que da la 
función efectivamente lo es -}
testMayoritario :: (Eq a) => [a] -> a -> Bool
testMayoritario xs m = (freq > (div (length xs) 2))
  where freq = length $ filter (==m) xs