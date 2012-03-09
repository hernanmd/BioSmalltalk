filtering-blast-accessions
accessionsIncludes: accessionCollection
	" Answer a Collection of filtered objects with the receiver's accession nodes included in the strings in accessionCollection (ignoring case) "
	
	^ accessionCollection size = 1
		ifTrue: [ 
			self 
				accession: accessionCollection anyOne
				condition: #includes: ]
		ifFalse: [
			self 
				accessions: accessionCollection 
				condition: #includes: ]