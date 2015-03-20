accessing private
blastPhiService
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE'  put: 'phi'