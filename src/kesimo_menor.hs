{-
  Caso medio lineal, caso peor cuadrático.
  Toma un pivote, parte la lista en tres partes y toma la parte del késimo elemento. 
 -}
kesimo :: (Ord a) => [a] -> Int -> Maybe a
kesimo []          _ = Nothing
kesimo (pivote:xs) k
  | k < parte1 = kesimo menores k
  | k < parte2 = Just pivote 
  | otherwise  = kesimo mayores (k-parte2)
    where menores = filter (< pivote) xs
          mayores = filter (> pivote) xs
          iguales = filter (==pivote) xs
          parte1  = length menores
          parte2  = parte1 + length iguales + 1 