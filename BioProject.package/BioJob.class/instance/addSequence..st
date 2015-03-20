accessing
addSequence: aBioSequence
	" Add aBioSequence to the receiver's sequences "
	
	^ (self sequences includes: aBioSequence) 
		ifFalse: [ self sequences addLast: aBioSequence ]
		ifTrue: [ self signalDuplicateObject: aBioSequence name ]