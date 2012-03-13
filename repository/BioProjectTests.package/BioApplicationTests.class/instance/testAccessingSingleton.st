testing
testAccessingSingleton

	| theInstance |
	
	theInstance := BioApplication uniqueInstance.
	self assert: ( theInstance  isKindOf: BioApplication ).
	self assert: ( theInstance applicationProjects isKindOf: Collection ).
	self assert: ( theInstance applicationUsers isKindOf: Collection ).