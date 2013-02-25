*bioparsers
asBlastParameter

	^ self isNumeric
		ifTrue: [ self asNumber ]
		ifFalse: [ | tokens |
			(tokens := self findTokens: ',') size = 2 "100,200"
				ifFalse: [ self asLowercase ]
				ifTrue: [ (tokens collect: #asNumber) asArray ]]