*BioTools
groupByEquality

	| cols |
	cols := OrderedCollection new.
	self do: [ : r |
		| found |
		found := cols 
			detect: [ : c | c includes: r ]
			ifNone: [ nil ].
		found
			ifNil: [ cols add: (OrderedCollection new add: r; yourself) ]
			ifNotNil: [ found add: r ] ].
	^ cols