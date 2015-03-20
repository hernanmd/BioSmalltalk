*biosupport
fillMatrix: aMatrix atColumn: aColumnNumber

	| generator repetitionsNum |
	
	repetitionsNum := aMatrix rows size.
	generator := Generator on: [: g | repetitionsNum timesRepeat: [ g yield: self ] ].
	aMatrix 
		atColumn: aColumnNumber 
		put: generator upToEnd.