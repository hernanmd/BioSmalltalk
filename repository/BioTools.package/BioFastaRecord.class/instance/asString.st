converting
asString
	" Answer the String representation of the receiver." 	
	
	^ String streamContents: [: stream |
		stream 
			nextPut: $>;
			nextPutAll: self name;
			cr;
			nextPutAll: self sequence asString;
			cr ]