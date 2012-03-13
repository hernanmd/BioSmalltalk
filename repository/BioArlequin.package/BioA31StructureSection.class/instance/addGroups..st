accessing
addGroups: aCollection
	" Set the number of groups defined in the structure "
	
	aCollection do: [ : bioA31Group |
		self addGroup: bioA31Group name ]