accessing
sequenceNameWithoutDelimiter
	" Answer the receiver's sequence header without the $> character "
	
	^ self name allButFirst