"
GTEFetchDatabase groups databases supporting the fetch parameters

http://www.ncbi.nlm.nih.gov/corehtml/query/static/efetchseq_help.html#rettypeparam
"
Class {
	#name : #BioERetDatabase,
	#superclass : #BioEntrezDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #'accessing retrieval modes' }
BioERetDatabase >> retrievalMode: aString [
	" Private - Set the receiver's retrieval mode to aString "
	
	self client queryAt: 'retmode' put: aString
]

{ #category : #'accessing retrieval types' }
BioERetDatabase >> retrievalType: aString [
	" Private - Set the receiver's retrieval mode to aString "
	
	self client queryAt: 'rettype' put: aString
]

{ #category : #'accessing retrieval modes' }
BioERetDatabase >> setModeASN1 [
	" Set the receiver's retrieval mode to ASN.1 format "
	
	self retrievalMode: 'asn.1'
]

{ #category : #'accessing retrieval modes' }
BioERetDatabase >> setModeHTML [
	" Set the receiver's retrieval mode to HTML format "
	
	self retrievalMode: 'html'
]

{ #category : #'accessing retrieval modes' }
BioERetDatabase >> setModeText [
	" Set the receiver's retrieval mode to text format "
	
	self retrievalMode: 'text'
]

{ #category : #'accessing retrieval modes' }
BioERetDatabase >> setModeXML [
	" Set the receiver's retrieval mode to XML format "
	
	self retrievalMode: 'xml'
]
