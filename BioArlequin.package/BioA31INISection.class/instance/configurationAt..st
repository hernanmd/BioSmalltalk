accessing
configurationAt: aConfigurationString 
	" Private - Answer the receiver's configuration identified by aConfigurationString "
	
	^ self sectionSpecs 
			detect: [ : specConf | specConf notation key = aConfigurationString key ] 
			ifNone: [ self error: aConfigurationString key , ' configuration not found' translated ].
