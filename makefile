# Eficiencia de algoritmos.
# makefile.
# Basado en: http://stackoverflow.com/questions/9787160/makefile-that-compiles-all-cpp-files-in-a-directory-into-separate-executable

BIN=./bin
SRC=./src
DATA=./data
PLOT=./plots
FIT=./regressionPlots
TEX=./tex
FLAGS=-std=c++0x -Wall

# make all: Compilar todos los programas 
all: $(patsubst $(SRC)/%.cpp, $(BIN)/%, $(wildcard $(SRC)/*.cpp))


# Limpieza de los ejecutables
clean:
	rm $(BIN)/*

cleanall: clean
	rm *.jpg *.dat tex/*
