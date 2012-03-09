filtering-blast-accessions
accessionsEqualsTo: accessionCollection
	" Answer a Collection of filtered objects with the receiver's accession nodes equal to the strings in accessionCollection (ignoring case) "
	
	^ accessionCollection size = 1
		ifTrue: [ 
			self 
				accession: accessionCollection anyOne
				condition: #sameAs: ]
		ifFalse: [
			self 
				accessions: accessionCollection 
				condition: #sameAs: ]