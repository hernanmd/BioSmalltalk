accessing public
isUser: aNameString
	" Answer <true> if there is a users with aNameString in the receiver "
	
	^ ( self users 
		detect: [ : user |	user name = aNameString ]
		ifNone: [ nil ] ) isNil not
		