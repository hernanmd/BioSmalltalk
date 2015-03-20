accessing
initializeMarkers

	markers := OrderPreservingDictionary new.
	(matrix columnAt: 1) do: [ : marker |  | markerName markerAl |
		markerName := marker copyUpTo: $:.
		markerAl := marker copyAfter: $:.
		markers isEmpty
			ifTrue: [ (markers at: markerName ifAbsentPut: [OrderedCollection new]) add: markerAl ]
			ifFalse: [ markers at: markerName 
				ifPresent: [: m | m add: markerAl ] 
				ifAbsent: [ (markers at: markerName ifAbsentPut: [OrderedCollection new]) add: markerAl ] ] ].