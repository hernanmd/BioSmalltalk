accessing
stream
	" Answer an output <Stream> for the receiver. Use output file name if set, create a new write stream otherwise "

	^ stream 
		ifNil: [ stream := WriteStream on: String new ].
