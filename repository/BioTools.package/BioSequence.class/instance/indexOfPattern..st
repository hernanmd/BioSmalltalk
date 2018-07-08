accessing
indexOfPattern: p
	" Answer a <Number> matching the receiver in a frequency array "
	
	^ (self alphabetCodes enumerationsOfSize: p size) indexOf: p asString asUppercase 