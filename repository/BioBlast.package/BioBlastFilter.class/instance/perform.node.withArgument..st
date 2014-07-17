private
perform: cmpSymbol node: nodeName withArgument: aString
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	^ (self hasBehaviorNamed: nodeName asSymbol)
		ifTrue: [ self performBehavior: cmpSymbol named: nodeName asSymbol withArgument: aString ]
		ifFalse: [ self performNode: cmpSymbol node: nodeName withArgument: aString ]
