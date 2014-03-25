/**
 * @file Tornillos y tuercas
 */

#include <iostream>
#include <list>
using namespace std;

struct Tornillo{
    int paso;

    Tornillo(int d=0){
        paso = d;
    }
};

struct Tuerca{
    int rosca;

    Tuerca(int d=0){
        rosca = d;
    }
};

bool operator==(Tornillo a, Tuerca b){
    return a.paso == b.rosca;
}

bool operator<(Tornillo a, Tuerca b){
    return a.paso < b.rosca;
}

bool operator>(Tornillo a, Tuerca b){
    return a.paso > b.rosca;
}

bool operator==(Tuerca a, Tornillo b){
    return b == a;
}

bool operator<(Tuerca a, Tornillo b){
    return b > a;
}

bool operator>(Tuerca a, Tornillo b){
    return b < a;
}

/**
 * @brief Ordena los tornillos y las tuercas.
 * @param tornillos: lista de tornillos. Es modificada.
 * @param tuercas: lista de tuercas. Es modificada.
 * 
 * Cambia el orden de los elementos de Tornillos y de
 * Tuercas de forma que los dispone de menor a mayor.
 *
 * Es una implementación caótica, pero no logro mejorarla. Cubero me mataría. XD
 * La idea es:
 * ·Cogemos un tornillo.
 * ·Dividimos las tuercas en 3 grupos: las menores, las mayores y la pareja.
 * ·Dividimos los tornillos en 2 grupos usando la pareja: los menores y los mayores.
 * ·Aplicamos el mismo método a tornillos y tuercas mayores, y menores.
 * ·Reconstruimos la lista bien ordenada.
 *
 * PD:Quizás en ruby sea más bonito.
 */

inline static void ordenar_Tornillos_y_Tuercas(list<Tornillo> &tornillos, list<Tuerca> &tuercas){
    list<Tuerca> tuercas_menores, tuercas_mayores;
    list<Tornillo> tornillos_menores, tornillos_mayores;
//  ·Cogemos un tornillo.
    Tornillo uno = tornillos.front();                     //Por coger alguno
    tornillos.pop_front();
    Tuerca pareja;

    Tuerca tuerca;
    Tornillo tornillo;

// ·Dividimos las tuercas en 3 grupos: las menores, las mayores y la pareja.
    while(!tuercas.empty()){
        tuerca = tuercas.front();
        tuercas.pop_front();

        if(tuerca < uno){
            tuercas_menores.push_front(tuerca);
        }
        else if(tuerca > uno){
            tuercas_mayores.push_front(tuerca);
        }
        else{                     //Sólo habrá una
            pareja = tuerca;
        }
    }

// ·Dividimos los tornillos en 2 grupos usando la pareja: los menores y los mayores.
    while(!tornillos.empty()){
        tornillo = tornillos.front();
        tornillos.pop_front();

        if(tornillo < pareja){
            tornillos_menores.push_front(tornillo);
        }
        //Dado que cada tuerca sólo tiene un tornillo-pareja, y la pareja de "pareja" es "uno", si no son menores, serán mayores
        else{
            tornillos_mayores.push_front(tornillo);
        }
    }

//  ·Aplicamos el mismo método a tornillos y tuercas mayores, y menores.
    //Ordenamos si no son listas vacías(no comprobamos las tuercas porque están relacionadas con los tornillos).
    if(!tornillos_mayores.empty())
        ordenar_Tornillos_y_Tuercas(tornillos_mayores, tuercas_mayores);
    if(!tornillos_menores.empty())
        ordenar_Tornillos_y_Tuercas(tornillos_menores, tuercas_menores);


// ·Reconstruimos la lista bien ordenada.
    //Formamos las listas ordenadas:
    // Tornillos:
    while(!tornillos_menores.empty()){
      tornillos.push_back(tornillos_menores.front());
      tornillos_menores.pop_front();
    }
    tornillos.push_back(uno);
    while(!tornillos_mayores.empty()){
      tornillos.push_back(tornillos_mayores.front());
      tornillos_mayores.pop_front();
    }

    // Tuercas:
    while(!tuercas_menores.empty()){
      tuercas.push_back(tuercas_menores.front());
      tuercas_menores.pop_front();
    }
    tuercas.push_back(pareja);
    while(!tuercas_mayores.empty()){
      tuercas.push_back(tuercas_mayores.front());
      tuercas_mayores.pop_front();
    }
}

int main(){
    list<Tornillo> tornillos;
    list<Tuerca> tuercas;

    //Rellenar las listas "desordenadamente"
    for(int i = 0; i < 20; i+=2){
        tornillos.push_front(Tornillo(2*i));
        tornillos.push_front(Tornillo(i+1));
        tuercas.push_front(Tuerca(2*i));
        tuercas.push_back(Tuerca(i+1));
    }

    cout << "Antes...";
    cout << "\nTornillos:\n";
    for(list<Tornillo>::iterator it = tornillos.begin(); it != tornillos.end(); it++){
        cout << it->paso << ", ";
    }

    cout << "\nTuercas:\n";
    for(list<Tuerca>::iterator it = tuercas.begin(); it != tuercas.end(); it++){
        cout << it->rosca << ", ";
    }    

    ordenar_Tornillos_y_Tuercas(tornillos, tuercas);

    cout << "\n\nDespués...";
    cout << "\nTornillos:\n";
    for(list<Tornillo>::iterator it = tornillos.begin(); it != tornillos.end(); it++){
        cout << it->paso << ", ";
    }

    cout << "\nTuercas:\n";
    for(list<Tuerca>::iterator it = tuercas.begin(); it != tuercas.end(); it++){
        cout << it->rosca << ", ";
    }    

    return 0;
}
