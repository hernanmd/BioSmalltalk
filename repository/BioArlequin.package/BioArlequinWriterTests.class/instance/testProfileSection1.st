testing
testProfileSection1
	
	arFile := self arlequinFileClass new.
	self assert: (arFile newProfileSection isKindOf: BioA31ProfileSection).
	self assert: arFile contents = String empty.	
