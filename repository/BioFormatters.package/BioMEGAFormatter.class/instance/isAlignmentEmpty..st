testing
isAlignmentEmpty: aCollection 

	^ aCollection allSatisfy: [ : megaRecordGroup |
		megaRecordGroup allSatisfy: [ : mr | mr hasEmptyAlignment ] ]