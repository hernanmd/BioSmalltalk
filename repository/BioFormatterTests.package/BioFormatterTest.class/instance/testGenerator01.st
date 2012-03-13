testing
testGenerator01

	self assert: ( formatter generateJoin: 2 repeat: 4 ) = '2222'.
	self assert: ( formatter generateJoin: -1 repeat: 4 ) = '-1-1-1-1'.
	self assert: ( formatter generateJoin: 0 repeat: 0 ) = String empty.
	self assert: ( formatter generateJoin: $A repeat: 4 ) = 'AAAA'.		
	self assert: ( formatter generateJoin: 'B' repeat: 4 ) = 'BBBB'.
	self assert: ( formatter generateJoin: 'GATACA' repeat: 2 ) =  'GATACAGATACA'.	
	
	self should: [ formatter generateJoin: 'C' repeat: -1 ] raise: Exception.