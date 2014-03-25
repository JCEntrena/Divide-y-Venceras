#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encoding utf8

# Creo que es eficiencia O(n**2) en el peor caso y O(n) en el medio.

class Array
  def kesimo (k)
    # Esto tiene eficiencia O(n).
    # Partimos la lista en dos, sobre un pivote.
    pivote  = self.first
    menores = self.select { |x| x < pivote }
    mayores = self.select { |x| x > pivote }
    iguales = self.select { |x| x == pivote }

    # Estudiamos si el pivote es el elemento buscado.
    # Buscamos en el subarray correspondiente.
    particion_menores = menores.size
    particion_iguales = menores.size + iguales.size

    if k < particion_menores
      return menores.kesimo (k)
    elsif k < particion_iguales
      return pivote
    else
      return mayores.kesimo (k - menores.size - iguales.size)
    end
  end
end


if __FILE__ == $0
  puts "Introduce array: "
  line = gets.chomp
  array = line.split.map(&:to_i)

  puts "Introduce k: "
  k = (gets.chomp).to_i
  puts "k-ésimo elemento: #{array.kesimo(k)}."
end
