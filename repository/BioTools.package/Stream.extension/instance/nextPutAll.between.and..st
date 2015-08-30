*BioTools
nextPutAll: aCollection between: firstChar and: lastChar
	" Append the elements of aCollection between the association Character elements onto the stream. "
		
	self 
		nextPut: firstChar;
		nextPutAll: aCollection asString;
		nextPut: lastChar