accessing-blast-meta
headerContents
	" Answer a String containing the header contents of the receiver.
	This is to avoid reading the entire file (which could be huge) to
	process the meta nodes which are located at the header of the XML "
	
	^ self results first: 3500

	