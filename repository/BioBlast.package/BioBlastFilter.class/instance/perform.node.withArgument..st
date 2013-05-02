private
perform: cmpSymbol node: nodeName withArgument: aString
	" Answer a filtered result with the receiver's definition nodes begins with the strings in aStringCollection (ignoring case) "
	
	| nodes hits |

	hits := self hits.
	nodes := OrderedCollection new: hits size.
	hits do: [ : node | | recv |
		recv := (node selectNodesNamed: nodeName) asBlastValue.
		(aString asBlastParameter matches: cmpSymbol receiver: recv)
			ifTrue: [ nodes add: node ] ].
	^ self addFilteredResultsFrom: nodes