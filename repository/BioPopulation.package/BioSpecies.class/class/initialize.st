initialize-release
initialize
	" Private - initialize species repositories "

	self release.
	BioSpeciesLists currentSpeciesList 
		do: [ : organismName | self addRepositoryNamed: organismName  ]
		displayingProgress: 'Initializing population repositories'.
	self bioLog: 'Imported repositories: ' , self repositories size asString.