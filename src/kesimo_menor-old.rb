#!/usr/bin/env ruby
#encoding utf8

# Búsqueda del k-ésimo menor elemento. Un algoritmo:
# Encontramos el mínimo elemento y lo eliminamos (para
# ello lo sustituimos por el último y eliminamos este).
# Buscamos el (k-1)-ésimo elemento del vector
# resultante.
#
# Eficiencia: O(nk) (?)

class Array
	def k_menor(k)
		i_min = nil

		# Esto es O(n)
		each_with_index { |e, i|
			i_min = i if i_min.nil? or self[i_min] > e
		}

		if k < 2
			self[i_min]
		else
			self[i_min] = last
			# Duda importante: ¿Los elementos repetidos se consideran como
			# elementos "distintos", o se han de eliminar todos a la vez?

			self[0 .. size - 1].k_menor(k - 1)
		end
	end
end

puts [3,4,1,1,2,3,4].k_menor 2