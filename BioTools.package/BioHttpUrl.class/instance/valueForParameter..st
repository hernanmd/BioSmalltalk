accessing
valueForParameter: aString
	" Answer a Collection with the receiver's parameter names "

	| parCol value |
	parCol := self path last findTokens: self urlTokens.
	(parCol first endsWith: 'cgi')
		ifTrue: [ parCol removeFirst ].
	parCol pairsDo: [ :k :v | 
		k asLowercase = aString asLowercase
			ifTrue: [ value := v ]  ].
	^ value
	