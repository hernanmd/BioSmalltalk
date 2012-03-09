*BioTools
nextPutAll: aCollection between: anAssociation
	" Append the elements of aCollection between the association 
	elements onto the stream. Answer aCollection. "
		
	self 
		nextPutAll: anAssociation key asString;
		nextPutAll: aCollection asString;
		nextPutAll: anAssociation value asString