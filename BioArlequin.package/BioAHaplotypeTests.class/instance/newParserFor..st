data samples
newParserFor: haploStream
	" Answer a parser opened for haploStream  "

	^ (NeoCSVReader on: haploStream) 
		separator: Character tab;
		yourself
		