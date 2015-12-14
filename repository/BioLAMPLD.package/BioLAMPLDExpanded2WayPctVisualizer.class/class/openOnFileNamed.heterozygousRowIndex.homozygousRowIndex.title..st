instance creation
openOnFileNamed: outFilename heterozygousRowIndex: hetRowIndex homozygousRowIndex: homRowIndex title: aString
	" Open the receiver using outFilename as input "

	^ self new 
		heterozygousRowIndex: hetRowIndex;
		homozygousRowIndex: homRowIndex;
		initialize: outFilename;
		name: aString;
		open;
		yourself