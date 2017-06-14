defaults
defaultDirectory
	" Answer a <String> with the receiver's server directory to CWD "
	
	^ String streamContents: [ : stream |
			stream
				nextPutAll: 'genomes/';
				nextPutAll: self organismName;
				nextPutAll: '/CHR_';
				nextPutAll: self chrDirAsString ]
