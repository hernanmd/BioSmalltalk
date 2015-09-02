accessing
dumpFeatureData: aDictionary groupingFeature: ttyName 

	self features 
		do: [: featureName |
			self 
				dumpCellFrom: featureName 
				cellData: (self cellDataFrom: aDictionary atFeature: featureName). ]
		displayingProgress: 'Writing CSV data to ' , self outputFilename.
	stream nextPutAll: GRPlatform current newline.
