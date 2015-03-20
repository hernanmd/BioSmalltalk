accessing
validate: aCollection 
	"  <aCollection> items "
	
	isValid := aCollection allSatisfy: [ : item | item isValidForFastaFormat ].
	inputStream := ReadStream on: aCollection.

	