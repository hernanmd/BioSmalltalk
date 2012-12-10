private-algorithm
step5b
	cursor := string size.
	((self endsWith: 'll') and: [cursor + 1 >= r2]) 
		ifTrue: [self setSuffix: 'l']