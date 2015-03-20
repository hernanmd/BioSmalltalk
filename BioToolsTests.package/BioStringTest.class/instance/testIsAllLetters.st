testing
testIsAllLetters

	self assert: 'AATGATCGATGCTAGTCGACA' isAllLetters.
	self assert: 'gtacgatagcatgcatgc' isAllLetters.
	self deny: String empty isAllLetters.
	self deny: 'ACAGTAC-ACACATGA' isAllLetters.
	self deny: 'TWOJCPOWC9CIC' isAllLetters.
