*biotools
isGenBankFlatFormat
	" Only answer <true> when the receiver's contents *looks like* a GenBank flat format, not performing any validity check "
	
	| flatSignature |
	
	self reset.
	[ flatSignature := self next: 6.
	self reset. ]
	on: Error
	do: [ : ex | self signalInvalidObject: 'Cannot read receiver''s stream ', ex messageText ].
	^ flatSignature beginsWith: 'LOCUS	'