testing
testDataSection1

	arFile := self arlequinFileClass new.
	self assert: (arFile dataSection isKindOf: BioA31DataSection).
	self assert: arFile contents = String empty
	
