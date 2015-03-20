instance creation
named: aNameString creator: aGTUser project: aGTProject
	" Answer a new project information object setting all necessary parameters "
	
	^ self new 
		initializeWith: aNameString 
		creator: aGTUser 
		project: aGTProject