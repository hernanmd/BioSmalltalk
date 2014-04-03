accessing
newSoftwareItem: entry
	" Answer a new software item from entry Collection "
	
	^ BioSoftwareItem new 
		softwareName: entry first;
		description: entry second;
		link: entry third;
		classifications: (entry fourth findTokens: $,);
		yourself.