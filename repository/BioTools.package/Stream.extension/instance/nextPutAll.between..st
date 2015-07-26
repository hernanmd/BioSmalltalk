*BioTools
nextPutAll: aCollection between: anAssociation
	" Append the elements of aCollection between the association Character elements onto the stream. "
		
	self 
		nextPut: anAssociation key;
		nextPutAll: aCollection asString;
		nextPut: anAssociation value