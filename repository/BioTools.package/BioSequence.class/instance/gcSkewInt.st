accessing
gcSkewInt
	" Answer a <Collection> with <Integer>. Calculate receiver's GC skew (G-C)/(G+C). Does NOT look at any ambiguous nucleotides. "
	
	| ranges |
	ranges := OrderedCollection with: 0.
	1 to: self size do: [ : index | 
		(self sequence at: index) asUppercase = $G
			ifTrue: [ ranges add: (ranges at: index) + 1 ]
			ifFalse: [
				(self sequence at: index) asUppercase = $C
					ifTrue: [ ranges add: (ranges at: index) - 1 ]
					ifFalse: [ ranges add: (ranges at: index) ] ] ].
	^ ranges	

