testing
testRelease

	| theInstance |
	
	BioApplication release.
	theInstance := BioApplication uniqueInstance.
	self assert: ( theInstance  isKindOf: BioApplication ).
	self assert: ( theInstance applicationProjects isKindOf: Collection ).
	self assert: ( theInstance applicationUsers isKindOf: Collection ).

	self assert: theInstance applicationProjects isEmpty.
	self assert: theInstance applicationUsers isEmpty.