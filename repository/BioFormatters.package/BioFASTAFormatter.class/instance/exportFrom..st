accessing
exportFrom: aCollectionOrStream
	" Write aCollection to the receiver's output file name "

	| outStream |
	outStream := WriteStream on: String new.
	(BioFastaMultiRecord from: aCollectionOrStream contents)
		dumpToStream: outStream.
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: outStream contents