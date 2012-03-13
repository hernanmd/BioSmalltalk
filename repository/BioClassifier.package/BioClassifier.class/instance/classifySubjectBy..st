accessing
classifySubjectBy: aConditionSymbol
	" Answer <true> if aSubject can be classified in the receiver's organization "
	
	( self perform: aConditionSymbol key )
		ifTrue: [ 
			self matched: aConditionSymbol key.
			self perform: aConditionSymbol value ]
		ifFalse: [ 
			self unMatched: aConditionSymbol key ]