accessing - private
buildParameters: stream
	" Append receiver's parameters delimited by space, to stream "

	self parameters do: [: parString |
		stream space.	
		stream nextPutAll: parString ]