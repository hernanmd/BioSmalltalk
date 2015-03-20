accessing
removeSequence: aGTSequence
	" Remove aGTSequence from the receiver's sequences "

	self sequences 
		remove: aGTSequence
		ifAbsent: [ self signalNotFound: aGTSequence name ]