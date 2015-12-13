accessing
sequenceNameWithoutDelimiter
	" Answer a <String> with the receiver's sequence header without the $> character "
	
	^ self name allButFirst