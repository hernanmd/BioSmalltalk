testing
testGenerator01

	self assert: (BioObject generateJoin: 2 repeat: 4) = '2222'.
	self assert: (BioObject generateJoin: -1 repeat: 4) = '-1-1-1-1'.
	self assert: (BioObject generateJoin: 0 repeat: 0) = String empty.
	self assert: (BioObject generateJoin: $A repeat: 4) = 'AAAA'.		
	self assert: (BioObject generateJoin: 'B' repeat: 4) = 'BBBB'.
	self assert: (BioObject generateJoin: 'GATACA' repeat: 2) =  'GATACAGATACA'.	
	
	self should: [ BioObject generateJoin: 'C' repeat: -1 ] raise: Exception.