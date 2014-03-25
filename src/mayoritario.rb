#!/usr/bin/env ruby
#encoding utf8

# Búsqueda del elemento mayoritario. Un algoritmo:
# Escogemos los elementos repetidos consecutivamente
# en el array, hallamos el mayoritario de estos (y vemos
# si es mayoritario del original).
# Caso base: En tamaño 2, hay elemento mayoritario si
# ambos son iguales.
#
# Eficiencia: O(n) (?)

class Array
  protected
  def posible_mayoritario
    # Caso base
    return (first == last ? first : nil) if size < 3
    
    # Escogemos elementos que tengan repeticiones consecutivas,
    # por ejemplo [1,1,2,3,3,3] => [1,3,3]
    # No necesariamente el mayoritario en el nuevo es mayoritario en
    # el original, pero si existe mayoritario del original entonces
    # equivale al del nuevo.
    repet_consec = []
    # O(n)
    each_with_index { |e, i| 
      repet_consec << e if i+1 == size or e == self[i+1] 
    }

    # repet_consec.size <= size/2, por lo que
    # la llamada recursiva es como mucho a T(n/2)
    return repet_consec.posible_mayoritario
  end

  public
  def mayoritario
    posible = posible_mayoritario

    # Comprobamos si es mayoritario (O(n))
    return posible if count(posible) > size/2
  end
end


if __FILE__ == $0
  puts "Introduce array: "
  line = gets.chomp
  array = line.split.map(&:to_i)

  puts "Elemento mayoritario: #{array.mayoritario}."
end