instance creation
openOnFileNamed: outFilename heterozygousRowIndex: hetRowIndex homozygousRowIndex: homRowIndex
	" Open the receiver using outFilename as input "

	^ self new 
		initialize: outFilename;
		heterozygousRowIndex: hetRowIndex;
		homozygousRowIndex: homRowIndex;
		open;
		yourself