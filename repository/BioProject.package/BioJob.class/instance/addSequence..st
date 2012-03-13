accessing
addSequence: aGTSequence
	" Add aGTSequence to the receiver's sequences "
	
	^ ( self sequences includes: aGTSequence ) 
		ifFalse: [ self sequences addLast: aGTSequence ]
		ifTrue: [ self signalDuplicateObject: aGTSequence name ]