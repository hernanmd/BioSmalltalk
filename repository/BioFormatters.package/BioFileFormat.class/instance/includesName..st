accessing
includesName: aString
	" Answer <true> if receiver contains aString in any of its names "

	(self names anySatisfy: [: fmtName | fmtName asLowercase = aString asLowercase ])
		ifTrue: [ ^ true ].
	((self names collect: #asLowercase) anySatisfy: [: fmtName | (fmtName findTokens: ' ') includes: aString asLowercase ])
		ifTrue: [ ^ true ].
	(((self description collect: #asLowercase) findTokens: ' ') includes: aString asLowercase)
		ifTrue: [ ^ true ].
	^ false