accessing private
blastPsiService
	" Blast service which needs to be performed "
	
	self client queryAt: 'SERVICE' put: 'psi'