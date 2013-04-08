writing
writeGroups: assoc on: aStream
	aStream
		nextPut: ${;
		nextPut: Character cr.
	assoc value
		do: [ :grName | aStream nextPutAll: (grName ifNil: [ String empty ]) between: $" -> $" ]
		separatedBy: [ aStream nextPut: Character cr ].
	aStream nextPut: $}