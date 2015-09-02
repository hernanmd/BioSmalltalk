instance creation
named: aString forGroups: aClassifier

	| formatter |
	
	formatter := self new
				outputFilename: aString;
				samples: aClassifier alignments.
	^ formatter export