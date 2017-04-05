accessing - adding features
addCFRGB: colorCollection
	" Add current feature individual color for the current data line.
	colorCollection is a <Collection> of <Color> instances in RGB order "

	self assert: [ self orderIndex = 9 ].
	self outputFileStream 
		space;
		nextPutAll: colorCollection first;
		nextPut: $,;
		nextPutAll: colorCollection second;
		nextPut: $,;
		nextPutAll: colorCollection third.
	self orderIndex: self orderIndex + 1.