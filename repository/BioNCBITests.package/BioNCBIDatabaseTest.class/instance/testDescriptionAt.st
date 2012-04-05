testing
testDescriptionAt

	| description |
	
	description := BioNCBIDatabase descriptionAt: 'nr'.
	
	self assert: ( description isKindOf: String ).
	self deny: description isEmpty.
	self assert: description = 'Nucleotide collection (nr/nt)'.

	description := BioNCBIDatabase descriptionAt: 'est'.
	
	self assert: description =  'Expressed sequence tags: est'.
