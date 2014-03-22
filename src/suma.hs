{-
  Sea un grupo abeliano (A,f) para el que z es un elemento neutro. 
  Es decir, tenemos que: (f a b) = (f b a), y además, (f z a) = a. 
  Para comprimir una lista, podemos comprimir cada una de las mitades de la lista y unirlas.
  Usamos la técnica Divide y Vencerás.
-}
foldDivide :: (a -> a -> a) -> a -> [a] -> a
foldDivide f z [] = z
foldDivide f z [x] = x
foldDivide f z xs = f (foldDivide f z as) (foldDivide f z bs)
  where (as,bs) = splitAt (div (length xs) 2) xs


{-
  La suma buscada es el caso particular de la suma en el grupo abeliano de los enteros,
  con (+) como operación y 0 como elemento neutro.
-}
sumDivide :: [Int] -> Int
sumDivide = foldDivide (+) 0