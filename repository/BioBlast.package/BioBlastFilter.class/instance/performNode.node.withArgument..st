accessing
performNode: cmpSymbol node: nodeName withArgument: argString 

	| nodes hits |

	hits := self hits.
	nodes := OrderedCollection new: hits size.
	hits do: [ : node | | recv |
		recv := (node selectNodesNamed: nodeName) blastValue.
		(argString asBlastParameter matches: cmpSymbol receiver: recv)
			ifTrue: [ nodes add: node ] ].
	^ self addFilteredResultsFrom: nodes