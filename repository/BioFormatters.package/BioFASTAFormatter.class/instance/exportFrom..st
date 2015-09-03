accessing
exportFrom: aCollectionOrStream
	" Write aCollection to the receiver's output file name "

	| outStream |
	self flag: #needsWork.
	aCollectionOrStream isString
		ifFalse: [ 
			outStream := WriteStream on: String new.
			(BioFastaMultiRecord from: aCollectionOrStream contents)
				dumpToStream: outStream ]
		ifTrue: [ outStream := aCollectionOrStream ].
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: outStream contents
