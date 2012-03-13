writing
writeGroups: assoc on: aStream

	aStream 
		nextPut: ${;	
		cr.
	assoc value
		do: [ : grName | aStream nextPutAll: ( grName ifNil: [ String empty ] ) between: $" -> $" ]
		separatedBy: [ aStream cr ].
	aStream 
		nextPut: $}