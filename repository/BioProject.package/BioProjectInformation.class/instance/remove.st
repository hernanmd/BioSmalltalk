accessing public
remove
	" Set the receiver's removal information and perform
	additional actions "

	self preRemove.
	self history removeFrom: self lastUser.
	usage := nil.
	self postRemove.