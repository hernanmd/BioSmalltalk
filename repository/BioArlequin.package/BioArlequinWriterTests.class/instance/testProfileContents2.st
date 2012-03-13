testing
testProfileContents2

	arFile := self arlequinFileClass new.
	arFile profileSection
		addTitle: 'mtDNA sequences Old Type';
		addSampleNumber: '1';
		unsetGenotypicData;
		yourself.
	self assert: ( arFile contents = '[Profile]
	Title="mtDNA sequences Old Type"
	NbSamples=1
	GenotypicData=0
' )