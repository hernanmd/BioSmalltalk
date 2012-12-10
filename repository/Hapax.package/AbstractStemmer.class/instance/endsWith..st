private-algorithm
endsWith: aSuffix 
	"comment stating purpose of message"

	| position |
	position := string size - aSuffix size.
	position < 0 ifTrue: [ ^false ].
	1 to: aSuffix size do: [ :index |
		(aSuffix at: index) ~~ (string at: position + index) ifTrue: [ ^false ]].
	cursor := position.
	^true