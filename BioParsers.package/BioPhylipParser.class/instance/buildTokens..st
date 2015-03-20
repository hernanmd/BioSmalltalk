accessing
buildTokens: aCollection
	" Answer a tokenized <Collection> parsing aCollection "

	^ Array 
		with: (self taxaNumberFrom: aCollection)
		with: (aCollection first second asNumber)
		with: (aCollection second collect: #first)
		with: (self buildTokensFrom: aCollection).
	
