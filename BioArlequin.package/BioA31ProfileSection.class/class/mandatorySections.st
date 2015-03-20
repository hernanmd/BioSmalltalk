accessing
mandatorySections 
	" Private - Answer a Collection with the mandatory sections for the receiver "

	^ self sectionSpecs select: [ : spec | spec isMandatory ]
