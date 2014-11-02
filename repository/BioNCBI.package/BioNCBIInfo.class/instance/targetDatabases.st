accessing
targetDatabases
	" Sets target for the Info command "
	
	self client queryAt: 'TARGET' put: 'databases'