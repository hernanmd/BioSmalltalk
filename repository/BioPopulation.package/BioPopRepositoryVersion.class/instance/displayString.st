accessing
displayString

	^ String streamContents: [ : stream | 
		stream 
			nextPutAll: self name; space;
			nextPut: $(;
			nextPutAll: self bioSpecies size asString;
			nextPut:$) ]