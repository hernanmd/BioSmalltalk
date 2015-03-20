accessing
endPointsOff
	" Get only alignment endpoints in results (megablast only) "
	
	self clientUrl queryAt: 'ENDPOINTS' put: 'no' 
