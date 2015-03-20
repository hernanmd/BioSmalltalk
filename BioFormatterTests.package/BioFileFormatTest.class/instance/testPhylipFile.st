testing
testPhylipFile

	| file |
	
	file := BioPhylipFile on: self phylipContents01.
	self deny: file isNil.
	self assert: (file possibleExtensions includes: 'phy').
	self assert: (file possibleExtensions includes: 'ph').	
	self deny: file contents isEmpty.
