#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#encoding utf8

# Creo que es eficiencia O(n**2) en el peor caso y O(n) en el medio.

class Array
  def kesimo (k)
    pivote = self.first

    # Esto tiene eficiencia O(n).
    # Partimos la lista en dos, sobre un pivote.
    i = 1
    j = size - 1
    while i < j do
      if self[i] < pivote
        i += 1
      elsif self[j] > pivote
        j -= 1
      else
        self[i],self[j] = self[j],self[i]
        i += 1
        j -= 1
      end
    end

    # Lleva el pivote a su sitio.
    first,self[j] = self[j],first

    # Estudiamos si el pivote es el elemento buscado.
    # Buscamos en el subarray correspondiente.
    if j == k
      return self[j]
    elsif j < k
      return self[j+1..size-1].kesimo(k-j-1)
    else
      return self[0..j-1].kesimo(k)
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
