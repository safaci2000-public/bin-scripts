#!/usr/bin/env python
str_num = raw_input("How many nodes will be in your cluster? " )
num = int(str_num)

for n in range(num):
	print int(2**127 / num * n)
