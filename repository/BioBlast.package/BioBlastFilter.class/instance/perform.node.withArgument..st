private
perform: cmpSymbol node: nodeName withArgument: aString
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection |
	
	collection := self hits select: [: node | | recv param |
		recv := (node selectNodesNamed: nodeName) asBlastValue.
		(param := aString asBlastParameter) isArray
			ifFalse: [ recv
				perform: cmpSymbol
				with: aString asBlastParameter ]
			ifTrue: [ recv
				perform: cmpSymbol 
				withArguments: param ] ].
	^ self addFilteredResultsFrom: collection