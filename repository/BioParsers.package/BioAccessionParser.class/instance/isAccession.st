testing
isAccession
	" ( BioAccessionParser on: 'AF288373.2' ) isAccession "
	
	^ ( self parse: self expression ) isEmpty not