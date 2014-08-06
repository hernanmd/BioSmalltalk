*biotools
isXML
	" Only answer <true> when the receiver's contents *looks like* XML, not performing any validity check "
	
	| xmlSignature |
	
	self reset.
	[ xmlSignature := self next: 5.
	self reset. ]
	on: Error
	do: [ : ex | self signalInvalidObject: 'Cannot read receiver''s stream ' , ex messageText ].
	^ xmlSignature isXML