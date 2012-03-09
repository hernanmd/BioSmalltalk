filtering-blast-accessions
accessionsBeginWith: accessionCollection
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	^ accessionCollection size = 1
		ifTrue: [ 
			self 
				accession: accessionCollection anyOne
				condition: #beginsWith: ]
		ifFalse: [
			self 
				accessions: accessionCollection 
				condition: #beginsWith: ]