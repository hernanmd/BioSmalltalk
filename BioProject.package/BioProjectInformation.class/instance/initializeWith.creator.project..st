initialize-release
initializeWith: aNameString creator: aGTUser project: aGTProject
	" Private - Initialize internal's receiver state "

	name := aNameString.
	history := BioProjectHistory new creator: aGTUser.
	project := aGTProject.
	usage := BioProjectUsage new lastUser: aGTUser