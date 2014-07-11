accessing
formatFilename: dir index: index

	^ String streamContents: [: stream | 
			stream 
				nextPutAll: dir fullName;
				nextPutAll: self slash;
				nextPutAll: index asString;
				nextPutAll:  '.xml' ]