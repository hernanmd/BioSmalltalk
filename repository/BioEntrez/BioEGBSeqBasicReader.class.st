"
A basic reader for Entrez GBSeq XML data. Provides minimal parsing to extract key fields from GenBank sequence records.
"
Class {
	#name : 'BioEGBSeqBasicReader',
	#superclass : 'BioEXmlGBSeqReader',
	#category : 'BioEntrez-Core',
	#package : 'BioEntrez',
	#tag : 'Core'
}

{ #category : 'accessing parser' }
BioEGBSeqBasicReader >> parserClass [

	^ BioEntrezXMLGBBasicParser
]
