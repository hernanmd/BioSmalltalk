accessing
downloadUrl
	" See superimplementor's comment "

	| cUrl |
	
	cUrl := self urlClass fromString: self url asString.
	^ cUrl asString
"	^ String streamContents: [ : str |
		str 
			nextPutAll: 'http://';
			nextPutAll: cUrl host;
			nextPut: $/.
		cUrl hasPath
			ifTrue: [ str nextPutAll: cUrl path ] ]"
