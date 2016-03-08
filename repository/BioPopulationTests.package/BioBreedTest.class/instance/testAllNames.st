testing
testAllNames

	self population removeNullName.
	self assert: self population allNames isEmpty.
	self population 
		addName: 'Homo Sapiens';
		addSynonym: 'H.Sapiens'.
	self assert: self population allNames first = 'Homo Sapiens'.
	self assert: self population allNames second = 'H.Sapiens'.
