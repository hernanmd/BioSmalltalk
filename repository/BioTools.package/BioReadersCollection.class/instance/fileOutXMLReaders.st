accessing
fileOutXMLReaders
	" Private - Helper method to be used inside an Inspector/Explorer to dump receiver's contents in XML files "

	| helper |
	helper := BioObject new.
	self doWithIndex: [ : r : index | 
		helper 
			dumpToFileNamed: index asString , BioNamedObject uniqueName , '.xml'
			contents: r contents ]