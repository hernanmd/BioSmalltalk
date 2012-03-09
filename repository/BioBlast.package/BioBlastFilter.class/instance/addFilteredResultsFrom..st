filtering-blast-alignments
addFilteredResultsFrom: collection
	^ collection ifNotEmpty: [ self addFilterFrom: collection ] ifEmpty: [ self contents ]