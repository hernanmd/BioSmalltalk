accessing
endPointsOn
	" Get only alignment endpoints in results (megablast only) "
	
	self clientUrl addParameters: 'ENDPOINTS=yes' 
