accessing
addRepositoryNamed: organismName
	" Add a <BioPopRepository> for organism organismName to the receiver's repositories "
	
	| repo |
	repo := self newRepositoryForOrganism: organismName.
	self addRepository: repo.
	repo initializeRepositoryVersions	