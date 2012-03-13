*biopharo
bioSerializeSelection
	" Private - (Pharo 1.3) Sent from #fieldListMenu:
	Serialize the current selected item in the receiver "

	| fileName |
	
	fileName := self object class name , '-' , BioObject currentSeconds , '.obj'.
	^ ( BioSerializationEngine for: fileName ) serialize: self