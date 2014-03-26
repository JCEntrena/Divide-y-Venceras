#!/usr/bin/env ruby
#encoding utf8

# Tornillos y tuercas. Un algoritmo:
# Escogemos un tornillo pivote y dejamos las
# tuercas menores en una lista, las mayores en otra
# y encontramos su pareja. Utilizamos la pareja para
# repartir los tornillos de igual forma.
# Emparejamos las listas izquierdas y las derechas por
# separado. Juntamos con el pivote en medio.
# Eficiencia: caso medio T(n) = 2T(n/2) + O(n) => O(n log n)
#             caso peor cuadrático

# (Esto es básicamente un quicksort, no?)

def empareja(tornillos, tuercas)
  # Caso base
  return [[],[]] if tornillos.size < 1

  # La elección del pivote afectará a la eficiencia
  pivote = tornillos.first
  # Todo O(n)
  pareja = tuercas[tuercas.index pivote]
  to_izq = tornillos.select { |e| e < pareja }
  to_der = tornillos.select { |e| e > pareja }
  tu_izq = tuercas.select { |e| e < pivote }
  tu_der = tuercas.select { |e| e > pivote }

  to_izq, tu_izq = empareja to_izq, tu_izq
  to_der, tu_der = empareja to_der, tu_der

  # Devolvemos en el formato [tornillos_ordenados, tuercas_ordenadas]
  [
    to_izq + [pivote] + to_der,
    tu_izq + [pareja] + tu_der
  ]
end

puts (empareja [2, 5, 3, 6, 1, 4], [4, 2, 5, 1, 6, 3]).to_s