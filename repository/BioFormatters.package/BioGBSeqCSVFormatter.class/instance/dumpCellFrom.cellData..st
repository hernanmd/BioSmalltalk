accessing
dumpCellFrom: featureName cellData: cellData

	(self isExcludedFeature: featureName)
		ifFalse: [ 	
			stream 
				nextPutAll: cellData;
				nextPut: self delimiterSourceCharacter ]