accessing
exportTo: aWriteStream nameSpacing: anInteger  alignmentNumber: alnNumber
	" Private - Write the receiver's name and first alignment line then pop it from the alignment "
	
	aWriteStream	
		cr;
		nextPutAll: self name;
		nextPut: $_;
		nextPutAll: alnNumber asString.
	anInteger - self name size + 3 timesRepeat: [ aWriteStream space ].
	aWriteStream nextPutAll: self popAlignment.
