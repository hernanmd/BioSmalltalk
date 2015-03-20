private
writeHeaderFrom: features
	" Private - Write header row from aCollection in receiver's stream "
	
	features do: [: k |
		stream 
			nextPutAll: k;
			nextPut: self delimiterSourceCharacter ].	
	stream cr.	
		