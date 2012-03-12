samples-code
fastaParsingSample01
	" BioFASTASamples new fastaParsingSample01. "

	| parser |
	
	parser := BioParser parseMultiFasta: self fastaResult01.
	parser rowsDo: [ : seqRecord |
		self outputToStream: seqRecord name;
			outputToStream: seqRecord sequence;
			outputToStream: seqRecord size
		]

