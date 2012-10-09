samples-code
fastaParsingSample01
	" BioFASTASamples new fastaParsingSample01. "

	| parser |
	
	parser := BioParser parseMultiFasta: self fastaResult01.
	parser rowsDo: [ : seqRecord |
		self 
			bioLog: seqRecord name;
			bioLog: seqRecord sequence;
			bioLog: seqRecord size ]

