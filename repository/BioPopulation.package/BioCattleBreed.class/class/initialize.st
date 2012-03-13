initialize-release
initialize
	" Private - Initialize the receiver's repository "

	self release.
	super initialize.
	self importFromFile.
	self importFromCuration.
	self sanityCheck