instance creation
named: aString forGroups: aClassifier

	| formatter |
	
	formatter := self new
				outputFilename: aString;
				samplesCollection: aClassifier alignments.
	^ formatter export