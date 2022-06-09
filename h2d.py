#!/usr/bin/env python3
# hex to decimal
# description: convert hexadecimal to decimal

while (True):
    h = input('> ')
    try:
        print(int(h, 16))
    except ValueError:
        if h == 'q' or h == 'quit' or h == 'exit':
            exit()
        else:
            print(h, 'is not hexadecimal')
