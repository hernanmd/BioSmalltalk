filtering-blast-definitions
definitionsIncludes: aTermCollection
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "

	^ aTermCollection size = 1
		ifTrue: [
			self 
				definition: aTermCollection anyOne
				condition: #includes: ]
		ifFalse: [
			self 
				definitions: aTermCollection 
				condition: #includes: ]
