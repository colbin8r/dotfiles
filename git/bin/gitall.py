#!/usr/bin/env python

import os
import subprocess
import sys

for root, dirs, files in os.walk('.'):
	if '.git' in dirs:
		print (root)
		print ('-' * 80)
		subprocess.call(args=sys.argv[1:], cwd=root)
		print ("")

