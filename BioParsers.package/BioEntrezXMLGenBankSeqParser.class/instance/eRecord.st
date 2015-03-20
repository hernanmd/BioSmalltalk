accessing
eRecord
	^ eRecord
		ifNil: [ eRecord := self entrezRecordClass new ]