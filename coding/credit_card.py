import fileinput
import re

for line in fileinput.input():
    nodash = re.sub("-", "", line)
    valid = re.search("[4-6]\d{3}(-?\d{4}){3}$", line)
    n = 0
    repeat = 0
    while n < 10 and valid != None:
        repeat = nodash.find(str(n)+str(n)+str(n)+str(n))
        if repeat > 0:
            break
        n += 1
    if valid == None or repeat > 0:
        print("Invalid")
    else:
        print("Valid")
