private
findDataPoints: aCollection
	" Parse and answer a <Collection> of from aCollection in the LAMP-LD output format : '11:85 00:301 01:493' ."

	| admixedDataPoints |
	admixedDataPoints := OrderedCollection new: aCollection size.
	1 to: aCollection size do: [ :index | 
		| admixedIndividual |
		admixedIndividual := aCollection at: index.
		admixedDataPoints
			add:
				((admixedIndividual substrings: ' ')
					collect: [ :dp | dp substrings: ':' ]) ].
	^ admixedDataPoints