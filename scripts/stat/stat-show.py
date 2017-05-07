#!/bin/python3
from datetime import date
import re

x=[]
y=[]
day0=None

with open("stat.log") as fd:
	for line in fd:
		thedate=line.split()[0]
		queries=line.split()[1]
		d=re.match ("(\d*)-(\d*)-(\d*)", thedate).groups()
		if day0 is None:
			day0=date(int(d[0]), int(d[1]), int(d[2]))
		delta = date(int(d[0]), int(d[1]), int(d[2])) - day0
		x.append(delta.days)
		y.append(int(queries))

print(x)
print(y)

import matplotlib.pyplot as plt  
plt.bar(x, y)
plt.show()
