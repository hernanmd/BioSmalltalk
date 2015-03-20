accessing
defaultDirectory
	" Answer a String with the receiver's server directory to CWD "
	
	^ 'genomes/' , self organismName , '/CHR_' , self chrAsString