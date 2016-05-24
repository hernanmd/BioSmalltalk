accessing
newSoftwareItem: record
	" Answer a new software item from entry Collection "
	
	^ BioSoftwareItem new 
		softwareName: record fifth;
		description: record sixth;
		link: record third;
		classifications: (self parseCategory: (record at: 10));
		yourself.
