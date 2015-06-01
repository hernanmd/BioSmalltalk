*BioTools
asAccessionStringWithoutVersion
	" Answer a copy of the receiver without the version number "
	
	| accessionString |
	^ (accessionString := self findTokens: '.') size = 2
		ifTrue: [ accessionString first ]
		ifFalse: [ self ]