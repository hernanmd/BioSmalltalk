accessing
exportTo: aWriteStream nameSpacing: anInteger 
	" Private - Write the receiver's name and first alignment line then pop it from the alignment "
	
	aWriteStream	nextPutAll: self name.
	anInteger - self name size + 1 timesRepeat: [ aWriteStream space ].
	aWriteStream nextPutAll: self popAlignment.
