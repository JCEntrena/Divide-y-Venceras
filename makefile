# Algoritmos Divide y vencerás.
# makefile.
# Basado en: http://stackoverflow.com/questions/9787160/makefile-that-compiles-all-cpp-files-in-a-directory-into-separate-executable

BIN=./bin
SRC=./src
DATA=./data
PLOT=./plots
FIT=./regressionPlots
TEX=./tex
FLAGS=-std=c++0x -Wall -fopenmp

# make all: Compilar todos los programas 
all: $(patsubst $(SRC)/%.cpp, $(BIN)/%, $(wildcard $(SRC)/*.cpp))
rbtex: $(patsubst $(SRC)/%.rb, $(TEX)/%.tex, $(wildcard $(SRC)/*.rb))
hstex: $(patsubst $(SRC)/%.hs, $(TEX)/%.tex, $(wildcard $(SRC)/*.hs))

$(BIN)/%: $(SRC)/%.cpp
	g++ $< -o $@ $(FLAGS)

$(TEX)/%.tex: $(SRC)/%.rb
	source-highlight -f latexcolor -i $< -o $@

# Limpieza de los ejecutables
clean:
	rm $(BIN)/*

cleanall: clean
	rm *.jpg *.dat tex/*
