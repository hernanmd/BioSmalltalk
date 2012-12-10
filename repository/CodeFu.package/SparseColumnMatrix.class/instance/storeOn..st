printing
storeOn: stream

	| text |
	text := String new writeStream.
	self storeSparseTextOn: text.
	stream
		print: self class;
		space;
		nextPutAll: #readFromSparseText:;
		space;
		print: (text contents replaceAll: Character cr with: Character space);
		space;
		nextPutAll: 'readStream'.