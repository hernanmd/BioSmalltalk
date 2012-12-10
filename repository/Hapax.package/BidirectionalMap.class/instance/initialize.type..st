initialize-release
initialize: capacity type: typeClass

	forwards := typeClass new: capacity.
	backwards := typeClass new: capacity.
	[ self checkInvariant ] assert.