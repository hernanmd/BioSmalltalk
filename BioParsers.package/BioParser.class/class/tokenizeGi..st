parse-ncbi-identifiers
tokenizeGi: aString
	" Tokenize aString containing a gene identifier. If aString does not begin with 'gi|' then answer an empty Collection "
	
	| result |
	
	^ (result := (BioGIParser on: aString) tokenize) = 'Error: ''gi|'' expected'
		ifTrue: [ ^ Array new ]
		ifFalse: [ result ]
		