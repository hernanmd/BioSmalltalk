private
writeHeaderFrom: featureCollection
	" Private - Write header row from featureCollection in receiver's stream "
	
	featureCollection do: [: k |
		stream 
			nextPutAll: k;
			nextPut: self delimiterSourceCharacter ].	
	stream nextPutAll: GRPlatform current newline.	
		