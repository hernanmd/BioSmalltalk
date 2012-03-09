*BioTools
nextPutFirst: aCollection between: anAssociation
	" Append the first elements of aCollection between the association 
	elements onto the stream. Answer aCollection. "
	
	| subCol |
	subCol := aCollection size >= 15
		ifTrue: [ aCollection asString first: 15 ]
		ifFalse: [ aCollection asString first: aCollection size ].
	self 
		space;
		nextPut: anAssociation key;
		nextPutAll: subCol ;
		nextPutAll: '...';
		nextPut: anAssociation value