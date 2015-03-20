accessing private
blastRpsService
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'rpsblast'