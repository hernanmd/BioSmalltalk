accessing public
addUser: nameString
	" Add user named nameString to the receiver "

	self register: BioAddUserCmd.
	^ self usage addUser: nameString