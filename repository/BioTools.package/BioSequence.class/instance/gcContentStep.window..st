accessing
gcContentStep: step window: w
	" Answer a <Collection> of GC-content regions of window size w by step increments, in percentages. "

	| index ranges |

	index := 1.
	ranges := OrderedCollection new.
	[ (index + w) < self size ] whileTrue: [ 
		| cCount gCount |		
		cCount := 0.
		gCount := 0.	
		self from: index to: index + w do: [ : each |
			each asUppercase = $C 
				ifTrue: [ cCount := cCount + 1]
				ifFalse: [ each asUppercase = $G 
					ifTrue: [ gCount := gCount + 1 ] ] ].
		ranges add: (((gCount + cCount / self size) * 100) round: 6).
		index := index + step ].
	^ ranges
	
