accessing private
baseUrl 
	" Private - Answer a String specifying a server valid addres for the receiver "
	
	^ String streamContents: [: str | 
		self isEmpty ifFalse: [
			str 
				nextPutAll: '&id=';
				nextPutAll: ( $, join: self ) ] ]