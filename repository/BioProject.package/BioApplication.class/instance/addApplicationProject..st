accessing
addApplicationProject: aGTProject
	" Add a aGTProject to the receiver's collection "

	^ self applicationProjects 
		at: aGTProject name
		put: aGTProject