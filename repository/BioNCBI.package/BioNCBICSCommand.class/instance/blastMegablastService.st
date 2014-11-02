accessing private
blastMegablastService
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'megablast'