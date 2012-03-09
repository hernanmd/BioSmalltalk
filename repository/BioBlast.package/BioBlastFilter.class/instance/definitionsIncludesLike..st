filtering-blast-definitions
definitionsIncludesLike: aTermCollection
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	^ aTermCollection size = 1
		ifTrue: [ 
			self
				definition: aTermCollection anyOne
				condition: #includesLike: ]
		ifFalse: [	
			self 
				definitions: aTermCollection 
				condition: #includesLike: ]