accessing - format
formatStream
	" Answer a <Stream> with additional information. See #formatString "

	^ formatStream
		ifNil: [ formatStream := WriteStream on: String empty ]
