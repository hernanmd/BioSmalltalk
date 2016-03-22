initialize-release
initializeWith: aNameString creator: aBioUser
	" Private - Initialize internal's receiver state "

	name := aNameString.
	history := BioProjectHistory new creator: aBioUser.
	project := BioProject new info: self.
	usage := BioProjectUsage new lastUser: aBioUser