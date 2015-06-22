accessing
fileOutXMLReaders

	| helper |
	helper := BioObject new.
	self doWithIndex: [ : r : index | 
		helper 
			dumpToFileNamed: index asString , BioNamedObject uniqueName , '.xml'
			contents: r contents ]