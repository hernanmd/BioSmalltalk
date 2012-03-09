accessing
buildResults: aCollection
	" Answer a new accession object from results taken from aCollection "
	
	^ aCollection first
		ifNil: [ 	self accessionFrom: aCollection second ]
		ifNotNil: [ self accessionFrom: aCollection ]


