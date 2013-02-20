private
perform: cmpSymbol node: nodeName withArgument: aString
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| collection |
	collection := self hits select: [: node | 
			(node selectNodesNamed: nodeName) asBlastValue
				perform: cmpSymbol
				with: aString asBlastParameter ].
	^ self addFilteredResultsFrom: collection