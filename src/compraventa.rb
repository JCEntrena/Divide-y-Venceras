#!/usr/bin/env ruby
#encoding utf8

# Compraventa. Este algoritmo halla la mayor diferencia b-a entre elementos de un array, con b más a la derecha que a. 
# Calcularemos recursivamente el mínimo del array y las posiciones que verifican la mayor diferencia. 

# La función devuelve cuatro posiciones: [Posición de a, posición de b, posición del mínimo del array, posición del máximo del array]

class Array
    def compraventa
        # Caso base: Tenemos un array de tamaño 1. Todas las posiciones coinciden con la inicial. 
        return [0, 0, 0, 0] if size == 1             

        # De no ser así, llamamos recurvivamente a la función con las dos mitades izquierda y derecha.     

        minimal_izquierda, maximal_izquierda, minimo_izquierda, maximo_izquierda = self[0 .. size/2-1].compraventa 
        minimal_derecha, maximal_derecha, minimo_derecha, maximo_derecha = self[size/2 .. size - 1].compraventa

        # Ajustamos las posiciones de la parte derecha para que se refieran al array total, y no a la mitad derecha. 

        minimal_derecha += size/2
        maximal_derecha += size/2
        minimo_derecha += size/2
        maximo_derecha += size/2

        # Comprobamos que pareja de valores nos da la mayor ganacia: 
        # · La pareja de valores de la parte izquierda
        # · La pareja de valores de la parte derecha
        # · El máximo de la parte derecha y el mínimo de la izquierda
        # Ajustaremos los valores minimales dependiendo de cual sea la mejor de las parejas. 

        if (self.at(maximal_izquierda) - self.at(minimal_izquierda)) < (self.at(maximal_derecha) - self.at(minimal_derecha))
            minimal = minimal_derecha
            maximal = maximal_derecha
        else 
            minimal = minimal_izquierda
            maximal = maximal_izquierda
        end 

        if (self.at(maximal) - self.at(minimal)) < (self.at(maximo_derecha) - self.at(minimo_izquierda))
            maximal = maximo_derecha
            minimal = minimo_izquierda
        end

        
        # Recalculamos el mínimo y máximo.  

        minimo = self.at(minimo_izquierda) < self.at(minimo_derecha) ? minimo_izquierda : minimo_derecha
        maximo = self.at(maximo_izquierda) > self.at(maximo_derecha) ? maximo_izquierda : maximo_derecha

        [minimal, maximal, minimo, maximo] 
    end 
end 

# Valores que se muestran en pantalla: 
# - Momento de compra (posición del elemento minimal). 
# - Momento de venta (posición del elemento maximal). 
# - Posición del mínimo del vector (irrelevante). 
# - Posición del máximo del vector (irrelevante). 

array = [40,10,50,3,45,12]

compra, venta, min, max = array.compraventa

puts "Momento de compra: #{compra}. Valor de compra: #{array.at(compra)} \nMomento de venta: #{venta}. Valor de venta: #{array.at(venta)}"







