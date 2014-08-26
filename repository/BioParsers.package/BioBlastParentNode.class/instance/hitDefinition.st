accessing hits
hitDefinition
	" Answer a Collection of receiver's definition lines of the database sequence "
	
	^ ( self selectNodeNamed: 'Hit_def' ) value.
