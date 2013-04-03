accessing
guessAlphabetFrom: aString
	" Answer a class with the guessed alphabet from analyzing aString "
	
	<lint: 'Long methods' rationale: 'Algorithm method' author: 'hfm'>
	<lint: 'Temporary variable names' rationale: 'Algorithm method' author: 'hfm'>
	
	| normalizedString atgcCount total |
	
	normalizedString := aString asLowercase copyWithoutAll: self ambiguityCodes.
	atgcCount := 'atgcn' inject: 0 into: [ : sum : each | sum + (normalizedString occurrencesOf: each) ].
	(total := aString size) = 0
		ifTrue: [ self signalInvalidObject: 'Empty sequence, cannot guess alphabet' translated ].
	
	^ (atgcCount / total) > self guessAlphabetThreshold
		ifTrue: [ 
			(BioIUPACAmbiguousDNA hasAmbiguousBases: aString)
				ifTrue: [ BioIUPACAmbiguousDNA ]
				ifFalse: [ BioIUPACUnambiguousDNA ] ]
		ifFalse: [ 
			(atgcCount + (normalizedString occurrencesOf: $u)) / total > self guessAlphabetThreshold
				ifTrue: [ 
					(BioIUPACAmbiguousRNA hasAmbiguousBases: aString)
						ifTrue: [ BioIUPACAmbiguousRNA ]
						ifFalse: [ BioIUPACUnambiguousRNA ] ]
				ifFalse: [ BioIUPACProtein ] ]
