#!/usr/bin/env ruby
#encoding utf8

# Compraventa. Este algoritmo halla la mayor diferencia b-a
# entre elementos de un array, con b más a la derecha que a 
# Calcularemos recursivamente el mínimo del array y las
# posiciones que verifican la mayor diferencia. 

# La función devuelve cuatro posiciones: [Posición de a,
# posición de b, posición del mínimo del array, posición
# del máximo del array]

class Array
    def compraventa
        # Caso base: Tenemos un array de tamaño 1. Todas 
        # las posiciones coinciden con la inicial. 
        return [0, 0, 0, 0] if size == 1             

        # De no ser así, llamamos recurvivamente a la 
        # función con las dos mitades izquierda y derecha.     

        minimal_izq, maximal_izq, min_izq, max_izq = self[0 .. size/2-1].compraventa 
        minimal_dcha, maximal_dcha, min_dcha, max_dcha = self[size/2 .. size - 1].compraventa

        # Ajustamos las posiciones de la parte derecha para
        # que se refieran al array total, y no a la mitad 
        # derecha. 

        minimal_dcha += size/2
        maximal_dcha += size/2
        min_dcha += size/2
        max_dcha += size/2

        if (self.at(maximal_izq) - self.at(minimal_izq)) < (self.at(maximal_dcha) - self.at(minimal_dcha))
            minimal = minimal_dcha
            maximal = maximal_dcha
        else 
            minimal = minimal_izq
            maximal = maximal_izq
        end 

        if (self.at(maximal) - self.at(minimal)) < (self.at(max_dcha) - self.at(min_izq))
            maximal = max_dcha
            minimal = min_izq
        end
        
        # Recalculamos el mínimo y máximo.  
        min = self.at(min_izq) < self.at(min_dcha) ? min_izq : min_dcha
        max = self.at(max_izq) > self.at(max_dcha) ? max_izq : max_dcha

        [minimal, maximal, min, max] 
    end 
end

array = [40,10,50,3,45,12]

compra, venta, min, max = array.compraventa

puts "Momento de compra: #{compra}. Valor de compra: #{array.at(compra)} \nMomento de venta: #{venta}. Valor de venta: #{array.at(venta)}"







