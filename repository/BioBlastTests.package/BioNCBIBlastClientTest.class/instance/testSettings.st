testing
testSettings

	| cmd |
	
	cmd := self ncbiClient nucleotide.
	self assert: ( cmd isKindOf: BioNCBIPut ).
	self assert: ( cmd client isKindOf: BioNCBIWWWBlastWrapper ).
	self assert: ( cmd client downloadUrl last: 2 ) = 'nr'.
	
	cmd query: '555'.
	self assert: ( cmd client downloadUrl last: 3 ) = '555'.
	
	cmd hitListSize: 10.
	self assert: ( cmd client downloadUrl last: 2 ) = '10'.