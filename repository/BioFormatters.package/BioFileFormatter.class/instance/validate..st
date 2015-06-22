accessing
validate: aCollection 
	"  Iterate over aCollection. Set valid flag if all its items are valid for the receiver "
	
	isValid := isValid and: [ self isValidForExport: aCollection ].
	inputStream := ReadStream on: aCollection.
	samplesCollection := aCollection.
