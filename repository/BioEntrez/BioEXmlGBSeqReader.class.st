Class {
	#name : #BioEXmlGBSeqReader,
	#superclass : #BioEntrezXmlReader,
	#category : 'BioEntrez-Core'
}

{ #category : #private }
BioEXmlGBSeqReader class >> isPreferredFor: aString [
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString includesDtd: 'http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd'
]

{ #category : #'accessing parser' }
BioEXmlGBSeqReader >> parserClass [
	" Private - We use the full parser to check validity of all downloaded nodes. GenBank commonly returns interrupted 404 contents "
	
	^ BioEntrezXMLGBFullParser
]
