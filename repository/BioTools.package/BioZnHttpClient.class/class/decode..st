accessing
decode: aString
	" See superimplementor's comment "

	| cUrl |
	
	cUrl := self urlClass fromString: aString.
	^ String streamContents: [ : str |
		str 
			nextPutAll: 'http://';
			nextPutAll: cUrl host;
			nextPut: $/;
			nextPutAll: cUrl path ]
