#!/usr/bin/env python3
# decimal to hex
# description: convert decimal numbers to hexadecimal

while (True):
    d = input('> ')
    if d.isdigit():
        print(hex(int(d)))
    elif d == 'q' or d == 'quit' or d == 'exit':
        exit()
    else:
        print(d, 'is not a number')
