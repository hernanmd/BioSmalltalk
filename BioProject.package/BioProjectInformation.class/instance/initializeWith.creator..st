initialize-release
initializeWith: aNameString creator: aGTUser
	" Private - Initialize internal's receiver state "

	name := aNameString.
	history := BioProjectHistory new creator: aGTUser.
	project := BioProject new info: self.
	usage := BioProjectUsage new lastUser: aGTUser