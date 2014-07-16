accessing hit individually
hitLength
	" Answer the receiver's hit length "
	
	^ (self selectNodeNamed: 'Hit_len') blastValue.
