initialize-release
initializeWith: aNameString creator: aBioUser project: aBioProject
	" Private - Initialize internal's receiver state "

	name := aNameString.
	history := BioProjectHistory new creator: aBioUser.
	project := aBioProject.
	usage := BioProjectUsage new lastUser: aBioUser