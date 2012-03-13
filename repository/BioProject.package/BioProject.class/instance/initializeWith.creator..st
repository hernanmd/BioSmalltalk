initialize-release
initializeWith: aNameString creator: aGTUser
	" Private - Create necessary objects for receiver's initialization "
	
	info := BioProjectInformation named: aNameString creator: aGTUser project: self.