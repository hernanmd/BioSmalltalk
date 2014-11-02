deprecate
includesParameter: aString
	" Answer <true> if the receiver already includes a parameter named aString "
	
	^ [ (self valueForParameter: aString) notNil ] 
		on: KeyNotFound 
		do: [ : ex | ex return: false ]