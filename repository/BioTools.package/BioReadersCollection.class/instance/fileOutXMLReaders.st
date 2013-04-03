accessing
fileOutXMLReaders

	| helper |
	
	helper := BioObject new.
	self doWithIndex: [ : r : index | 
		helper 
			outputToFile: index asString , '-' , UUID new asString36 , '.xml'
			contents: r contents ]