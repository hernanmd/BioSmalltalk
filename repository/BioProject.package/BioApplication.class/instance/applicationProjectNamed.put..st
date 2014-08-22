accessing
applicationProjectNamed: aNameString put: aBioApplication
	" Set aBioApplication named aNameString in the receiver "

	^ self applicationProjects
			at: aNameString
			put: aBioApplication