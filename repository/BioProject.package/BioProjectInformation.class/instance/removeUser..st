accessing public
removeUser: aNameString
	" Remove the user named aNameString from the receiver's users "
	
	self register: BioRemoveUserCmd.
	^ self usage removeUser: aNameString