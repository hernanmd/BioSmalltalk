accessing
collectGBSeqRecord

	[ parser isEndDocument or: [ parser isEndTag: 'GBSeq' ] ]
		whileFalse: [ | node |
			(node := parser currentNodeUpToAny: self selectedNodes) notNil
				ifTrue: [ self saveTag: node key value: node value ].
			parser next ]