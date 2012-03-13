testing
testProfileSection1
	
	arFile := self arlequinFileClass new.
	self assert: ( arFile profileSection isKindOf: BioA31ProfileSection ).
	self assert: arFile contents = String empty.	
