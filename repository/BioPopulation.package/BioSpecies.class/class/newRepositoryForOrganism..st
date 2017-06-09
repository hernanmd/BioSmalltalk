initialize-release
newRepositoryForOrganism: organismName
	" Answer a new population repository for organismName "

	^ BioPopRepository new 
		name: organismName;
		yourself