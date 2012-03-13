accessing public
addOwner: aNameString
	" Add aNameString as a receiver's owners "
	" ToDo: Check credentials "

	^ self owners addLast: ( self userNamed: aNameString )
