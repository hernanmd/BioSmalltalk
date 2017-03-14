examples
example01

	| inpFile |
	inpFile := self new 
		file: self testFilesFullDirectoryName / 'test.inp' ;
		headerLinesCount: 3;
		yourself.