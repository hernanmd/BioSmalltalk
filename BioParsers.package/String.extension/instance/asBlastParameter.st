*BioParsers
asBlastParameter

	^ self isNumeric
		ifTrue: [ self asNumber ]
		ifFalse: [ | tokens |
			tokens := self findTokens: ','.
			tokens := tokens collect: #trimBoth.
			(tokens size = 2 and: [ tokens allSatisfy: [ : queryParam | queryParam isNumeric ] ]) "100,200"
				ifFalse: [ self asLowercase ] "  'Bos taurus isolate ARG19 D-loop' 'partial sequence; mitochondrial'  "
				ifTrue: [ (tokens collect: #asNumber) asArray ]]