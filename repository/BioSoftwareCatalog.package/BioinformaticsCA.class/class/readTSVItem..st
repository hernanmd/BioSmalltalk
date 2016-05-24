accessing
readTSVItem: record

	^ (record first = 'tool' and: [ record size > 7 ])
		ifTrue: [ self newSoftwareItem: record ]
		ifFalse: [ nil ]
