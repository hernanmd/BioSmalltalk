benchmarking
writeFasta: aString from: inStream to: outStream lineLength: lineLength

	| i |
	outStream 
		nextPut: $>; 
		nextPutAll: aString; 
		cr.
	i := 0.
	[ inStream atEnd ] whileFalse:
	      [ i == lineLength ifTrue: [ outStream cr. i := 0 ].
	      outStream nextPut: inStream next.
	      i := i + 1 ].
   outStream 
		cr;
		flush.