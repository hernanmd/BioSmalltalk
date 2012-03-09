*biotools
isXML
	" Only answer <true> when the receiver's contents *looks like* XML, not performing any validity check "
	
	| xmlSignature |
	
	self reset.
	[ xmlSignature := self next: 5 ]
	on: Error
	do: [ : ex | 
		self reset.
		self signalInvalidObject: 'Cannot read receiver''s stream ' , ex messageText ].
	^ xmlSignature isXML