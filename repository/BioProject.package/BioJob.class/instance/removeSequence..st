accessing
removeSequence: aBioSequence
	" Remove aGTSequence from the receiver's sequences "

	self sequences 
		remove: aBioSequence
		ifAbsent: [ self signalNotFound: aBioSequence name ]