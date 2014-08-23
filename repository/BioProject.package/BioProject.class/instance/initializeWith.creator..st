initialize-release
initializeWith: aNameString creator: aBioUser
	" Private - Create necessary objects for receiver's initialization "
	
	info := BioProjectInformation 
			named: aNameString 
			creator: aBioUser 
			project: self.