filtering-blast-definitions
definitionsBeginWith: aTermCollection
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	^ aTermCollection size = 1
		ifTrue: [ 
			self 
				definition: aTermCollection anyOne
				condition: #beginsWith: ]
		ifFalse: [
			self 
				definitions: aTermCollection 
				condition: #beginsWith: ]