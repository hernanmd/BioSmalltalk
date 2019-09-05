Class {
	#name : #BioEGBSeqBasicReader,
	#superclass : #BioEXmlGBSeqReader,
	#category : 'BioEntrez-Core'
}

{ #category : #'accessing parser' }
BioEGBSeqBasicReader >> parserClass [

	^ BioEntrezXMLGBBasicParser
]
