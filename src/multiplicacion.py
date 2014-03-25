#!/bin/env python
# -*- coding: utf-8 -*-

from math import ceil

def MultiplicaDV (x,y):
    length = x.bit_length() if x.bit_length() > y.bit_length() else y.bit_length()
    
    if (length < 25):
        return x*y
    else:
        a = x >> length/2
        b = x % (2 << int(ceil(length/2.0)))
        c = y >> length/2
        d = y % (2 << int(ceil(length/2.0)))
        
        ac = MultiplicaDV (a,c)
        bd = MultiplicaDV (b,d)
        
        return  ((ac << (length/2*2)) + 
                ((MultiplicaDV(a-b,d-c) + ac + bd) << length/2) +
                bd)
    

x = input ("Primer número: ")
y = input ("Segundo número: ")
#x = 0b10011011
#y = 0b10111010

print "Resultado: ", MultiplicaDV(x,y)

