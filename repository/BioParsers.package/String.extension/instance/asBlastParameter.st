*BioParsers
asBlastParameter

	^ self isNumeric
		ifTrue: [ self asNumber ]
		ifFalse: [ | tokens |
			(tokens := self trimBoth findTokens: ',') size = 2
				ifTrue: [ 
					tokens := tokens collect: #trimBoth.
					(tokens allSatisfy: [ : queryParam | queryParam isNumeric ]) "100,200"
						ifFalse: [ self asLowercase ] "  'Bos taurus isolate ARG19 D-loop' 'partial sequence; mitochondrial'  "
						ifTrue: [ (tokens collect: #asNumber) asArray ] ]
				ifFalse: [ 
					(tokens := self trimBoth findTokens: '|') size = 2
						ifTrue: [ tokens := (tokens collect: #trimBoth) asLowercase ]
						ifFalse: [ self asLowercase ] ] ]