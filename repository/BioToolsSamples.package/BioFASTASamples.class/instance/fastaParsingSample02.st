samples-code
fastaParsingSample02
	" BioFASTASamples new fastaParsingSample02. "
	
	| fastaRecord |
	
	fastaRecord := BioParser parseFasta: self fastaResult02.
	self 
		outputToStream: fastaRecord name;
		outputToStream: fastaRecord sequence;
		outputToStream: 'sequence size : ' , fastaRecord size


