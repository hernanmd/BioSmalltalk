testing
testDataSection1

	arFile := self arlequinFileClass new.
	self assert: (arFile newDataSection isKindOf: BioA31DataSection).
	self assert: arFile contents = String empty
	
