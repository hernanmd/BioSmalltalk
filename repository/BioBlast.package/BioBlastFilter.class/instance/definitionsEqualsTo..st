filtering-blast-definitions
definitionsEqualsTo: aTermCollection
	" Answer a filtered result with the receiver's definition nodes equals with the strings in aTermCollection (ignoring case) "
	
	^ aTermCollection size = 1
		ifTrue: [ 
			self
				definition: aTermCollection anyOne
				condition: #sameAs: ]
		ifFalse: [	
			self 
				definitions: aTermCollection 
				condition: #sameAs: ]