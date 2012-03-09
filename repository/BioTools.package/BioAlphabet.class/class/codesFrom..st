testing
codesFrom: aString

	^ Array streamContents: [:stream | 
		self codes do: [:ea | 
			stream nextPut: ( [: e | e asAminoacidLetter ] value: ea) ] ]