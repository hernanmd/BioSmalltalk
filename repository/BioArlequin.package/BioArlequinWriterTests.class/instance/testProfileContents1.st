testing
testProfileContents1

	arFile := self arlequinFileClass new.
	arFile profileSection
		at: 'Title' put: 'mtDNA sequences Old Type';
		at: 'NbSamples' put: '1';
		at: 'GenotypicData' put: '0';
		yourself.
	self assert: ( arFile contents = '[Profile]
	Title="mtDNA sequences Old Type"
	NbSamples=1
	GenotypicData=0
' )