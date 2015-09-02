private
writeHeaderFrom: featureCollection
	" Private - Write header row from featureCollection in receiver's stream "
	
	featureCollection do: [: featureName |
		(self isExcludedFeature: featureName)
			ifFalse: [ 
				stream 
					nextPutAll: featureName;
					nextPut: self delimiterSourceCharacter ] ].	
	stream nextPutAll: GRPlatform current newline.	
		