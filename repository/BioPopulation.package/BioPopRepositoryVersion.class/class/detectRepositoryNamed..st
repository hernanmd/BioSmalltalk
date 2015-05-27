accessing
detectRepositoryNamed: repoName
	" Answer a BioPopRepositoryVersion named aString "
	
	^ self allInstances detect: [ : inst | inst name = repoName ]