accessing
addFilteredResultsFrom: collection
	
	"^ collection ifNotEmpty: [ self addFilterFrom: collection ] ifEmpty: [ self contents ]"
	^ self addFilterFrom: collection
	