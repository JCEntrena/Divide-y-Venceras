

#include <iostream>
#include <vector>
#include <numeric>
#include <omp.h>
using namespace std;
typedef vector<int>::iterator vit;

int suma_bucle(vit inicio, vit final) {
    int suma = 0;
    
    for (vit i = inicio; i != final; ++i) {
        suma += *i;
    }

    return suma;
}

int suma_dividida(vit inicio, vit final) {
    if (inicio == final)
        return *inicio;
    else {
        vit mitad(inicio);

        // std::distance y std::advance son constantes para iteradores 
        // "Random Access", que son los que usa std::vector
        std::advance(mitad, std::distance(inicio, final)/2);
        int suma_der = suma_dividida (inicio, mitad);
        int suma_izq = mitad < final ? suma_dividida (++mitad, final) : 0;
        return suma_der + suma_izq;
    }
}

int suma_paralela(vector<int>& numeros) {
    if (numeros.size() == 1)
        return numeros[0];
    else {
        // Calculamos el tamaño del nuevo vector como la mitad
        // del antiguo (más uno si el tamaño era impar)
        vector<int> suma_pares(numeros.size()/2 + (numeros.size() % 2 == 1));

        #pragma omp parallel for
        for (int i = 0; i < suma_pares.size(); ++i) {
            // Sumamos una pareja, en el caso del último elemento 
            // si el tamaño es impar, lo dejamos tal cual
            suma_pares[i] = numeros[2*i] + (2*i+1 == numeros.size() ? 0 : numeros[2*i+1]);
        }

        return suma_paralela(suma_pares);
    }
}

int main() {
    vector<int> ejemplo(20);

    std::iota(ejemplo.begin(), ejemplo.end(), 1);

    cout << suma_dividida(ejemplo.begin(), --ejemplo.end()) << 
        " = " << suma_paralela(ejemplo) << 
        " = " << suma_bucle(ejemplo.begin(), ejemplo.end()) << 
        " = " << std::accumulate(ejemplo.begin(), ejemplo.end(), 0) << endl;
}

