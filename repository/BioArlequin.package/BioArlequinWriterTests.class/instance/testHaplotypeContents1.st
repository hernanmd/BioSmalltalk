testing
testHaplotypeContents1

"	arFile := self arlequinFileClass new.
	arFile haplotypeSection
		addTitle: 'Haplotype List 1';
		addHaplotypes: self haplotypeCollection1.

	( arFile writeOn: ( out := WriteStream on: String new ) ).		
	self assert: ( out contents = self haplotypeSection1 ).
"
	
"	aSection addHaplotypes: self haplotypeCollection2.
	self assert: ( aSection contents = self haplotypeSection2 ).
	
	aSection addHaplotypes: self haplotypeCollection3.
	self assert: ( aSection contents = self haplotypeSection3 ) "