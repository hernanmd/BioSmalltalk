streaming
writeAttribute: attribute value: value on: stream

	stream
		nextPutAll: (self safeIdFor: attribute);
		nextPut: $=;
		nextPutAll: (self safeIdFor: value)