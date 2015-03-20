samples-code
fastaParsingSample02
	" BioFASTASamples new fastaParsingSample02. "
	
	| fastaRecord |
	
	fastaRecord := BioParser parseFasta: self fastaResult02.
	self 
		bioLog: fastaRecord name;
		bioLog: fastaRecord sequence;
		bioLog: 'sequence size : ' , fastaRecord size


