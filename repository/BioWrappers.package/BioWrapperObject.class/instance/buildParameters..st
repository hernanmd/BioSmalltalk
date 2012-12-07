accessing private
buildParameters: stream

	self parameters do: [: parString |
		stream space.	
		stream nextPutAll: parString ]