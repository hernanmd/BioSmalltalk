testing
testIsFoundIn

	self population
		addLocation: 'SE Argentina';
		addLocation: 'N Germany';
		addLocation: 'Bavaria region'.		
	self assert: (self population isFoundIn: 'Argentina').
	self assert: (self population isFoundIn: 'Germany').	
	self assert: (self population isFoundIn: 'bavaria').	