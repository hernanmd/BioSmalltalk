accessing
openRepositoryBrowser 

	| species |
	
	(species := self bioSpecies) isEmpty
		ifTrue: [self inform: 'You must initialize the repository before browsing' translated]
		ifFalse: [ | breedMatrix |
			breedMatrix := self fillSpecies: species.
			self openGrid: breedMatrix ofSize: species size ]