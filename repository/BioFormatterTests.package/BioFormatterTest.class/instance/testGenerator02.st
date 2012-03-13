testing
testGenerator02

	self assert: ( formatter generate: 2 repeat: 4 ) asArray = #(2 2 2 2).
	self assert: ( formatter generate: -1 repeat: 4 ) asArray = #(-1 -1 -1 -1).
	self assert: ( formatter generate: 0 repeat: 0 ) asArray = Array empty.
	self assert: ( formatter generate: $A repeat: 4 ) asArray = #($A $A $A $A).		
	self assert: ( formatter generate: 'B' repeat: 4 ) asArray = #('B' 'B' 'B' 'B').
	self assert: ( formatter generate: 'GATACA' repeat: 2 ) asArray =  #('GATACA' 'GATACA').	
