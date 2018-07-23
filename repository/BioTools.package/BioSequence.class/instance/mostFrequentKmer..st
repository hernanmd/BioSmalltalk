accessing
mostFrequentKmer: k
	" Answer a <Collection> of receiver with the most frequent k-mers of size k "

	| maxCount maxKmers |
	maxCount := 0.
	maxKmers := OrderedCollection new.
	(((1 to: self size - k) 
		collect: [ : i | self copyFrom: i to: i + k - 1 ]) 
		as: Bag) doWithOccurrences: [ : elem : count |
			count = maxCount
				ifTrue: [ maxKmers add: elem ]
				ifFalse: [ 
					count > maxCount
						ifTrue: [ 
							maxCount := count.
							maxKmers := OrderedCollection with: elem ] ] ].
	^ maxKmers.