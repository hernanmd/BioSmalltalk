*BioTools
groupByEquality

	| group |
	group := OrderedCollection new.
	self do: [ : item |
		| found |
		found := group 
			detect: [ : c | c includes: item ]
			ifNone: [ nil ].
		found
			ifNil: [ group add: (BioGroupedCollection new add: item; yourself) ]
			ifNotNil: [ found add: item ] ].
	^ group