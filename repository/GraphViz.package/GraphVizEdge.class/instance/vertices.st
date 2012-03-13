accessing
vertices

	| pos |
	pos := self pos ifNil: [^ #()].
	
	^ (pos findTokens: ' ') collect:
		[:each | | point |
		point := each findTokens: ','.
		point first asNumber @ point second asNumber]