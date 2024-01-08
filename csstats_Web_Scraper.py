import time
import pynput.mouse as ms
import pynput.keyboard as kb
from pynput.mouse import Button
from pynput.keyboard import Key


mouse = ms.Controller()
keyboard = kb.Controller()

#from pynput import keyboardmouse.scroll(0, -0.1)
from pynput.keyboard import Controller

def typex(strx):
    for x in strx :
        keyboard.press(x)
        keyboard.release(x)


#time.sleep(1)
#mouse.scroll(0, 0.25)
#exit()

#f = open(r"C:\Users\peter\Desktop\GameStats\Vlad.html", encoding="utf-8")
#mystr = f.read()
#gamecount = mystr.count("text-align:left; white-space:nowrap; position:relative;")
gamecount = 250
matchcounter = 1
##THIS IS THE SCROLL TEST RUN
'''
for o in range(gamecount):
    time.sleep(0.2)#delete
    if(matchcounter % 20 == 2):
        mouse.scroll(0, 0.025)
    if(matchcounter != 1):
        if (matchcounter % 7 != 0):
            mouse.scroll(0, -0.44)
        else:
            mouse.scroll(0, -0.45)
    matchcounter = matchcounter + 1
'''

time.sleep(1)
#mouse.position = (1450, 687)
#time.sleep(3)
for o in range(gamecount):
    time.sleep(0.3)
    mouse.position = (800, 150)
    mouse.press(Button.left)
    mouse.release(Button.left)
    time.sleep(0.3)
    mouse.position = (1450, 687)
    if(matchcounter % 20 == 2):
        mouse.scroll(0, 0.025)
    if(matchcounter != 1):
        if (matchcounter % 7 != 0):
            mouse.scroll(0, -0.44)
        else:
            mouse.scroll(0, -0.45)
    time.sleep(0.3)
    mouse.press(Button.left)
    mouse.release(Button.left)
    time.sleep(1.5)
    mouse.position = (800, 300)
    mouse.press(Button.right)
    mouse.release(Button.right)
    time.sleep(0.3)#e
    mouse.move(100,85)
    time.sleep(0.4)#e
    mouse.press(Button.left)
    mouse.release(Button.left)
    time.sleep(0.7)
    keyboard.press(Key.backspace)
    keyboard.release(Key.backspace)
    time.sleep(0.3)
    typex(str(matchcounter))
    time.sleep(0.3)
    mouse.position = (580, 470)
    time.sleep(0.1)
    mouse.press(Button.left)
    mouse.release(Button.left)
    time.sleep(1.5)
    mouse.position = (20, 50)
    time.sleep(0.3)
    mouse.press(Button.left)
    mouse.release(Button.left)
    time.sleep(0.3)
    matchcounter = matchcounter + 1


# Press and release
#mouse.press(Button.left)
#mouse.release(Button.left)

# Double click; this is different from pressing and releasing
# twice on macOS
#mouse.click(Button.left, 2)

# Scroll two steps down0)
#     for i in range(matchcounter):
#         mouse.scroll(0, -0.1)
#         time.sleep(0.5)
#
# # Read pointer position
# print('The current pointer position is {0}'.format(
#     mouse.position))
#
# # Set pointer position
# #mouse.position = (10, 20)
#
# # Move pointer relative to current position
# #mou