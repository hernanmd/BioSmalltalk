initialize-release
initializeStream: collection
	" Private - Preallocate collection initial size "

	stream := ReadWriteStream on: (String new: (self sizeFrom: collection)).	