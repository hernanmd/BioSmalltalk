initialize-release
initializeStream: collection

	stream := WriteStream on: ( String new: ( self sizeFrom: collection ) ).	