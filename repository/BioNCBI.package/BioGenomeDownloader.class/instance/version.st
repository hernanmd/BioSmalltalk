accessing
version
	" Answer a <String>. Specific to versioned genomes file names "
	
	^ version
		ifNil: [ version := self latestVersionFound ]