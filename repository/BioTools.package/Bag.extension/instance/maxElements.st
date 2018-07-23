*BioTools
maxElements
	" Answer a <Collection> with the receiver's element(s) which contain the maximum occurrences "

	| maxCount maxElems |
	maxCount := 0.
	maxElems := OrderedCollection new: self size.
	self doWithOccurrences: [ : elem : count |
		count = maxCount
			ifTrue: [ maxElems add: elem ]
			ifFalse: [ 
				count > maxCount
					ifTrue: [ 
						maxCount := count.
						maxElems := OrderedCollection with: elem ] ] ].
	^ maxElems.
