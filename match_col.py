#match col1 and 2 from two different files

import csv

with open('aa.txt') as f: # to open the bed track 
	lines = f.readlines()
	
	reader = csv.reader(lines, delimiter='\t')
	for row in reader:
		col1=row[0] # 1st column
		col2=row[1] # 2nd column


		with open('bb.txt') as f1: # to open the bed track 
			lines1 = f1.readlines()
	
			reader1 = csv.reader(lines1, delimiter='\t')
			for row1 in reader1:
				col1=row1[0] # 1st column
				col2=row1[1] # 2nd column

				if (row[0] == row1[0]) and (row[1] == row1[1]):
					with open("file3.txt", "ab") as myfile:
						myfile.write(str(row1)+'\n')
