accessing - info
infoStream
	" Answer a <Stream> with additional information. See #infoString "

	^ infoStream 
		ifNil: [ infoStream := WriteStream on: String empty ]
