accessing - private
buildPropertyValue: assoc into: stream
	" Private - Write the association assoc into stream "

	^ stream
		nextPutAll: assoc key asString;
		nextPut: self propertySeparator;
		nextPutAll: assoc value asString