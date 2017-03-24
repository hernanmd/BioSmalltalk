accessing - adding features
addCFName: aString
	" Add current feature name for the current data line "

	self assert: [ self orderIndex = 4 ].
	self outputFileStream 
		space;
		nextPutAll: aString.
	self orderIndex: self orderIndex + 1.
