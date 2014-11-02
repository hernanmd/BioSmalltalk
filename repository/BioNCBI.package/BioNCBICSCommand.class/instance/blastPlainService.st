accessing private
blastPlainService
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'plain'