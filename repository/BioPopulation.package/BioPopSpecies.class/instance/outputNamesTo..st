accessing
outputNamesTo: aStream
	" Private - See comment in #outputAsCsvTo: "

	self names do: [: each | 
		aStream nextPutAll: each; nextPut: $, ].
	aStream 
		back;
		nextPut: $;.