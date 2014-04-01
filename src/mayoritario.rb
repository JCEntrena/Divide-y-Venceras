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


if __FILE__ == $0
  puts "Introduce array: "
  line = gets.chomp
  array = line.split.map(&:to_i)

  puts "Elemento mayoritario: #{array.mayoritario}."
end