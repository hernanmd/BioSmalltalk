displaying
displayString

	^ String streamContents: [ : stream | 
		stream 
			nextPutAll: self name; space;
			nextPut: $(;
			nextPutAll: self repositoryVersions size asString;
			nextPut:$) ]