examples
example1

	| inpFile |
	inpFile := BioINPFile new 
		file: 'inputFile.inp';
		headerLinesCount: 3;
		yourself.
	self new readFrom: inpFile.