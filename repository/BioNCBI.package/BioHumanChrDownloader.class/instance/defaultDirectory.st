accessing
defaultDirectory
	" Answer a String with the receiver's server directory to CWD "
	
	^ 'genomes/H_sapiens/CHR_' , self chrNumber asString