accessing projects
removeProject: aNameString
	" Remove the project named aNameString if exists in the receiver's projects. 
	Answer the receiver "

	| project |
	
	project := self projectINamed: aNameString.
	project remove.
	self userProjects remove: project
