private
newIdForKey: keyName
	" Answer a <String> with the last ID number given keyName. I.e. given keys like ID, ID_1, ID_2, answer ID_3 "

	^ String streamContents: [ : stream | 
		stream 
			nextPutAll: keyName;
			nextPut: $_;
			nextPutAll: (self matches keys count: [ : key | key beginsWith: keyName ]) asString ]
