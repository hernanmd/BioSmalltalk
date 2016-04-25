accessing public
addOwner: aNameString
	" Add an user named aNameString to the receiver's owner record.
	aNameString must exists as user "

	^ (self usage isOwner: aNameString) 
		ifFalse: [ 
			self register: BioAddOwnerCmd.
			self usage addOwner: aNameString.
			(self userNamed: aNameString) addProject: self project name ]
		ifTrue: [ self signalDuplicateObject: aNameString ]