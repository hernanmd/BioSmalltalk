"
Parser for mining sequence published data in journal references. See superclass comment for details.

| fileRef |
fileRef := BioObject testFilesFullDirectoryName / 'GenBankTestFiles' / 'TestGBSeq02.xml'.
(BioEntrezXMLGBSeqJournalParser on: fileRef readStream) collectGBSet
"
Class {
	#name : #BioEntrezXMLGBSeqJournalParser,
	#superclass : #BioEntrezXMLGBSeqParser,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioEntrezXMLGBSeqJournalParser class >> defaultNodes [

	^ { #qualifierForAccessionWithVersion .
	#qualifierForAuthor .
	#qualifierForXRefId .
	#qualifierForReferenceJournal } collect: [ : selector | BioGBSeqCollection perform: selector ]

]

{ #category : #private }
BioEntrezXMLGBSeqJournalParser >> newIdForKey: keyName [
	" Answer a <String> with the last ID number given keyName. I.e. given keys like ID, ID_1, ID_2, answer ID_3 "

	^ String streamContents: [ : stream | 
		stream 
			nextPutAll: keyName;
			nextPut: $_;
			nextPutAll: (self matches keys count: [ : key | key beginsWith: keyName ]) asString ]

]

{ #category : #private }
BioEntrezXMLGBSeqJournalParser >> saveGBNode: collectionOfNodeAssociation [

	| assoc |
	
	assoc := collectionOfNodeAssociation first.
"	self haltIf: [ assoc key = 'GBXref_id' ]."
	self matches 
		at: assoc key 
		ifPresent: [: match | self matches at: (self newIdForKey: assoc key) put: assoc value ]
		ifAbsent: [ self matches at: assoc key put: assoc value  ].

]
