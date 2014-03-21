

#include <iostream>
#include <vector>
#include <numeric>
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


int main() {
    vector<int> ejemplo(20);

    std::iota(ejemplo.begin(), ejemplo.end(), 1);

    cout << suma_dividida(ejemplo.begin(), --ejemplo.end()) << 
        " = " << suma_bucle(ejemplo.begin(), ejemplo.end()) << 
        " = " << std::accumulate(ejemplo.begin(), ejemplo.end(), 0) << endl;
}

