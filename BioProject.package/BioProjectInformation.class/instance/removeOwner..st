accessing public
removeOwner: aNameString
	" Remove the owner named aNameString from the receiver's owner "

	self register: BioRemoveOwnerCmd.
	self usage removeOwner: aNameString