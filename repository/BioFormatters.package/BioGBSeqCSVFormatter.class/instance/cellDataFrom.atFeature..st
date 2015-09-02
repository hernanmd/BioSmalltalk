accessing
cellDataFrom: aDictionary  atFeature: featureName

	^ aDictionary 
		at: featureName 
		ifAbsent: [ '-' ]