#!/usr/bin/env python3
# DESCRIPTION: keep the machine awake my giving the mous a slight jiggle periodically
# DEPENDENCIES: python3, pyautogui (pip3 install pyautogui)
import pyautogui
from time import sleep
from random import randint

while (1):
    x, y = pyautogui.position()
    pyautogui.moveTo(x^1, y^1)
    sleep(randint(0, 60))
