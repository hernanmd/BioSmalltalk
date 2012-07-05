initialize-release
initializeStream: collection

	stream := ReadWriteStream on: ( String new: ( self sizeFrom: collection ) ).	