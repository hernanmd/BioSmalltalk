accessing private
accessionFrom: aCollection
	" Answer a new accession object using aCollection.
	Assume aCollection contains two elements, 
	first element is a String with the accession name
	second element is a String with the version number or nil "
	
	| version |
	version := aCollection size = 2 ifFalse: [ nil ] ifTrue: [ aCollection second ].
	^ results := BioAccession new 
		name: aCollection first; 
		version: version;
		yourself