testing
testSwissProt01
	
	self assert: ( BioParser tokenizeAccession: 'sp|P80487|HHP_THICU' ) = #('P80487').
	self assert: ( BioParser tokenizeAccession: 'sp|P80487.1|HHP_THICU' ) = #('P80487' '1').	
	self assert: ( BioParser tokenizeSwissProtEntryName: 'sp|Q9UWG2|RL3_METVA' ) = 'RL3_METVA'.			
