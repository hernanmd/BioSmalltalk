accessing public
addUser: aNameString

	self register: BioAddUserCmd.
	^ self usage addUser: aNameString