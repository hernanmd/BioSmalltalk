testing
testGenerator02

	self assert: (BioObject generate: 2 repeat: 4) asArray = #(2 2 2 2).
	self assert: (BioObject generate: -1 repeat: 4) asArray = #(-1 -1 -1 -1).
	self assert: (BioObject generate: 0 repeat: 0) asArray = Array empty.
	self assert: (BioObject generate: $A repeat: 4) asArray = #($A $A $A $A).		
	self assert: (BioObject generate: 'B' repeat: 4) asArray = #('B' 'B' 'B' 'B').
	self assert: (BioObject generate: 'GATACA' repeat: 2) asArray =  #('GATACA' 'GATACA').	
