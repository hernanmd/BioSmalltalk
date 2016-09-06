accessing public
removeOwner: nameString
	" Remove the owner named nameString from the receiver's owner "

	self register: BioRemoveOwnerCmd.
	self usage removeOwner: nameString