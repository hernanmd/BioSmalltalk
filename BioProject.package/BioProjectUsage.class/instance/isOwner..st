accessing public
isOwner: aNameString
	" Answer <true> if there is a owner with aNameString in the receiver "
	
	^ ( self owners 
		detect: [ : owner | owner name = aNameString ]
		ifNone: [ nil ] ) isNil not
		