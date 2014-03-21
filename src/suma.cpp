

#include <iostream>
#include <vector>
using namespace std;
typedef vector<int>::iterator vit;


int suma_dividida(vit inicio, vit final) {
    if (inicio == final)
	return *inicio;
    else {
	vit mitad = inicio + (inicio-final)/2;
	int suma_der = suma_dividida (inicio, mitad);
	int suma_izq = suma_dividida (++mitad, final);
	return suma_der + suma_izq;
    }
}


int main() {
}

