testing
platformCheck
	" Answer <true> if receiver can be executed in the current platform "
	
	^ self availablePlatforms includes: Smalltalk os name