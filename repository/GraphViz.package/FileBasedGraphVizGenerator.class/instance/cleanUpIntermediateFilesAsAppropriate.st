private
cleanUpIntermediateFilesAsAppropriate

	| entries |
	deleteIntermediateFiles ifFalse: [^ self].
	
	self outputFileDirectory deleteFileNamed: self dotFileName.
	
	entries := self outputFileDirectory matchingEntries: (self baseFileName, '.*').
	entries do: [:each | self outputFileDirectory deleteFileNamed: each name]