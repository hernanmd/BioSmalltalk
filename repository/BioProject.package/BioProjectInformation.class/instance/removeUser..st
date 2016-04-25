accessing public
removeUser: nameString
	" Remove the user named nameString from the receiver's users "
	
	self register: BioRemoveUserCmd.
	^ self usage removeUser: nameString