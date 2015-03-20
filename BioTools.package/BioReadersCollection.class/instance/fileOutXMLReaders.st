accessing
fileOutXMLReaders

	| helper |
	helper := BioObject new.
	self doWithIndex: [ : r : index | 
		helper 
			outputToFile: index asString , BioNamedObject uniqueName , '.xml'
			contents: r contents ]