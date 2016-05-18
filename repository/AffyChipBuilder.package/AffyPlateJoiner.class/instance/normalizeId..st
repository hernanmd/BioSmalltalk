normalization
normalizeId: aString 

	| normalizedId |
	
	normalizedId := (aString findTokens: $_) second copyUpTo: $..
	joinedAffySamplesId ifNil: [ ^ normalizedId ].
	^ (joinedAffySamplesId includes: normalizedId)
		ifTrue: [ self halt ]
		ifFalse: [ normalizedId ]