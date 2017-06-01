private
formatSequenceFrom: seqString

	^ (((seqString groupsOf: 10 atATimeCollect: [ : each | each joinUsing: String empty ])
		groupsOf: 8 atATimeCollect: [ : each | each ])
			collect: [ : each | each joinUsing: String space ]) asOrderedCollection