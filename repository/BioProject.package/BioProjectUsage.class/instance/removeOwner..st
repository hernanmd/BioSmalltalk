accessing public
removeOwner: aNameString
	" ToDo: Check credentials "
	
	self owners 
		remove: ( self userNamed: aNameString )
		ifAbsent: [ self signalNotFound: aNameString ]
