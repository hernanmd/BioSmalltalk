*biotools
isXML
	" See superimplementor's comment "
	
	| xmlSignature |
	
	self reset.
	[ xmlSignature := self next: 5.
	self reset. ]
	on: Error
	do: [ : ex | self signalInvalidObject: 'Cannot read receiver''s stream ' , ex messageText ].
	^ xmlSignature isXML